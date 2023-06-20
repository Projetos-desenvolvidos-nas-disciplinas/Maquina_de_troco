library ieee;
use ieee.std_logic_1164.all;
entity Memoria is
   port (ck, rst, T, X : in  std_logic;
         C, Comp : in std_logic_vector(1 to 6);
         LoadRegOrig, RstRegOp, LoadRegOp, Pisca : out std_logic;
         SigSub : out std_logic_vector(2 downto 0);
         SX: out std_logic_vector(1 downto 0);
         I: out std_logic_vector(1 to 6);
			est:out std_logic_vector(4 downto 0));  
end Memoria;

architecture log of Memoria is
  
  component mde is
    port (ck, rst, T, X : in  std_logic;
          C, Comp : in std_logic_vector(1 to 6);
          E : out std_logic_vector(4 downto 0));
  end component;
  
  component sinais is
    port (E: in  std_logic_vector(4 downto 0);
          LoadRegOrig, RstRegOp, LoadRegOp, Pisca : out std_logic;
          SigSub : out std_logic_vector(2 downto 0);
          SX: out std_logic_vector(1 downto 0);
          I: out std_logic_vector(1 to 6));  
  end component;

  
  signal E: std_logic_vector(4 downto 0);
  begin
  est<=E;
  U1: mde port map(ck, rst, T, X, C, Comp, E);
  U2: sinais port map(E, LoadRegOrig, RstRegOp, LoadRegOp, Pisca, SigSub, SX, I);
  
end log;