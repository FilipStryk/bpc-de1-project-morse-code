----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.04.2022 18:09:12
-- Design Name: 
-- Module Name: tb_btn_to_bin - Behavioral
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

entity tb_btn_to_bin is
--  Port ( );
end tb_btn_to_bin;

architecture Behavioral of tb_btn_to_bin is
constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    signal s_clk    : std_logic;
    signal s_enter   : std_logic;
    signal s_loc_rst   : std_logic; 
    signal s_btn    : std_logic;
    signal s_dot    : std_logic;
    signal s_dash    : std_logic;
    signal s_bin    : std_logic_vector(7 downto 0);
    signal s_seg    : std_logic_vector(7 -1 downto 0);
    signal s_shift  : std_logic;
    
begin
    
    btn_to_morse : entity work.btn_to_morse
        port map(
            clk => s_clk,
            rst => s_loc_rst,
            btn_i => s_btn,
            dot_o => s_dot,
            dash_o => s_dash
        );
        
    morse_to_bin: entity work.morse_to_bin
        port map(
            local_rst => s_loc_rst,
            dot_i => s_dot,
            dash_i => s_dash,
            enter => s_enter,
            bin_o => s_bin,
            shift_o => s_shift            
        ); 
    
    sr : entity work.shift_register
        port map(
            clock => s_shift,
            reset => '0',
            data_i => s_bin
        );
        
    bin_7seg: entity work.bin_7seg
    port map(
        bin_i => s_bin,
        seg_o => s_seg
        );
    
    p_clk_gen : process
    begin
        while now < 30000 ms loop  -- 30 sec of simulation
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
            s_loc_rst <= '1';
            s_btn <= '0';
            s_enter <= '0';
            wait for 10 ns;
            s_loc_rst <= '0';
            s_btn <= '0';   
            wait for 10 ns;
            -- A
            s_btn <= '1';
            wait for 100 ns;  
            s_btn <= '0';
            wait for 100 ns;
            
            s_btn <= '1';
            wait for 200 ns ;          
            s_btn <= '0';
            wait for 100 ns;
            
            s_enter <= '1';
            wait for 50 ns;
            s_enter <= '0';
            wait for 200 ns;
            
--             skuska reset
            s_btn <= '1';
            wait for 200 ns ;          
            s_btn <= '0';
            wait for 100 ns;
            
            s_btn <= '1';
            wait for 100 ns;  
            s_btn <= '0';
            wait for 100 ns;
            
            s_loc_rst <= '1';
            wait for 50 ns;
            s_loc_rst <= '0';
            
            --B    
            s_btn <= '1';
            wait for 200 ns ;          
            s_btn <= '0';
            wait for 100 ns;
            
            s_btn <= '1';
            wait for 100 ns;  
            s_btn <= '0';
            wait for 100 ns;
            
            s_btn <= '1';
            wait for 100 ns;
            s_btn <= '0';
            wait for 100 ns;  
            
            s_btn <= '1';
            wait for 100 ns;
            s_btn <= '0';
            wait for 100 ns;          
            
            s_enter <= '1';
            wait for 50 ns;
            s_enter <= '0';
            wait for 200 ns;
            
            -- C    
            s_btn <= '1';
            wait for 200 ns ;          
            s_btn <= '0';
            wait for 100 ns;
            
            s_btn <= '1';
            wait for 100 ns;  
            s_btn <= '0';
            wait for 100 ns;
            
            s_btn <= '1';
            wait for 200 ns;
            s_btn <= '0';
            wait for 100 ns;  
            
            s_btn <= '1';
            wait for 100 ns;
            s_btn <= '0';
            wait for 100 ns;          
            
            s_enter <= '1';
            wait for 50 ns;
            s_enter <= '0';
            wait for 200 ns;
            
            s_enter <= '1';
            wait for 50 ns;
            s_enter <= '0';
            wait for 200 ns;

                   
        report "Stimulus process finished" severity note;
        wait;
        end process p_stimulus;

end Behavioral;
