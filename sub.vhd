library ieee;
use ieee.std_logic_1164.all;

entity sub is
   port(reg_op : in std_logic_vector(9 downto 0);
        sig_sub : in std_logic_vector(2 downto 0);
        out_sub   : out std_logic_vector(9 downto 0)
        
       );
end sub;

architecture ckt of sub is
     
  component somador10b is
    port(a,b : in std_logic_vector(9 downto 0);
         cin : in std_logic;
         sum   : out std_logic_vector(9 downto 0);
        over : out std_logic);
 end component;

 component mux6x1 is
  port (
      a, b,c,d,e,f : in std_logic_vector(9 downto 0);
      sel : in std_logic_vector(2 downto 0);
      y : out std_logic_vector(9 downto 0)
  );
end component;

--signal c: std_logic_vector(9 downto 0);
--signal res_sub: std_logic_vector(5 downto 0);
signal s100,s50,s25,s10,s5,s1: std_logic_vector(9 downto 0); 
signal over100,over50,over25,over10,over5,over1: std_logic;


begin

m100: somador10b port map(a=>reg_op,b=>"0001100100",cin=>'1',sum=>s100,over=>over100);
m50: somador10b port map(a=>reg_op,b=>"0000110010",cin=>'1',sum=>s50,over=>over50);
m25: somador10b port map(a=>reg_op,b=>"0000011001",cin=>'1',sum=>s25,over=>over25);
m10: somador10b port map(a=>reg_op,b=>"0000001010",cin=>'1',sum=>s10,over=>over10);
m5: somador10b port map(a=>reg_op,b=>"0000000101",cin=>'1',sum=>s5,over=>over5);
m1: somador10b port map(a=>reg_op,b=>"0000000001",cin=>'1',sum=>s1,over=>over1);


Omux: mux6x1 port map(s100,s50,s25,s10,s5,s1,sig_sub,out_sub);

end ckt;
