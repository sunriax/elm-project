--	------------------------------------
--	Diplomarbeit elmProject@HTL-Rankweil
--	G.Raf@elm-project
--	2AAELI | 2016/2017
--	------------------------------------
--	File: pipelogic_tb.vhd
--	Version: v1.0
--	------------------------------------
--	PIPELOGIC Testbench
--	Stellt die Funktionsweise der
--	Pipelogic und dessen Funktionen dar
--	------------------------------------

library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- niemals beide NUMERIC_STD und STD_LOGIC_ARITH verwenden!!!
--use IEEE.STD_LOGIC_ARITH.ALL;
use UNISIM.VComponents.all;

entity pipelogic_tb is
--  Port ( );
end pipelogic_tb;

architecture Simulation of pipelogic_tb is

-- Deklaration
constant CLK_period : time := 10 ns;	-- Simulationstakt (100 MHz)
constant simDATA_LOOP	: natural := 4;

signal simEN, simCLK			: STD_LOGIC;
signal simdataIN, simdataOUT	: STD_LOGIC;

-- Komponentendeklaration
component pipelogic is
	Generic	(
			constant DATA_LOOP	: integer	-- Einstellung des Taktversatzes
			);
		Port(
			EN		: in  STD_LOGIC;
			CLK		: in  STD_LOGIC;
			dataIN	: in  STD_LOGIC;
			dataOUT	: out STD_LOGIC
			);
end component pipelogic;

begin

UUT:	pipelogic generic map(
							DATA_LOOP	=>	simDATA_LOOP
							)
				 port map	(
							EN			=>	simEN,
							CLK			=>	simCLK,
							dataIN		=>	simdataIN,
							dataOUT		=>	simdataOUT
							);

-- Clock Singal erzeugen
CLK_process:	process
					begin
						simCLK <= '0';	wait for CLK_period/2;
						simCLK <= '1';	wait for CLK_period/2;
				end process CLK_process;

-- Simulationsprozess
process
	begin
		-- Initialisierung
		simEN <= '0';	simdataIN <= '0';	wait for CLK_PERIOD;
		simEN <= '1'; 	simdataIN <= '1';				wait for CLK_PERIOD*2;
		simEN <= '0';	simdataIN <= '0';				wait for CLK_PERIOD*3;
		simEN <= '1'; 	simdataIN <= '1';				wait for CLK_PERIOD;
		simEN <= '1'; 	simdataIN <= '0';				wait for CLK_PERIOD;
		simEN <= '1'; 	simdataIN <= '1';				wait for CLK_PERIOD;
		simEN <= '1'; 	simdataIN <= '0';				wait for CLK_PERIOD;
		
		wait;
		
end process;


end Simulation;
