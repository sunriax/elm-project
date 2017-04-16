--	------------------------------------
--	Diplomarbeit elmProject@HTL-Rankweil
--	G.Raf@elm-project
--	2AAELI | 2016/2017
--	------------------------------------
--	File: pipeline_tb.vhd
--	Version: v1.0
--	------------------------------------
--	PIPELINE Testbench
--	Stellt die Funktionsweise der
--	Pipeline und dessen Funktionen dar
--	------------------------------------

library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- niemals beide NUMERIC_STD und STD_LOGIC_ARITH verwenden!!!
--use IEEE.STD_LOGIC_ARITH.ALL;
use UNISIM.VComponents.all;

entity pipeline_tb is
--  Port ( );
end pipeline_tb;

architecture Simulation of pipeline_tb is

-- Deklaration
constant CLK_period : time := 10 ns;	-- Simulationstakt (100 MHz)
constant simDATA_LOOP	: natural := 4;
constant simDATA_WIDTH	: natural := 8;

signal simEN, simCLK			: STD_LOGIC;
signal simdataIN, simdataOUT	: STD_LOGIC_VECTOR(simDATA_WIDTH - 1 downto 0);

-- Komponentendeklaration
component pipeline is
	Generic	(
			constant DATA_LOOP	: integer;	-- Einstellung des Taktversatzes
			constant DATA_WIDTH	: integer	-- Einstellung der Datenbreite
			);
		Port(
			EN		: in  STD_LOGIC;
			CLK		: in  STD_LOGIC;
			dataIN	: in  STD_LOGIC_VECTOR(simDATA_WIDTH - 1 downto 0);
			dataOUT	: out STD_LOGIC_VECTOR(simDATA_WIDTH - 1 downto 0)
			);
end component pipeline;

begin

UUT:	pipeline generic map(
							DATA_LOOP	=>	simDATA_LOOP,
							DATA_WIDTH	=>	simDATA_WIDTH
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
		simEN <= '0';	simdataIN <= (others => '0');	wait for CLK_PERIOD;
		simEN <= '1'; 	simdataIN <= x"0F";				wait for CLK_PERIOD*2;
		simEN <= '0';	simdataIN <= x"00";				wait for CLK_PERIOD*3;
		simEN <= '1'; 	simdataIN <= x"F0";				wait for CLK_PERIOD*2;
		
		wait;
		
end process;


end Simulation;
