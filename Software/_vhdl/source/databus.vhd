--	------------------------------------
--	Diplomarbeit elmProject@HTL-Rankweil
--	G.Raf@elm-project
--	2AAELI | 2016/2017
--	------------------------------------
--	File: structure.vhd
--	Version: v1.0
--	------------------------------------
--	Strukturmodell zur Beschreibung
--	der einzelnen Verbindungen zwischen
--	den Komponenten.
--	------------------------------------

library IEEE;
--library UNISIM;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- niemals beide NUMERIC_STD und STD_LOGIC_ARITH verwenden!!!
--use IEEE.STD_LOGIC_ARITH.ALL;
--use UNISIM.VComponents.all;

entity databus is
	Generic	(
			constant SYS_CLK	: integer := 100000000;	-- 100 MHz Systemtakt	
			constant DATASIZE	: integer := 8;			-- Datenbit Länge
			constant FIFO_DEPTH	: integer := 512			-- max. Anzahl möglicher Zeichen (für Befehlscoder/decoder)
			);
		Port( 
			EN		:	in	STD_LOGIC;									-- Modul aktiv
			CLK		:	in	STD_LOGIC;									-- Systemtakt
			FLUSH	:	in	STD_LOGIC;									-- Alles leeren
    		rSTROBE	:	in	STD_LOGIC;
    		RXF		:	in	STD_LOGIC;
    		TXE		:	in	STD_LOGIC;
    		READ	:	out STD_LOGIC;
    		WRITE	:	out STD_LOGIC;
    		--SIWU	:	out STD_LOGIC;						-- Pin steht nicht zur Verfügung
			DATA	: inout STD_LOGIC_VECTOR (DATASIZE - 1 downto 0)
			);
end databus;

architecture Behavioral of databus is


component fifo is
	Generic	(
		constant SYS_CLK	: integer;
		constant FIFO_ADDR	: integer;
		constant FIFO_DATA	: integer
		);
	Port(
		EN, CLK, FLUSH	: in  STD_LOGIC;
		writeEN, readEN	: in  STD_LOGIC;
		dataIN			: in  STD_LOGIC_VECTOR (DATASIZE - 1 downto 0);
		dataOUT			: out STD_LOGIC_VECTOR (DATASIZE - 1 downto 0);
		FULL, EMPTY		: out STD_LOGIC
		);
end component fifo;

	-- Systemvariablen
	signal setDATA	:	STD_LOGIC_VECTOR(7 downto 0) := (others => '1');
	signal getDATA	:	STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal intWRITE	:	STD_LOGIC := '0';
	signal intREAD	:	STD_LOGIC := '1';

	signal writeEN	:	STD_LOGIC := '0';
	signal readEN	:	STD_LOGIC := '0';
	signal FULL		:	STD_LOGIC;
	signal EMPTY	:	STD_LOGIC;

begin

	-- Einbinden des Empfangs Fifo
	txFIFO:	fifo	generic map	(
					 			SYS_CLK		=>	SYS_CLK,
					 			FIFO_ADDR	=>	FIFO_DEPTH,
					 			FIFO_DATA	=>	DATASIZE
					 			)
						port map(
								EN		=>	EN,
								CLK		=>	CLK,
								FLUSH	=>	FLUSH,
								writeEN	=>	writeEN,
								readEN	=>	readEN,
								dataIN	=>	getDATA,
								dataOUT	=>	setDATA,
								FULL	=>	FULL,
								EMPTY	=>	EMPTY
								);


	DATA <= setDATA WHEN TXE = '0' AND FLUSH = '0' ELSE (others => 'Z');
	getDATA <= DATA WHEN TXE = '1' AND FLUSH = '0' ELSE (others => 'Z');

	READ  <= intREAD  WHEN EN = '1' ELSE '1';
	WRITE <= intWRITE WHEN EN = '1' ELSE '0';

readDATA:	process(CLK)
				begin
					if(rising_edge(CLK) and EN = '1') Then
						
					end if;
			end process readDATA;

writeDATA:	process(CLK)
				begin
					if(rising_edge(CLK) and EN = '1') Then
					
					end if;
			end process writeDATA;



end Behavioral;
