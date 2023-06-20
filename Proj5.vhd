library ieee;
use ieee.std_logic_1164.all;

entity Proj5 is
	port(V: in std_logic_vector(9 downto 0);	
		  T, CLK, rst: in std_logic;
		  C: in std_logic_vector(0 to 5);
		  L, dclk, sBS, saidaX: out std_logic;
		  i, scomp: out std_logic_vector(0 to 5);
		  est:out std_logic_vector(4 downto 0)
		  );
end Proj5;

architecture log of Proj5 is
	component Memoria is
   port (ck, rst, T, X : in  std_logic;
         C, Comp : in std_logic_vector(1 to 6);
         LoadRegOrig, RstRegOp, LoadRegOp, Pisca : out std_logic;
         SigSub : out std_logic_vector(2 downto 0);
         SX: out std_logic_vector(1 downto 0);
         I: out std_logic_vector(1 to 6);
			est:out std_logic_vector(4 downto 0)
			); 
	end component;
	
	component bs is
	port(
		load, clr, key3, clk: in std_logic;
		out_bs: out std_logic
		);
	end component;
	
	component ck_div is
		port (ck_in : in  std_logic;
         ck_out: out std_logic);
	end component;
	
	component bo is
	port(
		LoadRegOrig, RstRegOp, LoadRegOp, Pisca, clk: in std_logic;    
		V: in std_logic_vector(9 downto 0);
		SX: in std_logic_vector(1 downto 0);
		sig_sub: in std_logic_vector(2 downto 0);
  
		L,X: out std_logic; 
		Comp: out std_logic_vector(0 to 5));
	end component;
	
	component compmag10 is 	
	port(
	  valorA,valorB: in std_logic_vector(9 downto 0);
	  igual_geral,Amaior,Amenor: out std_logic
	);
	end component;
	
	signal Pisca, LoadRegOrig, LoadRegOp, RstRegOp, X, TBS, divCK: std_logic;
	signal SX: std_logic_vector(1 downto 0);
	signal SigSub: std_logic_vector(2 downto 0);
	signal Comp: std_logic_vector(0 to 5);
	signal nrst, nT: std_logic;
	
	begin
	nrst<=not rst;
	nT<=not T;
	
	M: Memoria port map(divCK,nrst,TBS,X,C, Comp,LoadRegOrig, RstRegOp, LoadRegOp, Pisca,SigSub,SX,i,est);
	--M: Memoria port map(divCK,nrst,TBS,X,C, "111110",LoadRegOrig, RstRegOp, LoadRegOp, Pisca,SigSub,SX,i,est);
	DP: bo port map(LoadRegOrig, RstRegOp, LoadRegOp, Pisca,divCK, V, SX, SigSub, L, X, Comp);
	cl: ck_div port map(clk,divCK);
	b: bs port map('1', '0', nT, divCK, TBS);
	--teste: compmag10 port map("0000000000","1111111111",scomp(1),scomp(0),scomp(2));
	dclk<=divCK;
	sBS<=TBS;
	saidaX<=X;
	scomp<=comp;
	
end log;