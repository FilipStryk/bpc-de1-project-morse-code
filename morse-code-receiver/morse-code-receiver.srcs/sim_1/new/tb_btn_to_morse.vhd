----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2022 05:11:54 PM
-- Design Name: 
-- Module Name: tb_esot - Behavioral
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


entity tb_btn_to_morse is
end tb_btn_to_morse;

architecture Behavioral of tb_btn_to_morse is
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    signal s_clk    : std_logic;
    signal s_btn    : std_logic;
    signal s_rst    : std_logic;
begin
    
    uut : entity work.btn_to_morse
        port map(
            clk => s_clk,
            local_rst => '0',
            btn_i => s_btn
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
            wait for 156 ns;
            s_btn <= '0';
            wait for 100 ns;
            s_btn <= '1';
            wait for 194 ns;
            s_btn <= '0';
        report "Stimulus process finished" severity note;
        wait;
        end process p_stimulus;

end Behavioral;
