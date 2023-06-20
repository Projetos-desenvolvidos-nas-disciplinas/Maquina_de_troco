library ieee;
use ieee.std_logic_1164.all;
entity sinais is
   port (E: in  std_logic_vector(4 downto 0);
         LoadRegOrig, RstRegOp, LoadRegOp, Pisca : out std_logic;
         SigSub : out std_logic_vector(2 downto 0);
         SX: out std_logic_vector(1 downto 0);
         I: out std_logic_vector(1 to 6));  
end sinais;

architecture log of sinais is
  signal estado: std_logic_vector(0 to 19);
  begin
    estado(0) <= (NOT E(4))AND(NOT E(3))AND(NOT E(2))AND(NOT E(1))AND(NOT E(0));
    estado(1) <= (NOT E(4))AND(NOT E(3))AND(NOT E(2))AND(NOT E(1))AND(E(0));
    estado(2) <= (NOT E(4))AND(NOT E(3))AND(NOT E(2))AND(E(1))AND(NOT E(0));
    estado(3) <= (NOT E(4))AND(NOT E(3))AND(NOT E(2))AND(E(1))AND(E(0));
    estado(4) <= (NOT E(4))AND(NOT E(3))AND(E(2))AND(NOT E(1))AND(NOT E(0));
    estado(5) <= (NOT E(4))AND(NOT E(3))AND(E(2))AND(NOT E(1))AND(E(0));
    estado(6) <= (NOT E(4))AND(NOT E(3))AND(E(2))AND(E(1))AND(NOT E(0));
    estado(7) <= (NOT E(4))AND(NOT E(3))AND(E(2))AND(E(1))AND(E(0));
    estado(8) <= (NOT E(4))AND(E(3))AND(NOT E(2))AND(NOT E(1))AND(NOT E(0));
    estado(9) <= (NOT E(4))AND(E(3))AND(NOT E(2))AND(NOT E(1))AND(E(0));
    estado(10) <= (NOT E(4))AND(E(3))AND(NOT E(2))AND(E(1))AND(NOT E(0));
    estado(11) <= (NOT E(4))AND(E(3))AND(NOT E(2))AND(E(1))AND(E(0));
    estado(12) <= (NOT E(4))AND(E(3))AND(E(2))AND(NOT E(1))AND(NOT E(0));
    estado(13) <= (NOT E(4))AND(E(3))AND(E(2))AND(NOT E(1))AND(E(0));
    estado(14) <= (NOT E(4))AND(E(3))AND(E(2))AND(E(1))AND(NOT E(0));
    estado(15) <= (NOT E(4))AND(E(3))AND(E(2))AND(E(1))AND(E(0));
    estado(16) <= (E(4))AND(NOT E(3))AND(NOT E(2))AND(NOT E(1))AND(NOT E(0));
    estado(17) <= (E(4))AND(NOT E(3))AND(NOT E(2))AND(NOT E(1))AND(E(0));
    estado(18) <= (E(4))AND(NOT E(3))AND(NOT E(2))AND(E(1))AND(NOT E(0));
    estado(19) <= (E(4))AND(NOT E(3))AND(NOT E(2))AND(E(1))AND(E(0));
    
    LoadRegOrig <= estado(0);
    
    RstRegOp <= estado(0) OR estado(19);
    
    LoadRegOp <= estado(0) OR estado(2) OR estado(5) OR estado(8) OR estado(11) OR estado(14) OR estado(17) OR estado(19);
    
    Pisca <= NOT(estado(0));
    
    SigSub(0) <= estado(4) OR estado(5) OR estado(6) OR estado(10) OR estado(11) OR estado(12) OR estado(16) OR estado(17) OR estado(18);
    SigSub(1) <= estado(7) OR estado(8) OR estado(9) OR estado(10) OR estado(11) OR estado(12);
    SigSub(2) <= estado(13) OR estado(14) OR estado(15) OR estado(16) OR estado(17) OR estado(18);
    
    SX(0) <= estado(0);
    SX(1) <= estado(19);
    
    I(1) <= estado(3);
    I(2) <= estado(6);
    I(3) <= estado(9);
    I(4) <= estado(12);
    I(5) <= estado(15);
    I(6) <= estado(18);
end log;
