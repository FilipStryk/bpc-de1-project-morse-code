library ieee;
use ieee.std_logic_1164.all;

entity tb_morse_to_bin is
end tb_morse_to_bin;

architecture testbench of tb_morse_to_bin is
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    signal s_clk    : std_logic;
    signal s_rst    : std_logic;
    signal s_dot    : std_logic;
    signal s_dash   : std_logic;
    signal s_enter  : std_logic;
    signal s_bin    : std_logic_vector(8 - 1 downto 0);
    signal s_morse  : std_logic_vector(5 - 1 downto 0);
      
begin

    uut : entity work.morse_to_bin
    port map(
        clk     => s_clk,
        rst     => s_rst,
        dot_i   => s_dot,
        dash_i  => s_dash,
        enter_i => s_enter,
        bin_o   => s_bin,
        morse_o => s_morse
    );


    p_clk_gen : process
    begin

        while now < 10000 ns loop
            s_clk <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;

    end process p_clk_gen;


    p_stimulus : process
    begin

        report "Stimulus process started" severity note;
        s_enter <= '0';
        s_rst <= '0';
        s_dot <= '0';
        s_dash <= '0';
        
        wait for 10 ns;
        
        -- A
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;

        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
                
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
                                                                                                                                                                                                                                                                                                                                                                                
        --B
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
        
        -- C
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
        
        -- D
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
        
        -- E
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
        
        -- F
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
        
        -- G
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
        
        -- H
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
         
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
        
        -- I
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 20 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- J
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;

        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
                
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
        
        -- K
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- L
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- M
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
        
        -- N
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- O
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- P
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- Q
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
 
        -- R
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- S
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- T
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- U
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- V
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
 
        -- W
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
 
        -- X
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- Y
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- Z
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- 0
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- 1
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- 2
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- 3
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- 4
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- 5
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- 6
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- 7
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- 8
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;

        -- 9
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;
        
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
        
        -- A (reset)
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;

        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
        
        s_rst <= '1';
        wait for 10 ns;
        s_rst <= '0';
        wait for 10 ns;
        
        s_dot <= '1';
        wait for 10 ns;
        s_dot <= '0';
        wait for 10 ns;

        s_dash <= '1';
        wait for 10 ns;
        s_dash <= '0';
        wait for 10 ns;
                
        s_enter <= '1';
        wait for 10 ns;
        s_enter <= '0';
        wait for 10 ns;
        
        report "Stimulus process finished" severity note;
        wait;

    end process p_stimulus;


end architecture testbench;
