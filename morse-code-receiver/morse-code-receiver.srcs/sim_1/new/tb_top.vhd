library ieee;
use ieee.std_logic_1164.all;

use work.data_types_pkg.all;

entity tb_top is
end tb_top;

architecture testbench of tb_top is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    signal CLK100MHZ : std_logic;
    signal BTNC : std_logic;
    signal BTNL : std_logic;
    signal BTNU : std_logic;
    signal BTNR : std_logic;
    
begin

    uut_top : entity work.top
        port map(
            CLK100MHZ => CLK100MHZ,
            BTNC => BTNC,
            BTNL => BTNL,
            BTNU => BTNU,
            BTNR => BTNR
        );


    p_clk_gen : process
    begin
        while now < 10000 ns loop
            CLK100MHZ <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            CLK100MHZ <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;


    p_stimulus : process
    begin

        report "Stimulus process started" severity note;
            
        BTNR <= '0';
        BTNU <= '0';
        BTNL <= '0';
        BTNC <= '0';
        
        wait for 10 ns;
        BTNR <= '1';
        wait for 10 ns;
        BTNR <= '0';
        wait for 10 ns;
        
        
        -- H
        
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 100 ns;
        BTNL <= '0';
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 100 ns;
        BTNL <= '0';
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 100 ns;
        BTNL <= '0';
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 100 ns;
        BTNL <= '0';
        
        wait for 20 ns;
        BTNC <= '1';
        wait for 10 ns;
        BTNC <= '0';
        
        wait for 70 ns;
        BTNR <= '1';
        wait for 10 ns;
        BTNR <= '0';
        
        
        -- E
        
        
        wait for 20 ns;
        BTNL <= '1';
        wait for 100 ns;
        BTNL <= '0';
        
        wait for 20 ns;
        BTNC <= '1';
        wait for 10 ns;
        BTNC <= '0';
        
        
        -- L
        
        
        wait for 20 ns;
        BTNL <= '1';
        wait for 100 ns;
        BTNL <= '0';
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 200 ns;
        BTNL <= '0';
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 100 ns;
        BTNL <= '0';
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 100 ns;
        BTNL <= '0';
        
        wait for 20 ns;
        BTNC <= '1';
        wait for 10 ns;
        BTNC <= '0';
        
        
        -- L
        
        
        wait for 20 ns;
        BTNL <= '1';
        wait for 100 ns;
        BTNL <= '0';
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 200 ns;
        BTNL <= '0';
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 100 ns;
        BTNL <= '0';
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 100 ns;
        BTNL <= '0';
        
        wait for 20 ns;
        BTNC <= '1';
        wait for 10 ns;
        BTNC <= '0';
        
        
        -- 0 
        
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 200 ns;
        BTNL <= '0';
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 200 ns;
        BTNL <= '0';
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 200 ns;
        BTNL <= '0';
        
        wait for 20 ns;
        BTNC <= '1';
        wait for 10 ns;
        BTNC <= '0';
        
        
        -- W 
        
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 50 ns;
        BTNL <= '0';
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 200 ns;
        BTNL <= '0';
        
        wait for 10 ns;
        BTNL <= '1';
        wait for 200 ns;
        BTNL <= '0';
        
        wait for 10 ns;
        BTNC <= '1';
        wait for 10 ns;
        BTNC <= '0';
                   
        report "Stimulus process finished" severity note;
        wait;
       
    end process p_stimulus;


end testbench;
