library ieee;
use ieee.std_logic_1164.all;

entity compmag10 is 	
port(
	  valorA,valorB: in std_logic_vector(9 downto 0);
	  igual_geral,Amaior,Amenor: out std_logic
);
end compmag10;

architecture ckt of compmag10 is
component compmag1 is 
	port(
		  A,B,AigualB,AmaiorB,AmenorB: in std_logic;
		  igual,maior,menor: out std_logic 
	);
end component; 

signal sig_igual1, sig_maior1, sig_menor1,
		 sig_igual2, sig_maior2, sig_menor2,
		 sig_igual3, sig_maior3, sig_menor3,
		 sig_igual4, sig_maior4, sig_menor4,
		 sig_igual5, sig_maior5, sig_menor5,
		 sig_igual6, sig_maior6, sig_menor6,
		 sig_igual7, sig_maior7, sig_menor7,
		 sig_igual8, sig_maior8, sig_menor8,
		 sig_igual9, sig_maior9, sig_menor9: std_logic;
		 
begin

C1: compmag1 port map (valorA(9),valorB(9),'1','0', '0',sig_igual1, sig_maior1, sig_menor1);
C2: compmag1 port map (valorA(8),valorB(8),sig_igual1,sig_maior1,sig_menor1,sig_igual2, sig_maior2, sig_menor2);
C3: compmag1 port map (valorA(7),valorB(7),sig_igual2,sig_maior2,sig_menor2,sig_igual3, sig_maior3, sig_menor3);
C4: compmag1 port map (valorA(6),valorB(6),sig_igual3,sig_maior3,sig_menor3,sig_igual4, sig_maior4, sig_menor4);
C5: compmag1 port map (valorA(5),valorB(5),sig_igual4,sig_maior4,sig_menor4,sig_igual5, sig_maior5, sig_menor5);
C6: compmag1 port map (valorA(4),valorB(4),sig_igual5,sig_maior5,sig_menor5,sig_igual6, sig_maior6, sig_menor6);
C7: compmag1 port map (valorA(3),valorB(3),sig_igual6,sig_maior6,sig_menor6,sig_igual7, sig_maior7, sig_menor7);
C8: compmag1 port map (valorA(2),valorB(2),sig_igual7,sig_maior7,sig_menor7,sig_igual8, sig_maior8, sig_menor8);
C9: compmag1 port map (valorA(1),valorB(1),sig_igual8,sig_maior8,sig_menor8,sig_igual9, sig_maior9, sig_menor9);
C10: compmag1 port map (valorA(0),valorB(0),sig_igual9,sig_maior9,sig_menor9,igual_geral, Amaior, Amenor);

end ckt;



