--	------------------------------------
--	Diplomarbeit elmProject@HTL-Rankweil
--	G.Raf@elm-project
--	2AAELI | 2016/2017
--	------------------------------------
--	File: loopback_tb.vhd
--	Version: v1.0
--	------------------------------------
--	Echo Testbench
--	Stellt die Funktionsweise beliebiger
--	Schnittstellen die Daten Empfangen
--	und Rücksenden ermöglichen
--	------------------------------------

library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- niemals beide NUMERIC_STD und STD_LOGIC_ARITH verwenden!!!
--use IEEE.STD_LOGIC_ARITH.ALL;
use UNISIM.VComponents.all;


entity loopback_tb is
--  Port ( );
end loopback_tb;

architecture Simulation of loopback_tb is

-- Deklaration
constant CLK_period : time := 10 ns;	-- Simulationstakt (100 MHz)
constant DATASIZE	: positive := 8;

-- Komponentendeklaration
component loopback is
		Port(
			EN		:	in	STD_LOGIC;
			CLK		:	in	STD_LOGIC;
			WRITE	:	out	STD_LOGIC;														-- Daten auf UART schreiben
			READ	:	out	STD_LOGIC;														-- Daten von UART lesen
			dataWR	:	out	STD_LOGIC_VECTOR(DATASIZE - 1 downto 0):= (others => '0');	-- Daten über UART Senden
			dataRD	:	in	STD_LOGIC_VECTOR(DATASIZE - 1 downto 0);						-- Daten über UART Empfangen
			FREG	:	in	STD_LOGIC_VECTOR (7 downto 0) := (others => '0')				-- Flagregister	
			);
end component loopback;

signal simEN, simCLK		: STD_LOGIC;
signal simWRITE, simREAD	: STD_LOGIC;
signal simdataRD, simdataWR	: STD_LOGIC_VECTOR(DATASIZE - 1 downto 0);
signal simFREG				: STD_LOGIC_VECTOR(7 downto 0);

begin

UUT:	loopback port map	(
							EN		=>	simEN,
							CLK		=>	simCLK,
							WRITE	=>	simWRITE,
							READ	=>	simREAD,
							dataWR	=>	simdataWR,
							dataRD	=>	simdataRD,
							FREG	=>	simFREG
							);

-- Clock Singal erzeugen
CLK_process:	process
					begin
						simCLK <= '1';	wait for CLK_period/2;
						simCLK <= '0';	wait for CLK_period/2;
				end process CLK_process;

-- Simulationsprozess
process
	begin
		simEN <= '0';	wait for CLK_period/2;
		simEN <= '1';	wait for CLK_period * 100;

	wait;


end process;


end Simulation;
