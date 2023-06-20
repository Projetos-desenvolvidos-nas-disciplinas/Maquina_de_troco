library ieee;
use ieee.std_logic_1164.all;

entity LED is
port(
pisca, clk: in std_logic;
L: out std_logic
);
end LED;

architecture ckt of LED is

signal pisca_not, out_and: std_logic;

begin

pisca_not <= not pisca;

out_and <= pisca AND clk;

L <= out_and OR pisca_not;

end ckt;
