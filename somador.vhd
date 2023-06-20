library ieee;
use ieee.std_logic_1164.all;

entity somador is
  port (x,y : in std_logic;
        cin : in std_logic;
          s : out std_logic;
       cout : out std_logic);
end somador;

architecture ckt of somador is

begin

   s    <= (x xor y xor cin);
   cout <= (x and y) or (x and cin) or (y and cin);

end ckt;

