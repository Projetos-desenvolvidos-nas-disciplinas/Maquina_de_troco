library ieee;
use ieee.std_logic_1164.all;

entity bloco_comp is 	
port(
	  V_sub: in std_logic_vector(9 downto 0);
	  comparacao_6b: out std_logic_vector(0 to 5)
);
end bloco_comp;

architecture ckt of bloco_comp is

component compmag10 is 
port(
	  valorA,valorB: in std_logic_vector(9 downto 0);
	  igual_geral,Amaior,Amenor: out std_logic
);
end component;

signal sig_igual1, sig_maior1, sig_menor1,
		 sig_igual2, sig_maior2, sig_menor2,
		 sig_igual3, sig_maior3, sig_menor3,
		 sig_igual4, sig_maior4, sig_menor4,
		 sig_igual5, sig_maior5, sig_menor5,
		 sig_igual6, sig_maior6, sig_menor6: std_logic;


begin

comp1: compmag10 port map (v_sub,"0001100100",sig_igual1, sig_maior1, sig_menor1); -- se Ã© menor do que 1,00 (valor x por 100)
comparacao_6b(0) <= (sig_menor1);  

comp2: compmag10 port map (v_sub,"0000110010",sig_igual2, sig_maior2, sig_menor2); -- se Ã© menor do que 0,50 (valor x por 100)
comparacao_6b(1) <= (sig_menor2); 

comp3: compmag10 port map (v_sub,"0000011001",sig_igual3, sig_maior3, sig_menor3); -- se Ã© menor do que 0,25 (valor x por 100)
comparacao_6b(2) <= (sig_menor3); 

comp4: compmag10 port map (v_sub,"0000001010",sig_igual4, sig_maior4, sig_menor4); -- se Ã© menor do que 0,10 (valor x por 100)
comparacao_6b(3) <= (sig_menor4); 

comp5: compmag10 port map (v_sub,"0000000101",sig_igual5, sig_maior5, sig_menor5); -- se Ã© menor do que 0,05 (valor x por 100)
comparacao_6b(4) <= (sig_menor5); 

comp6: compmag10 port map (v_sub,"0000000001",sig_igual6, sig_maior6, sig_menor6); -- se Ã© menor do que 0,01 (valor x por 100)
comparacao_6b(5) <= (sig_menor6);



end ckt;