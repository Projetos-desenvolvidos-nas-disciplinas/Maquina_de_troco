library ieee;
use ieee.std_logic_1164.all;

entity bo is
port(
  LoadRegOrig, RstRegOp, LoadRegOp, Pisca, clk: in std_logic;    
  V: in std_logic_vector(9 downto 0);
  SX: in std_logic_vector(1 downto 0);
  sig_sub: in std_logic_vector(2 downto 0);
  
  L,X: out std_logic; 
  Comp: out std_logic_vector(0 to 5)
);
end bo;

architecture ckt of bo is
  component Reg is
    port(
    V, out_sub: in std_logic_vector(9 downto 0);
    rst_op ,loadOri, loadOp, clr, clk: in std_logic;
    out_op: out std_logic_vector(9 downto 0)
    );
  end component;

  component bloco_comp is 	
  port(
      V_sub: in std_logic_vector(9 downto 0);
      comparacao_6b: out std_logic_vector(1 to 6)
  );
  end component;

  component sub is
    port(reg_op : in std_logic_vector(9 downto 0);
         sig_sub : in std_logic_vector(2 downto 0);
         out_sub   : out std_logic_vector(9 downto 0)
        );
  end component;
  
  component Reg_x is
    port(
    clk: in std_logic;
    SX : in std_logic_vector(1 downto 0);
    X: out std_logic
    );
  end component;

  component LED is
    port(
    pisca, clk: in std_logic;
    L: out std_logic
    );
    end component;

  signal clr: std_logic;
  signal s_out_sub: std_logic_vector(9 downto 0);
  signal out_sub: std_logic_vector(9 downto 0);
  
 begin

	Registador: Reg port map(V,s_out_sub,RstRegOp,LoadRegOrig, LoadRegOp,clr,clk,out_sub);
	Comparador: bloco_comp port map(out_sub,comp);
	Subtrator: sub port map(out_sub,sig_sub,s_out_sub);

RegX: Reg_x port map(clk,SX,X);

Ledi: LED port map(Pisca,clk,L);
      
end ckt;
 


