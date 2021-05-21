--This is the polynomial Evaluation Unit
--It takes the argument to a polynomial and calculates its value
--The Polynomial is defined as a constant
-- in/output numbers are integers (not floating point)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;

entity polynom is
	port (
		-- synchronous interface
		rst : in std_logic; -- synchronous reset
		clk : in std_logic;
		xin : in integer;
		fx : out integer
	);
end;

architecture behav of polynom is
	
	--Polynomial Definition (same as in module)
	constant POLY_DEGREE : integer := 4; -- degree of polynomial

	type poly_coeff_type is array(0 to POLY_DEGREE) of signed(8 downto 0);

	constant POLY_COEFF : poly_coeff_type := (
			0 => to_signed(-8, 9),
			1 => to_signed(-3, 9),
			2 => to_signed(4, 9),
			3 => to_signed(-2, 9),
			4 => to_signed(1, 9)
		);
		
begin
	process(clk)
	   variable sum: integer; 
		begin
			if clk'event and clk='1' then
				if rst = '1' then      
					sum := 0;
				else
				    sum := 0;
				    for k in 0 to POLY_DEGREE loop
				        sum :=sum + (to_integer(POLY_COEFF(k)) * (xin ** k));
                     end loop;
				end if;
			end if;
			   fx <= sum;
		end process;
end architecture;