library ieee;
use ieee.std_logic_1164.all;
entity mde is
   port (ck, rst, T, X : in  std_logic;
         C, Comp : in std_logic_vector(1 to 6);
         E : out std_logic_vector(4 downto 0));
end mde;
architecture logica of mde is
  type st is (E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19);  
  signal estado : st;
  signal verC : std_logic_vector(1 to 5);
  signal L1, L2 : std_logic;                        
begin
  verC <= (NOT C(1 to 5)) OR Comp(1 to 5);
  L1 <= Comp(6) AND (NOT X);
  L2 <= ((NOT Comp(6)) AND (NOT C(6))) OR (Comp(6) AND X);
  process (ck, rst)
  begin
    if rst = '1' then                 
      estado <= E0;                   
    elsif (ck'event and ck ='1') then    
      case estado is
        when E0 =>                         
          if T = '1' then estado <= E1; 
          else            estado <= E0; 
          end if;
        when E1 =>                         
          if verC(1) = '1' then estado <= E4; 
          else                  estado <= E2;
          end if;
        when E2 =>                         
          if X = '1' then estado <= E3;
          else            estado <= E1; 
          end if;
        when E3 =>                         
          if X = '1' then estado <= E1;
          else            estado <= E3;
          end if;
        when E4 =>
          if verC(2) = '1' then estado <= E7;
          else                  estado <= E5;
          end if;
        when E5 =>
          if X = '1' then estado <= E6;
          else            estado <= E4;
          end if;
        when E6 =>
          if X = '1' then estado <= E4;
          else            estado <= E6;
          end if;
        when E7 =>
          if verC(3) = '1' then estado <= E10;
          else                  estado <= E8;
          end if;
        when E8 =>
          if X = '1' then estado <= E9;
          else            estado <= E7;
          end if;
        when E9 =>
          if X = '1' then estado <= E7;
          else            estado <= E9;
          end if;
        when E10 =>
          if verC(4) = '1' then estado <= E13;
          else                  estado <= E11;
          end if;
        when E11 =>
          if X = '1' then estado <= E12;
          else            estado <= E10;
          end if;
        when E12 =>
          if X = '1' then estado <= E10;
          else            estado <= E12;
          end if;
        when E13 =>
          if verC(5) = '1' then estado <= E16;
          else                  estado <= E14;
          end if;
        when E14 =>
          if X = '1' then estado <= E15;
          else            estado <= E13;
          end if;
        when E15 =>
          if X = '1' then estado <= E13;
          else            estado <= E15;
          end if;
        when E16 =>
          if L1 = '1'   then estado <= E19;
          else
            if L2 = '1' then estado <= E0;
            else             estado <= E17;
            end if;
          end if;
        when E17 =>
          if X = '1' then estado <= E18;
          else            estado <= E16;
          end if;
        when E18 =>
          if X = '1' then estado <= E16;
          else            estado <= E18;
          end if;
        when E19 =>
          if X = '1' then estado <= E1;
          else            estado <= E19;
          end if;
       end case;
    end if;
  end process;
  
  with estado select  
    E <= "00000" when E0,
         "00001" when E1, 
         "00010" when E2, 
         "00011" when E3,
         "00100" when E4,
         "00101" when E5, 
         "00110" when E6, 
         "00111" when E7,
         "01000" when E8,
         "01001" when E9, 
         "01010" when E10, 
         "01011" when E11,
         "01100" when E12,
         "01101" when E13, 
         "01110" when E14, 
         "01111" when E15,
         "10000" when E16,
         "10001" when E17, 
         "10010" when E18, 
         "10011" when E19;
end logica; 
