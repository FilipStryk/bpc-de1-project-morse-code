library ieee;
use ieee.std_logic_1164.all;

entity tb_edge_detector is
end tb_edge_detector;

architecture testbench of tb_edge_detector is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    signal s_clk    : std_logic;
    signal s_btn    : std_logic;
    signal s_rise   : std_logic;
    signal s_fall   : std_logic;

begin
    
    uut : entity work.edge_detector
        port map(
            clk => s_clk,
            sig_i => s_btn,
            rise_o => s_rise,
            fall_o => s_fall
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
            s_btn <= '0';   
            wait for 100 ns;
            s_btn <= '1';
            wait for 10 ns; assert(s_rise = '1' and s_fall = '0') report "Rising edge detection failed" severity error;
            
            wait for 100 ns;
            s_btn <= '0';
            wait for 10 ns; assert(s_fall = '1' and s_rise = '0') report "Falling edge detection failed" severity error;
        report "Stimulus process finished" severity note;
        wait;

    end process p_stimulus;


end testbench;
