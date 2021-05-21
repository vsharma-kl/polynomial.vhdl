library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity polynom_tb is
end;

architecture sim of polynom_tb is
    constant CLK_PERIOD : time := 10 ns;
  component polynom
  	port (
  		rst : in std_logic;
  		clk : in std_logic;
  		xin : in integer;
  		fx : out integer
  	);
  end component;

  signal rst: std_logic;
  signal clk: std_logic;
  signal xin: integer;
  signal fx: integer ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: polynom port map ( rst => rst,
                          clk => clk,
                          xin => xin,
                          fx  => fx );

  stimulus: process
  begin
  
    rst	<= '1';
    wait for CLK_PERIOD;
    rst	<= '0';
    
    xin <= 1;
    wait for CLK_PERIOD;
    
    xin <= 2;
    wait for CLK_PERIOD;
    
    xin <= 3;
    wait for CLK_PERIOD;
    
    xin <= 4;
    wait for CLK_PERIOD;
    
    xin <= 5;
    wait for CLK_PERIOD;
    
    xin <= 6;
    wait for CLK_PERIOD;
    wait for 20000*CLK_PERIOD;
    assert false report "Simulation terminated!" severity failure;

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  