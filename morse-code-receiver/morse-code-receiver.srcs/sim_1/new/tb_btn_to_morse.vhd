library ieee;
use ieee.std_logic_1164.all;

entity tb_btn_to_morse is
end tb_btn_to_morse;

architecture testbench of tb_btn_to_morse is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    signal s_clk        : std_logic;
    signal s_btn        : std_logic;
    signal s_rst        : std_logic;
    signal s_dot        : std_logic;
    signal s_dash       : std_logic;
    signal s_led_dot    : std_logic;
    signal s_led_dash   : std_logic;   
    signal s_cnt        : std_logic_vector(8 - 1 downto 0);
    
begin
    
    uut : entity work.btn_to_morse
        port map(
            clk => s_clk,
            rst => s_rst,
            btn_i => s_btn,
            dot_o => s_dot,
            dash_o => s_dash,
            led_dot_o => s_led_dot,
            led_dash_o => s_led_dash,
            cnt_o => s_cnt
        );


    p_clk_gen : process
    begin

        while now < 10000 ns loop  -- 100 usec of simulation
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
        
            s_rst <= '0';
            s_btn <= '0';
               
            wait for 10 ns;
            
            s_btn <= '1';
            wait for 100 ns;
            s_btn <= '0';
            wait for 30 ns; assert(s_dot = '1') report "Dot recognition failed for time 100 ns" severity error;
            
            wait for 20 ns;
            
            s_btn <= '1';
            wait for 200 ns;
            s_btn <= '0';
            wait for 30 ns; assert(s_dash = '1') report "Dash recognition failed for time 200 ns" severity error;
            
            s_btn <= '1';
            wait for 100 ns;
            s_rst <= '1';
            wait for 20 ns;
            s_rst <= '0';
            wait for 1 ns; assert(s_cnt = "00000000") report "Reset failed" severity error;
            wait for 200 ns;
            s_btn <= '0';
            
        report "Stimulus process finished" severity note;
        wait;

    end process p_stimulus;


end testbench;
