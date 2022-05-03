library ieee;
use ieee.std_logic_1164.all;

use work.data_types_pkg.all;

entity tb_top is
end tb_top;

architecture testbench of tb_top is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    signal s_CLK100MHZ : std_logic;
    signal s_BTNC : std_logic;
    signal s_BTNL : std_logic;
    signal s_BTNU : std_logic;
    signal s_BTNR : std_logic;
    signal s_CA : std_logic;
    signal s_CB : std_logic;
    signal s_CC : std_logic;
    signal s_CD : std_logic;
    signal s_CE : std_logic;
    signal s_CF : std_logic;
    signal s_CG : std_logic;
    signal s_AN: std_logic_vector(8 - 1 downto 0);
    signal s_LED_CNT : std_logic_vector(8 - 1 downto 0);
    signal s_LED16_R : std_logic;
    signal s_LED16_G : std_logic;
    signal s_LED_MORSE : std_logic_vector(5 - 1 downto 0);
    
    
begin

    uut_top : entity work.top
        port map(
            CLK100MHZ => s_CLK100MHZ,
            BTNC    => s_BTNC,
            BTNL    => s_BTNL,
            BTNU    => s_BTNU,
            BTNR    => s_BTNR,
            CA      => s_CA,
            CB      => s_CB,
            CC      => s_CC,
            CD      => s_CD,
            CE      => s_CE,
            CF      => s_CF,
            CG      => s_CG,
            AN      => s_AN,
            LED_CNT => s_LED_CNT,
            LED16_G => s_LED16_G,
            LED16_R => s_LED16_R,
            LED_MORSE => s_LED_MORSE
        );


    p_clk_gen : process
    begin
        while now < 10000 ns loop
            s_CLK100MHZ <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_CLK100MHZ <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;


    p_stimulus : process
    begin

        report "Stimulus process started" severity note;
            
        s_BTNR <= '0';
        s_BTNU <= '0';
        s_BTNL <= '0';
        s_BTNC <= '0';
        
        wait for 10 ns;
        s_BTNR <= '1';
        wait for 10 ns;
        s_BTNR <= '0';
        
        
        -- U
        
        
        wait for 10 ns;
        s_BTNL <= '1';
        wait for 100 ns;
        s_BTNL <= '0';
        
        wait for 10 ns;
        s_BTNL <= '1';
        wait for 100 ns;
        s_BTNL <= '0';
        
        wait for 10 ns;
        s_BTNL <= '1';
        wait for 200 ns;
        s_BTNL <= '0';
        
        wait for 100 ns;
        s_BTNC <= '1';
        wait for 10 ns;
        s_BTNC <= '0';


        -- R
        
        
        wait for 10 ns;
        s_BTNL <= '1';
        wait for 100 ns;
        s_BTNL <= '0';
        
        wait for 10 ns;
        s_BTNL <= '1';
        wait for 200 ns;
        s_BTNL <= '0';
        
        wait for 10 ns;
        s_BTNL <= '1';
        wait for 100 ns;
        s_BTNL <= '0';
        
        wait for 100 ns;
        s_BTNC <= '1';
        wait for 10 ns;
        s_BTNC <= '0';        


        -- E
        
        
        wait for 20 ns;
        s_BTNL <= '1';
        wait for 100 ns;
        s_BTNL <= '0';
        
        wait for 100 ns;
        s_BTNC <= '1';
        wait for 10 ns;
        s_BTNC <= '0';
        
        
        -- L
        
        
        wait for 20 ns;
        s_BTNL <= '1';
        wait for 100 ns;
        s_BTNL <= '0';
        
        wait for 10 ns;
        s_BTNL <= '1';
        wait for 200 ns;
        s_BTNL <= '0';
        
        wait for 10 ns;
        s_BTNL <= '1';
        wait for 100 ns;
        s_BTNL <= '0';
        
        wait for 10 ns;
        s_BTNL <= '1';
        wait for 100 ns;
        s_BTNL <= '0';
        
        wait for 100 ns;
        s_BTNC <= '1';
        wait for 10 ns;
        s_BTNC <= '0';
        
        
        -- Reset
        
        
        wait for 10 ns;
        s_BTNL <= '1';
        wait for 200 ns;
        s_BTNL <= '0';
        
        wait for 10 ns;
        s_BTNL <= '1';
        wait for 200 ns;
        s_BTNL <= '0';
        
        wait for 10 ns;
        s_BTNL <= '1';
        wait for 200 ns;
        s_BTNL <= '0';
        
        wait for 150 ns;
        s_BTNU <= '1';
        wait for 10 ns;
        s_BTNU <= '0';
        
        wait for 367 ns;
        s_BTNR <= '1';
        wait for 10 ns;
        s_BTNR <= '0';
        
                   
        report "Stimulus process finished" severity note;
        wait;
       
    end process p_stimulus;


end testbench;
