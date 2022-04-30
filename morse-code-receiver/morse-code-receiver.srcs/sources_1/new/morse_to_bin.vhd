library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity morse_to_bin is
     port(
        clk     : in std_logic;
        rst     : in  std_logic;
        enter_i : in  std_logic;     
        dot_i   : in  std_logic;
        dash_i  : in  std_logic;
        bin_o   : out std_logic_vector(8 - 1 downto 0);
        shift_o : out std_logic;
        morse_o : out std_logic_vector(5 - 1 downto 0)
    );
end entity morse_to_bin;

architecture behavioral of morse_to_bin is

    signal s_morse_local        : std_logic_vector(5 - 1 downto 0);
    signal s_enter_rising_edge  : std_logic;
    signal s_enter_falling_edge : std_logic;
    signal s_dot_rising_edge    : std_logic;
    signal s_dash_rising_edge   : std_logic;
    signal s_len                : natural;
    
begin


    enter_edge_detector : entity work.edge_detector
        port map (
            clk     => clk, 
            sig_i   => enter_i,
            rise_o  => s_enter_rising_edge,
            fall_o  => s_enter_falling_edge
        );


    dot_edge_detector : entity work.edge_detector
        port map (
            clk     => clk,
            sig_i   => dot_i,
            rise_o  => s_dot_rising_edge
        );


    dash_edge_detector : entity work.edge_detector
        port map (
            clk     => clk,
            sig_i   => dash_i,
            rise_o  => s_dash_rising_edge
        );


    p_morse_to_bin : process(clk)
    begin

        if rising_edge(clk) then
            if (rst = '1') then
                s_morse_local <= (others => '0');
                s_len <= 0;
            elsif not (s_len >= 0 and s_len <= 5) then
                s_morse_local <= (others => '0');
                s_len <= 0;
            else
                if (s_dot_rising_edge = '1') then
                    s_len <= s_len + 1;
                    s_morse_local(s_len) <= '0';
                elsif (s_dash_rising_edge = '1') then
                    s_len <= s_len + 1;
                    s_morse_local(s_len) <= '1';
                elsif (s_enter_rising_edge = '1') then
                    shift_o <= '1';
                    case s_len is
                        when 1 =>
                            case s_morse_local(0 downto 0) is 
                                when "0" =>
                                    bin_o <= "01000101"; -- E
                                when "1" =>
                                    bin_o <= "01010100"; -- T 
                                when others =>
                                    shift_o <= '0';
                            end case; 
                        when 2 => 
                            case s_morse_local(1 downto 0) is 
                                when "00" =>
                                    bin_o <= "01001001"; -- I
                                when "10" =>
                                    bin_o <= "01000001"; -- A
                                when "01" =>
                                    bin_o <= "01001110"; -- N 
                                when "11" =>
                                     bin_o <= "01001101"; -- M 
                                when others =>
                                    shift_o <= '0';
                            end case;    
                        when 3 =>
                            case s_morse_local(2 downto 0) is 
                                when "000" =>
                                    bin_o <= "01010011"; -- S
                                when "100" =>
                                    bin_o <= "01010101"; -- U
                                when "010" =>
                                    bin_o <= "01010010"; -- R
                                when "110" =>
                                    bin_o <= "01010111"; -- W
                                when "001" =>
                                    bin_o <= "01000100"; -- D
                                when "101" =>
                                    bin_o <= "01001011"; -- K
                                when "011" =>
                                    bin_o <= "01000111"; -- G
                                when "111" =>
                                    bin_o <= "01001111"; --  O 
                                when others =>
                                    shift_o <= '0';
                            end case;
                        when 4 =>
                            case s_morse_local(3 downto 0) is 
                                when "0000" =>
                                    bin_o <= "01001000"; -- H
                                when "1000" =>
                                    bin_o <= "01010110"; -- V
                                when "0100" =>
                                    bin_o <= "01000110"; -- F
                                when "0010" =>
                                    bin_o <= "01001100"; -- L
                                when "0110" =>
                                    bin_o <= "01010000"; -- P
                                when "1110" =>
                                    bin_o <= "01001010"; -- J
                                when "0001" =>
                                    bin_o <= "01000010"; -- B
                                when "1001" =>
                                    bin_o <= "01011000"; -- X
                                when "0101" =>
                                    bin_o <= "01000011"; -- C 
                                when "1101" =>
                                    bin_o <= "01011001"; -- Y
                                when "0011" =>
                                    bin_o <= "01011010"; -- Z
                                when "1011" =>
                                    bin_o <= "01010001"; -- Q
                                when others =>
                                    shift_o <= '0';
                            end case; 
                        when 5 =>
                            case s_morse_local(4 downto 0) is 
                                when "11111" =>
                                    bin_o <= "00110000"; -- 0
                                when "11110" =>
                                    bin_o <= "00110001"; -- 1
                                when "11100" =>
                                    bin_o <= "00110010"; -- 2
                                when "11000" =>
                                    bin_o <= "00110011"; -- 3
                                when "10000" =>
                                    bin_o <= "00110100"; -- 4 
                                when "00000" =>
                                    bin_o <= "00110101"; -- 5
                                when "00001" =>
                                    bin_o <= "00110110"; -- 6 
                                when "00011" =>
                                    bin_o <= "00110111"; -- 7
                                when "00111" =>
                                    bin_o <= "00111000"; -- 8
                                when "01111" =>
                                    bin_o <= "00111001"; -- 9
                                when others =>
                                    shift_o <= '0';
                            end case; 
                        when others =>
                            shift_o <= '0';
                        end case;
                    s_len <= 0;
                    s_morse_local <= (others => '0');
                elsif (s_enter_falling_edge = '1') then
                    shift_o <= '0';
                end if;
            end if;
        end if;

    end process p_morse_to_bin;

        
    morse_o <= s_morse_local; 
       
end architecture behavioral;
