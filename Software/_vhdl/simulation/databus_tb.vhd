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

entity databus_tb is
--  Port ( );
end databus_tb;

architecture Simulation of databus_tb is

-- Deklaration
constant sysCLK_period	: time := 10  ns;	-- Simulationstakt (100 MHz)
constant rdCLK_period	: time := 83  ns;	-- Simulationstakt (12 MHz)
constant DATASIZE	: positive := 8;

-- Komponentendeklaration
component databus is
		Port( 
			EN		:	 in STD_LOGIC;
    		sysCLK	:	 in STD_LOGIC;
    		rdCLK	:	 in STD_LOGIC;
    		RXF		:	 in STD_LOGIC;
    		TXE		:	 in STD_LOGIC;
    		READ	:	out STD_LOGIC;
    		WRITE	:	out STD_LOGIC;
			DATA	: inout STD_LOGIC_VECTOR (7 downto 0)
			);
end component databus;

signal simEN, simsysCLK, simrdCLK			: STD_LOGIC;
signal simWRITE, simREAD, simRXF, simTXE	: STD_LOGIC;
signal simDATA								: STD_LOGIC_VECTOR(DATASIZE - 1 downto 0);

begin

UUT:	databus port map	(
							EN		=>	simEN,
							sysCLK	=>	simsysCLK,
							rdCLK	=>	simrdCLK,
							WRITE	=>	simWRITE,
							READ	=>	simREAD,
							RXF		=>	simRXF,
							TXE		=>	simTXE,
							DATA	=>	simDATA
							);

-- Clock Singal erzeugen
sysCLK_process:	process
					begin
						simsysCLK <= '1';	wait for sysCLK_period/2;
						simsysCLK <= '0';	wait for sysCLK_period/2;
				end process sysCLK_process;

rdCLK_process:	process
					begin
						simrdCLK <= '1';	wait for rdCLK_period/2;
						simrdCLK <= '0';	wait for rdCLK_period/2;
				end process rdCLK_process;

-- Simulationsprozess
process
	begin
		simEN <= '0';	simRXF <= '1';	simTXE <= '1';								wait for sysCLK_period / 2;
		simEN <= '1';	simRXF <= '1';	simTXE <= '1';	simDATA <= x"73";			wait for rdCLK_period * 2;
						simRXF <= '0';	simTXE <= '0';	simDATA <= (others => 'Z');	wait for sysCLK_period * 10;

	wait;


end process;


end Simulation;
