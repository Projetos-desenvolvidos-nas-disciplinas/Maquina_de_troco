library ieee;
use ieee.std_logic_1164.all;

entity Mux_20x10 is
    port (
        a, b : in std_logic_vector(9 downto 0);
        sel : in std_logic;
        y : out std_logic_vector(9 downto 0)
    );
end Mux_20x10;

architecture ckt of Mux_20x10 is

signal selV : std_logic_vector(9 downto 0);

begin

	selV(0) <= sel;
  	selV(1) <= sel;
  	selV(2) <= sel;
	selV(3) <= sel;
	selV(4) <= sel;
	selV(5) <= sel;
	selV(6) <= sel;
	selV(7) <= sel;
	selV(8) <= sel;
	selV(9) <= sel;
  
	y <= (not selV and a) or (selV and b);

end ckt;
