library ieee;
use ieee.std_logic_1164.all;

entity Reg_10bits is
port(
I: in std_logic_vector(9 downto 0);
load, clr, clk: in std_logic;
Q: out std_logic_vector(9 downto 0)
);
end Reg_10bits;

architecture ckt of Reg_10bits is

component Reg_1bit is
port(
I, load, clr, set, clk: in std_logic;
q: out std_logic
);
end component;

begin


Q9: reg_1bit port map (I(9), load, clr, '0', clk, Q(9));
Q8: reg_1bit port map (I(8), load, clr, '0', clk, Q(8));
Q7: reg_1bit port map (I(7), load, clr, '0', clk, Q(7));

Q6: reg_1bit port map (I(6), load, clr, '0', clk, Q(6));
Q5: reg_1bit port map (I(5), load, clr, '0', clk, Q(5));
Q4: reg_1bit port map (I(4), load, clr, '0', clk, Q(4));
Q3: reg_1bit port map (I(3), load, clr, '0', clk, Q(3));

Q2: reg_1bit port map (I(2), load, clr, '0', clk, Q(2));
Q1: reg_1bit port map (I(1), load, clr, '0', clk, Q(1));
Q0: reg_1bit port map (I(0), load, clr, '0', clk, Q(0));


end ckt;
