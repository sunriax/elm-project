--	------------------------------------
--	Diplomarbeit elmProject@HTL-Rankweil
--	G.Raf@elmProject
--	2AAELI | 2016/2017
--	------------------------------------
--	File: master_tb.vhd
--	Version: v1.0
--	------------------------------------
--	Testbench zur master IP mit
--	Standardparametern.
--	------------------------------------

library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use UNISIM.VComponents.all;

entity master_tb is
--  Port ( );
end master_tb;

architecture Simulation of master_tb is

	-- Simulationskonstanten
	constant CLK_period : time := 10 ns;    -- Systemtakt 100 MHz

	-- Simulations I/O Signale
	signal simCLK		: STD_LOGIC;
	signal simEN		: STD_LOGIC;
	signal simRESET		: STD_LOGIC;
	signal simsysCLK	: STD_LOGIC;
	signal simsysLOCK	: STD_LOGIC;
	signal simvgaMODE	: STD_LOGIC_VECTOR(1 downto 0);
	signal simvgaTEST	: STD_LOGIC;
	signal simpixelDATA	: STD_LOGIC_VECTOR(11 downto 0);
	signal simh_SYNC	: STD_LOGIC;
	signal simv_SYNC	: STD_LOGIC;
	signal simvgaR		: STD_LOGIC_VECTOR(3 downto 0);
	signal simvgaG		: STD_LOGIC_VECTOR(3 downto 0);
	signal simvgaB		: STD_LOGIC_VECTOR(3 downto 0);
	--signal simpixelX	: STD_LOGIC_VECTOR(11 downto 0);
	--signal simpixelY	: STD_LOGIC_VECTOR(11 downto 0);

	-- Komponentendeklaration
	component master is
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
			vgaB		: out STD_LOGIC_VECTOR(3 downto 0)--;
			--pixelX		: out STD_LOGIC_VECTOR(11 downto 0);
			--pixelY		: out STD_LOGIC_VECTOR(11 downto 0)
			);
	end component master;

begin

-- Clock Singal erzeugen
simCLK_PROC:	process
					begin
					simCLK <= '0';	wait for CLK_period/2;
					simCLK <= '1';	wait for CLK_period/2;
				end process simCLK_PROC;

-- Unit under Test
UUT: master port map(
					CLK			=> simCLK,
					EN			=> simEN,
					RESET		=> simRESET,
					sysCLK		=> simsysCLK,
					sysLOCK		=> simsysLOCK,
					vgaMODE		=> simvgaMODE,
					vgaTEST		=> simvgaTEST,
					pixelDATA	=> simpixelDATA,
					h_SYNC		=> simh_SYNC,
					v_SYNC		=> simv_SYNC,
					vgaR		=> simvgaR,
					vgaG		=> simvgaG,
					vgaB		=> simvgaB--,
					--pixelX		=> simpixelX,
					--pixelY		=> simpixelY
					);

-- Testbench Input Signale
process
	begin
		simEN <= '0';	simRESET <= '1';	simvgaTEST <= '0';	simvgaMODE <= "00";	simpixelDATA <= (others => '0');	wait for CLK_period * 2;
		simEN <= '1';	simRESET <= '0';	simvgaTEST <= '1';	simvgaMODE <= "00";	simpixelDATA <= (others => '0');	wait for CLK_period * 8000;
																simvgaMODE <= "01";	simpixelDATA <= (others => '0');	wait for CLK_period * 8000;
																simvgaMODE <= "10";	simpixelDATA <= (others => '0');	wait for CLK_period * 8000;
																simvgaMODE <= "11";	simpixelDATA <= (others => '0');	wait for CLK_period * 16000;
		simEN <= '0';	simRESET <= '1';	simvgaTEST <= '0';	simvgaMODE <= "00";	simpixelDATA <= (others => '0');	wait for CLK_period * 2;
		wait;
end process;

end Simulation;
