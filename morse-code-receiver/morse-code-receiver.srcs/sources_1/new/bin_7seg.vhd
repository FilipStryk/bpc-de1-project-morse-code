------------------------------------------------------------
--
-- Template for 7-segment display decoder.
-- Nexys A7-50T, Vivado v2020.2, EDA Playground
--
-- Copyright (c) 2018-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for seven7-segment display decoder
------------------------------------------------------------
entity bin_7seg is
    port(
        bin_i : in  std_logic_vector(8 - 1 downto 0);
        seg_o : out std_logic_vector(7 - 1 downto 0)
    );
end entity bin_7seg;

------------------------------------------------------------
-- Architecture body for seven-segment display decoder
------------------------------------------------------------
architecture Behavioral of bin_7seg is
begin
    --------------------------------------------------------
    -- p_7seg_decoder:
    -- A combinational process for 7-segment display (Common
    -- Anode) decoder. Any time "bin_i" is changed, the process
    -- is "executed". Output pin seg_o(6) controls segment A,
    -- seg_o(5) segment B, etc.
    --       segment A
    --        | segment B
    --        |  | segment C
    --        +-+|  |   ...   segment G
    --          ||+-+          |
    --          |||            |
    -- seg_o = "0000001"-------+
    --------------------------------------------------------
    p_7seg_decoder : process(bin_i)
    begin
        case bin_i is
            when "00110000" =>
                seg_o <= "0000001"; -- 0
            when "00110001" =>
                seg_o <= "1001111"; -- 1
            when "00110010" =>
                seg_o <= "0010010"; -- 2
            when "00110011" =>
                seg_o <= "0000110"; -- 3    
            when "00110100" =>
                seg_o <= "1001100"; -- 4
            when "00110101" =>
                seg_o <= "0100100"; -- 5
            when "00110110" =>
                seg_o <= "0100000"; -- 6 
            when "00110111" =>
                seg_o <= "0001111"; -- 7       
            when "00111000" =>
                seg_o <= "0000000"; -- 8
            when "00111001" =>
                seg_o <= "0000100"; -- 9 
            when "01000001" =>
                seg_o <= "0001000"; -- A 
            when "01000010" =>
                seg_o <= "1100000"; -- b 
            when "01000011" =>
                seg_o <= "0110001"; -- C     
            when "01000100" =>
                seg_o <= "1000010"; -- d       
            when "01000101" =>
                seg_o <= "0110000"; -- E
            when "01000110" =>
                seg_o <= "0111000"; -- F
            when "01000111" =>
                seg_o <= "0100001"; -- G
            when "01001000" =>
                seg_o <= "1101000"; -- h
            when "01001001" =>
                seg_o <= "1111001"; -- I
            when "01001010" =>
                seg_o <= "1000011"; -- J
            when "01001011" =>
                seg_o <= "0101000"; -- K
            when "01001100" =>
                seg_o <= "1110001"; -- L
            when "01001101" =>
                seg_o <= "0101011"; -- M
            when "01001110" =>
                seg_o <= "0001001"; -- N
            when "01001111" =>
                seg_o <= "1100010"; -- o
            when "01010000" =>
                seg_o <= "0011000"; -- P
            when "01010001" =>
                seg_o <= "0001100"; -- q
            when "01010010" =>
                seg_o <= "0011001"; -- r
            when "01010011" =>
                seg_o <= "0100100"; -- S
            when "01010100" =>
                seg_o <= "1110000"; -- t
            when "01010101" =>
                seg_o <= "1000001"; -- U
            when "01010110" =>
                seg_o <= "1000101"; -- V
            when "01010111" =>
                seg_o <= "1010101"; -- W
            when "01011000" =>
                seg_o <= "1001000"; -- X
            when "01011001" =>
                seg_o <= "1000100"; -- Y
            when "01011010" =>
                seg_o <= "0010110"; -- Z
             when others =>
                seg_o <= "1111111"; -- off
        end case;
    end process p_7seg_decoder;

end architecture Behavioral;
