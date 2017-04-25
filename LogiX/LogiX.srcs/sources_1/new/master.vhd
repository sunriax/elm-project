--	------------------------------------
--	Diplomarbeit elmProject@HTL-Rankweil
--	G.Raf@elmProject
--	2AAELI | 2016/2017
--	------------------------------------
--	File: master.vhd
--	Version: v1.0
--	------------------------------------
--	Verbindungsmodell (Structure) der
--	entwickelten Komponenten
--	------------------------------------

-- Standardbibliotheken einbinden
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity master is
	Port(
		CLK		 	:  in STD_LOGIC;
		EN			:  in STD_LOGIC;
		RESET		:  in STD_LOGIC;
		sysCLK		: out STD_LOGIC;
		sysLOCK		: out STD_LOGIC;
		vgaMODE		:  in STD_LOGIC_VECTOR(1 downto 0);
		vgaTEST		:  in STD_LOGIC;
		pixelDATA	:  in STD_LOGIC_VECTOR(11 downto 0);
		h_SYNC		: out STD_LOGIC;
		v_SYNC		: out STD_LOGIC;
		vgaR		: out STD_LOGIC_VECTOR(3 downto 0);
		vgaG		: out STD_LOGIC_VECTOR(3 downto 0);
		vgaB		: out STD_LOGIC_VECTOR(3 downto 0)
		);
end master;

architecture Structure of master is

	component clock_bd is
		port(
			CLK			:  in STD_LOGIC;
			notEN		:  in STD_LOGIC;
			RESET		:  in STD_LOGIC;
			sysCLK		: out STD_LOGIC;
			sysLOCK		: out STD_LOGIC
			);
	end component clock_bd;

	component vga_bd is
		port(
			CLK				:  in STD_LOGIC;
			notEN			:  in STD_LOGIC;
			RESET			:  in STD_LOGIC;
			CLK1280x1024	: out STD_LOGIC;
			CLK1024x768		: out STD_LOGIC;
			CLK800x600		: out STD_LOGIC;
			CLK640x480		: out STD_LOGIC;
			vgaLOCK			: out STD_LOGIC
			);
	end component vga_bd;

	component pattern is
		Generic	(
				nCHANNEL	: integer := 1;
				pxDATASIZE	: integer := 4;
				pxMAX		: integer := 12
				);
			Port(
				EN			:  in STD_LOGIC;
				CLK			:  in STD_LOGIC;
				vgaTEST		:  in STD_LOGIC;
				vgaMODE		:  in STD_LOGIC_VECTOR(nCHANNEL downto 0);
				pixelX		:  in STD_LOGIC_VECTOR(pxMAX - 1 downto 0);
				pixelY		:  in STD_LOGIC_VECTOR(pxMAX - 1 downto 0);
				vgaDATA		:  in STD_LOGIC_VECTOR((pxDATASIZE * 3) - 1 downto 0);
				pixelDATA	: out STD_LOGIC_VECTOR((pxDATASIZE * 3) - 1 downto 0)
				);
	end component pattern;

	component display is
		Generic	(
			-- Auflösung 1280x1024@60Hz
			nCLK1280x1024	: integer := 108000000;	--108 MHz @ 60 Hz
			nCLK1024x768	: integer := 65000000;	-- 65 MHz @ 60 Hz
			nCLK800x600		: integer := 40000000;	-- 40 MHz @ 60 Hz
			nCLK640x480		: integer := 25175000;	-- 25.175 MHz @ 60 Hz
			nCHANNEL		: integer := 1;			-- 2^nCHANNEL Anzahl möglicher Auflösungen
			pxDATASIZE		: integer := 4;			-- Pixel Auflösung in Bit pro Kanal
			pxMAX			: integer := 12			-- max. Anzahl an Pixeln (horizontal/vertikal) 2^pxMAX
			);
	Port	(
			EN				:  in STD_LOGIC;
			CLK1280x1024	:  in STD_LOGIC;
			CLK1024x768		:  in STD_LOGIC;
			CLK800x600		:  in STD_LOGIC;
			CLK640x480		:  in STD_LOGIC;
			vgaMODE			:  in STD_LOGIC_VECTOR((2**nCHANNEL) - 1 downto 0);
			pixelDATA		:  in STD_LOGIC_VECTOR((pxDATASIZE * 3) - 1 downto 0);
			h_SYNC			: out STD_LOGIC;
			v_SYNC			: out STD_LOGIC;
			vgaR			: out STD_LOGIC_VECTOR(pxDATASIZE - 1 downto 0);
			vgaG			: out STD_LOGIC_VECTOR(pxDATASIZE - 1 downto 0);
			vgaB			: out STD_LOGIC_VECTOR(pxDATASIZE - 1 downto 0);
			pixelX			: out STD_LOGIC_VECTOR(11 downto 0);
			pixelY			: out STD_LOGIC_VECTOR(11 downto 0)
			);
		end component display;

	-- interne I/O Standardsignale
	signal intnotEN		 		: STD_LOGIC := '1';	-- invertiertes EN Signal7
	signal intnotRESET	 		: STD_LOGIC := '1';	-- invertiertes EN Signal

	-- interne VGA Takt/PLL variablen
	signal intsysCLK			: STD_LOGIC := '0';	-- interner RAM Controller Takt
	signal intsysLOCK			: STD_LOGIC := '0';	-- PLL eingerastet Prüfsignal
	
	signal intvgaCLK1280x1024	: STD_LOGIC := '0';	-- interner RAM Controller Takt
	signal intvgaCLK1024x768	: STD_LOGIC := '0';	-- interner RAM Controller Takt
	signal intvgaCLK800x600		: STD_LOGIC := '0';	-- interner RAM Controller Takt
	signal intvgaCLK640x480		: STD_LOGIC := '0';	-- interner RAM Controller Takt
	signal intvgaLOCK			: STD_LOGIC := '0';	-- PLL eingerastet Prüfsignal

	-- interner VGA Pixelzähler
	signal intpixelX			: STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
	signal intpixelY			: STD_LOGIC_VECTOR(11 downto 0) := (others => '0');

	signal intpixelDATA			: STD_LOGIC_VECTOR(11 downto 0) := (others => '0');

begin

-- Standardsignale
intnotEN <= not(EN);	-- Anlegen eines Invertierten EN Signales
intnotRESET <= not(RESET);

-- Komponentenspezifische Signale
-- Taktzuweisung
sysCLK	<= intsysCLK;
sysLOCK	<= intsysLOCK;

-- Einbinden der System/VGA Takte
Clock: clock_bd port map(
						CLK			=>	CLK,
						notEN		=>	intnotEN,
						RESET		=>	intnotRESET,
						sysCLK		=>	intsysCLK,
						sysLOCK		=>	intsysLOCK
						);

VGA_Clock:	vga_bd	port map(
							CLK				=>	CLK,
							notEN			=>	intnotEN,
							RESET			=>	intnotRESET,
							CLK1280x1024	=>	intvgaCLK1280x1024,
							CLK1024x768		=>	intvgaCLK1024x768,
							CLK800x600		=>	intvgaCLK800x600,
							CLK640x480		=>	intvgaCLK640x480,
							vgaLOCK			=>	intvgaLOCK
							);

VGA_Pattern:	pattern	port map(
								EN			=>	EN,
								CLK			=>	intsysCLK,
								vgaTEST		=>	vgaTEST,
								vgaMODE		=>	vgaMODE,
								pixelX		=>	intpixelX,
								pixelY		=>	intpixelY,
								vgaDATA		=>	pixelDATA,
								pixelDATA 	=>	intpixelDATA
								);

VGA_Display:	display	port map(
								EN				=>	intvgaLOCK,
								CLK1280x1024	=>	intvgaCLK1280x1024,
								CLK1024x768		=>	intvgaCLK1024x768,
								CLK800x600		=>	intvgaCLK800x600,
								CLK640x480		=>	intvgaCLK640x480,
								vgaMODE			=>	vgaMODE,
								pixelDATA		=>	intpixelDATA,
								h_SYNC			=>	h_SYNC,
								v_SYNC			=>	v_SYNC,
								vgaR			=>	vgaR,
								vgaG			=>	vgaG,
								vgaB			=>	vgaB,
								pixelX			=>	intpixelX,
								pixelY			=>	intpixelY
								);		
end Structure;
