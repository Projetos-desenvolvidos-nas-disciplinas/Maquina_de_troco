library ieee;
use ieee.std_logic_1164.all;

entity mux6x1 is
    port (
        a, b,c,d,e,f : in std_logic_vector(9 downto 0);
        sel : in std_logic_vector(2 downto 0);
        y : out std_logic_vector(9 downto 0)
    );
end mux6x1;

architecture ckt of mux6x1 is
  --signal selV : std_logic_vector(3 downto 0);
 signal s2,s1,s0: std_logic_vector(9 downto 0);
begin
s2 <= sel(2) & sel(2) & sel(2) & sel(2) & sel(2) & sel(2) & sel(2) & sel(2) & sel(2) & sel(2);
s1 <= sel(1) & sel(1) & sel(1) & sel(1) & sel(1) & sel(1) & sel(1) & sel(1) & sel(1) & sel(1);
s0 <= sel(0) & sel(0) & sel(0) & sel(0) & sel(0) & sel(0) & sel(0) & sel(0) & sel(0) & sel(0);
    
  y <= ((not s2 and not s1 and not s0) and a) or ((not s2 and not s1 and s0) and b)
	or ((not s2 and s1 and not s0) and c) or ((not s2 and s1 and s0) and d)
	or ((s2 and not s1 and not s0) and e) or ((s2 and not s1 and s0) and f);
end ckt;
