
library ieee;
use ieee.std_logic_1164.all;

entity Reg is
port(
V, out_sub: in std_logic_vector(9 downto 0);
rst_op ,loadOri, loadOp, clr, clk: in std_logic;
out_op: out std_logic_vector(9 downto 0)
);
end Reg;

architecture ckt of Reg is

component Reg_10bits is
port(
I: in std_logic_vector(9 downto 0);
load, clr, clk: in std_logic;
Q: out std_logic_vector(9 downto 0)
);


end component;

component Mux_20x10 is
    port (
        a, b : in std_logic_vector(9 downto 0);
        sel : in std_logic;
        y : out std_logic_vector(9 downto 0));


end component;
 
signal reg_or : std_logic_vector(9 downto 0);
signal mux_op : std_logic_vector(9 downto 0);

begin

reg_original : Reg_10bits port map ( V, loadOri, clr, clk, reg_or );

mux : Mux_20x10   port map ( out_sub, reg_or, rst_op, mux_op ); -- p/0 = reg_or e p/1 = out_sub

reg_operacao : Reg_10bits port map ( mux_op, loadOp, clr, clk, out_op);


end ckt;