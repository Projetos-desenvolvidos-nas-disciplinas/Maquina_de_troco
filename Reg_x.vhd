library ieee;
use ieee.std_logic_1164.all;

entity Reg_x is
port(
clk: in std_logic;
SX : in std_logic_vector(1 downto 0);
X: out std_logic
);
end Reg_x;

architecture ckt of Reg_x is

component Reg_1bit is
port(
I, load, clr, set, clk: in std_logic;
q: out std_logic
);
end component;

signal v:std_logic;

begin

sinal_x : Reg_1bit  port map (v, '1' , SX(0), SX(1) , clk, v);
  X <= v;

end ckt;