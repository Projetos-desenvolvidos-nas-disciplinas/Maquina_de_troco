library ieee;
use ieee.std_logic_1164.all;

entity somador10b is
   port(a,b : in std_logic_vector(9 downto 0);
        cin : in std_logic;
        sum   : out std_logic_vector(9 downto 0);
       over : out std_logic);
end somador10b;

architecture ckt of somador10b is
     
    component somador
        port (x,y : in std_logic;
              cin : in std_logic;
                s : out std_logic;
             cout : out std_logic);
    end component;

signal c: std_logic_vector(9 downto 0);
signal nb: std_logic_vector(9 downto 0);


begin

nb <= not b;

s0: somador port map(x=>a(0), y=>nb(0), cin=>cin, s=>sum(0), cout=>c(0));
s1: somador port map(x=>a(1), y=>nb(1), cin=>c(0), s=>sum(1), cout=>c(1));
s2: somador port map(x=>a(2), y=>nb(2), cin=>c(1), s=>sum(2), cout=>c(2));
s3: somador port map(x=>a(3), y=>nb(3), cin=>c(2), s=>sum(3), cout=>c(3));
s4: somador port map(x=>a(4), y=>nb(4), cin=>c(3), s=>sum(4), cout=>c(4));
s5: somador port map(x=>a(5), y=>nb(5), cin=>c(4), s=>sum(5), cout=>c(5));
s6: somador port map(x=>a(6), y=>nb(6), cin=>c(5), s=>sum(6), cout=>c(6));
s7: somador port map(x=>a(7), y=>nb(7), cin=>c(6), s=>sum(7), cout=>c(7));

s8: somador port map(x=>a(8), y=>nb(8), cin=>c(7), s=>sum(8), cout=>c(8));
s9: somador port map(x=>a(9), y=>nb(9), cin=>c(8), s=>sum(9), cout=>c(9));

over <= c(6) xor c(7);

end ckt;


