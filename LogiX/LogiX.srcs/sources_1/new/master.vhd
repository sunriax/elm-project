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
		UART_RXD	:  in STD_LOGIC;
		UART_TXD	: out STD_LOGIC;
		XADC		:  in STD_LOGIC_VECTOR(7 downto 0);
		--sysCLK		: out STD_LOGIC;
		--sysLOCK		: out STD_LOGIC;
		--vgaMODE		:  in STD_LOGIC_VECTOR(1 downto 0);
		--vgaTEST		:  in STD_LOGIC;
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
			vgaLOCK			: out STD_LOGIC
			);
	end component vga_bd;

	component analog_bd is
		port(
			CLK					: in STD_LOGIC;
			RESET				: in STD_LOGIC;
			alarm_out			: out STD_LOGIC;
			busy_out			: out STD_LOGIC;
			channel_out			: out STD_LOGIC_VECTOR ( 4 downto 0 );
			daddr_in			: in STD_LOGIC_VECTOR ( 6 downto 0 );
			den_in				: in STD_LOGIC;
			di_in				: in STD_LOGIC_VECTOR ( 15 downto 0 );
			do_out				: out STD_LOGIC_VECTOR ( 15 downto 0 );
			drdy_out			: out STD_LOGIC;
			dwe_in				: in STD_LOGIC;
			eoc_out				: out STD_LOGIC;
			eos_out				: out STD_LOGIC;
			overtemp_alarm_out	: out STD_LOGIC;
			usertemp_alarm_out	: out STD_LOGIC;
			vauxn14				: in STD_LOGIC;
			vauxn15				: in STD_LOGIC;
			vauxn6				: in STD_LOGIC;
			vauxn7				: in STD_LOGIC;
			vauxp14				: in STD_LOGIC;
			vauxp15				: in STD_LOGIC;
			vauxp6				: in STD_LOGIC;
			vauxp7				: in STD_LOGIC;
			vccaux_alarm_out	: out STD_LOGIC;
			vccbram_alarm_out	: out STD_LOGIC;
			vccint_alarm_out	: out STD_LOGIC
			);
	end component analog_bd;

	component pattern is
		generic	(
				nCHANNEL	: integer := 1;
				pxDATASIZE	: integer := 4;
				pxMAX		: integer := 12
				);
			port(
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
		generic	(
			-- Auflösung 1280x1024@60Hz
			nCLK1280x1024	: integer := 108000000;	--108 MHz @ 60 Hz
			nCLK1024x768	: integer := 65000000;	-- 65 MHz @ 60 Hz
			nCLK800x600		: integer := 40000000;	-- 40 MHz @ 60 Hz
			nCHANNEL		: integer := 1;			-- 2^nCHANNEL Anzahl möglicher Auflösungen
			pxDATASIZE		: integer := 4;			-- Pixel Auflösung in Bit pro Kanal
			pxMAX			: integer := 12			-- max. Anzahl an Pixeln (horizontal/vertikal) 2^pxMAX
			);
		port(
			EN				:  in STD_LOGIC;
			CLK1280x1024	:  in STD_LOGIC;
			CLK1024x768		:  in STD_LOGIC;
			CLK800x600		:  in STD_LOGIC;
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

	component uart is
		generic	(
			constant SYS_CLK	: integer	:= 168000000;
			constant BAUD		: integer	:= 921600;
			constant QUANTIL	: integer	:= 12;
			constant DATASIZE	: integer	:= 8;
			constant PARITY		: integer	:= 1;
			constant STOPBIT	: integer	:= 2;
			constant PARITYBIT	: STD_LOGIC	:= '0';
			constant HANDSHAKE	: STD_LOGIC	:= '1';
			constant FIFO_DEPTH	: integer	:= 80
			);
		Port(
			EN		:	in	STD_LOGIC;
			CLK		:	in	STD_LOGIC;
			FLUSH	:	in	STD_LOGIC;
			WRITE	:	in	STD_LOGIC;
			READ	:	in 	STD_LOGIC;
			dataWR	:	in	STD_LOGIC_VECTOR(DATASIZE - 1 downto 0);
			dataRD	:	out	STD_LOGIC_VECTOR(DATASIZE - 1 downto 0);
			RxD		:	in	STD_LOGIC;
			TxD		:	out	STD_LOGIC;
			FREG	:	out	STD_LOGIC_VECTOR (7 downto 0)
			);
	end component;

	--	+---------------------------------------------------------------------------+
	--	| I/O Signale																|
	--	+---------------------------------------------------------------------------+

	-- interne I/O Standardsignale
	signal intnotEN		 		: STD_LOGIC := '1';	-- invertiertes EN Signal7
	signal intnotRESET	 		: STD_LOGIC := '1';	-- invertiertes EN Signal

	--	+---------------------------------------------------------------------------+
	--	| VGA Signale																|
	--	+---------------------------------------------------------------------------+

	-- interne Systemtaktsignale
	signal intsysCLK			: STD_LOGIC := '0';	-- interner RAM Controller Takt
	signal intsysLOCK			: STD_LOGIC := '0';	-- PLL eingerastet Prüfsignal
	
	-- interne VGA Taktsignale
	signal intvgaCLK1280x1024	: STD_LOGIC := '0';	-- interner RAM Controller Takt
	signal intvgaCLK1024x768	: STD_LOGIC := '0';	-- interner RAM Controller Takt
	signal intvgaCLK800x600		: STD_LOGIC := '0';	-- interner RAM Controller Takt
	signal intvgaLOCK			: STD_LOGIC := '0';	-- PLL eingerastet Prüfsignal

	-- interne VGA Steuersignale
	signal intvgaMODE			: STD_LOGIC_VECTOR(1 downto 0);
	signal intvgaTEST			: STD_LOGIC;

	-- interner VGA Pixelzähler
	signal intpixelX			: STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
	signal intpixelY			: STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
	
	-- interne Pixeldaten
	signal intpixelDATA			: STD_LOGIC_VECTOR(11 downto 0) := (others => '0');

	--	+---------------------------------------------------------------------------+
	--	| UART Signale																|
	--	+---------------------------------------------------------------------------+

	signal intuartWRITE				: STD_LOGIC := '0';
	signal intuartREAD				: STD_LOGIC := '0';
	signal intuartTXDATA			: STD_LOGIC_VECTOR(7 downto 0);
	signal intuartRXDATA			: STD_LOGIC_VECTOR(7 downto 0);
	signal intuartFREG				: STD_LOGIC_VECTOR(7 downto 0);

	--	+---------------------------------------------------------------------------+
	--	| ANALOG Signale																|
	--	+---------------------------------------------------------------------------+

	signal intanalogREAD			: STD_LOGIC := '0';
	signal intanalogWRITE			: STD_LOGIC := '0';
	signal intanalogALARM			: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal intanalogCHANNEL			: STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
	signal intanalogADDR			: STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
	signal intanalogDATAIN			: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	signal intanalogDATAOUT			: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	signal intanalogFREG			: STD_LOGIC_VECTOR(7 downto 0)	:= (others => '0');
begin

-- Einbinden der System/VGA Takte
SYS_Clock: clock_bd port map(
						CLK			=>	CLK,
						notEN		=>	EN,
						RESET		=>	RESET,
						sysCLK		=>	intsysCLK,
						sysLOCK		=>	intsysLOCK
						);

VGA_Clock:	vga_bd	port map(
							CLK				=>	CLK,
							notEN			=>	EN,
							RESET			=>	RESET,
							CLK1280x1024	=>	intvgaCLK1280x1024,
							CLK1024x768		=>	intvgaCLK1024x768,
							CLK800x600		=>	intvgaCLK800x600,
							vgaLOCK			=>	intvgaLOCK
							);

--Analog	:	analog_bd	port map(
--								CLK					=>	CLK,
--								RESET				=>	RESET,
--								alarm_out			=>	intanalogALARM(0),
--								busy_out			=>	intanalogFREG(0),
--								channel_out			=>	intanalogCHANNEL,
--								daddr_in			=>	intanalogADDR,
--								den_in				=>	intanalogREAD,
--								di_in				=>	intanalogDATAIN,
--								do_out				=>	intanalogDATAOUT,
--								drdy_out			=>	intanalogFREG(1),
--								dwe_in				=>	intanalogWRITE,
--								eoc_out				=>	intanalogFREG(2),
--								eos_out				=>	intanalogFREG(3),
--								overtemp_alarm_out	=>	intanalogALARM(1),
--								usertemp_alarm_out	=>	intanalogALARM(2),
--								vauxn14				=>	XADC(3),
--								vauxn15				=>	XADC(7),
--								vauxn6				=>	XADC(1),
--								vauxn7				=>	XADC(5),
--								vauxp14				=>	XADC(2),
--								vauxp15				=>	XADC(6),
--								vauxp6				=>	XADC(0),
--								vauxp7				=>	XADC(4),
--								vccaux_alarm_out	=>	intanalogALARM(3),
--								vccbram_alarm_out	=>	intanalogALARM(4),
--								vccint_alarm_out	=>	intanalogALARM(5)
--								);

VGA_Pattern:	pattern	port map(
								EN			=>	intvgaLOCK,
								CLK			=>	intsysCLK,
								vgaTEST		=>	intvgaTEST,
								vgaMODE		=>	intvgaMODE,
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
								vgaMODE			=>	intvgaMODE,
								pixelDATA		=>	intpixelDATA,
								h_SYNC			=>	h_SYNC,
								v_SYNC			=>	v_SYNC,
								vgaR			=>	vgaR,
								vgaG			=>	vgaG,
								vgaB			=>	vgaB,
								pixelX			=>	intpixelX,
								pixelY			=>	intpixelY
								);

UART_Control:	uart	port map(
								EN			=>	intsysLOCK,
								CLK			=>	intsysCLK,
								FLUSH		=>	RESET,
								WRITE		=>	intuartWRITE,
								READ		=>	intuartREAD,
								dataWR		=>	intuartTXDATA,
								dataRD		=>	intuartRXDATA,
								RxD			=>	UART_RXD,
								TxD			=>	UART_TXD,
								FREG		=>	intuartFREG
								);	

end Structure;
