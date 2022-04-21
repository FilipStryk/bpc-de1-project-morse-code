----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2022 22:46:07
-- Design Name: 
-- Module Name: tb_morse_to_bin - Behavioral
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

entity tb_morse_to_bin is
--  Port ( );
end tb_morse_to_bin;

architecture testbench of tb_morse_to_bin is
    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    -- Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset : std_logic;
    
    -- Other signals
    signal s_dot : std_logic;
    signal s_dash : std_logic;
    signal s_enter : std_logic;
    signal s_bin_o : std_logic_vector(7 downto 0);
      
begin
    uut_ce : entity work.morse_to_bin
    port map(
        clk   => s_clk_100MHz,
        reset => s_reset,
        dot => s_dot,
        dash => s_dash,
        enter => s_enter,
        bin_o => s_bin_o
    );
    p_clk_gen : process
    begin
        while now < 3500 ns loop -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        s_enter <= '0';
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
           
        wait for 10 ns;        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
