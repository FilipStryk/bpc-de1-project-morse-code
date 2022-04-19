----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2022 15:32:17
-- Design Name: 
-- Module Name: morse_to_bin - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity morse_to_bin is
     port(
        clk      : in  std_logic;  -- Main clock
        reset    : in  std_logic;  -- Synchronous reset       
        dot      : in  std_logic;  -- Morse code - dot
        dash     : in  std_logic;  -- Morse code - dash
        enter    : in  std_logic;  -- Submit input
        bin_i    : out  std_logic_vector(7 downto 0);
        morse_1    : out std_logic_vector(0 downto 0); -- Morse code 1 characters
        morse_2    : out std_logic_vector(1 downto 0); -- Morse code 2 characters
        morse_3    : out std_logic_vector(2 downto 0); -- Morse code 3 characters
        morse_4    : out std_logic_vector(3 downto 0); -- Morse code 4 characters
        morse_5    : out std_logic_vector(4 downto 0) -- Morse code 5 characters
    );
end entity morse_to_bin;

architecture behavioral of morse_to_bin is

    -- Local variable
    signal s_morse_local : std_logic_vector(4 downto 0);
    
    shared variable i : integer := 0;
begin
    p_morse : process(dot,dash)
    begin
        if dash = '1' then
            s_morse_local(i) <= '1';
            i:= i+1;
            end if;
        if dot = '1' then
            s_morse_local(i) <= '0';
            i:= i+1;
            end if;
    end process p_morse;
      
 p_morse_to_bin: process(clk)
    begin
        if rising_edge(clk) then
            if enter = '1' then
                case i is
                    when 1 =>
                        morse_1 <= s_morse_local(i-1 downto 0);
                        case s_morse_local(i-1 downto 0) is 
                            when "0" =>
                                bin_i <= "01000101"; -- E
                            when "1" =>
                                bin_i <= "01010100"; -- T 
                            when others =>
                                NULL;                      
                        end case; 
                    when 2 =>
                        morse_2 <= s_morse_local(i-1 downto 0); 
                        case s_morse_local(i-1 downto 0) is 
                            when "00" =>
                                bin_i <= "01001001"; -- I
                            when "10" =>
                                bin_i <= "01000001"; -- A
                            when "01" =>
                                bin_i <= "01001110"; -- N 
                            when "11" =>
                                 bin_i <= "01001101"; -- M 
                            when others =>
                                NULL;                                     
                        end case;    
                    when 3 =>
                        morse_3 <= s_morse_local(i-1 downto 0); 
                        case s_morse_local(i-1 downto 0) is 
                            when "000" =>
                                bin_i <= "01010011"; -- S
                            when "100" =>
                                bin_i <= "01010101"; -- U
                            when "010" =>
                                bin_i <= "01010010"; -- R
                            when "110" =>
                                bin_i <= "01010111"; -- W
                            when "001" =>
                                bin_i <= "01000100"; -- D
                            when "101" =>
                                bin_i <= "01001011"; -- K
                            when "011" =>
                                bin_i <= "01000111"; -- G
                            when "111" =>
                                bin_i <= "01001111"; --  O 
                            when others =>
                                NULL;                                                                    
                        end case;
                   
                    when 4 =>
                        morse_4 <= s_morse_local(i-1 downto 0);
                        case s_morse_local(i-1 downto 0) is 
                            when "0000" =>
                                bin_i <= "01001000"; -- H
                            when "1000" =>
                                bin_i <= "01010110"; -- V
                            when "0100" =>
                                bin_i <= "01000110"; -- F
                            when "0010" =>
                                bin_i <= "01001100"; -- L
                            when "0110" =>
                                bin_i <= "01010000"; -- P
                            when "1110" =>
                                bin_i <= "01001010"; -- J
                            when "0001" =>
                                bin_i <= "01000010"; -- B
                            when "1001" =>
                                bin_i <= "01011000"; -- X
                            when "0101" =>
                                bin_i <= "01000011"; -- C 
                            when "1101" =>
                                bin_i <= "01011001"; -- Y
                            when "0011" =>
                                bin_i <= "01011010"; -- Z
                            when "1011" =>
                                bin_i <= "01010001"; -- Q
                            when others =>
                                NULL;                                                               
                            end case; 
                            
                    when 5 =>
                    morse_5 <= s_morse_local(i-1 downto 0);
                    case s_morse_local(i-1 downto 0) is 
                        when "11111" =>
                            bin_i <= "00110000"; -- 0
                        when "11110" =>
                            bin_i <= "00110001"; -- 1
                        when "11100" =>
                            bin_i <= "00110010"; -- 2
                        when "11000" =>
                            bin_i <= "00110011"; -- 3
                        when "10000" =>
                            bin_i <= "00110100"; -- 4 
                        when "00000" =>
                            bin_i <= "00110101"; -- 5
                        when "00001" =>
                            bin_i <= "00110110"; -- 6 
                        when "00011" =>
                            bin_i <= "00110111"; -- 7
                        when "00111" =>
                            bin_i <= "00111000"; -- 8
                        when "01111" =>
                            bin_i <= "00111001"; -- 9
                        when others =>
                        NULL;                                              
                    end case; 
                    when others =>
                        NULL; 
                    end case;
            i:=0;              
            end if;
        end if;
    end process p_morse_to_bin;

      
       
end architecture behavioral;
