library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_shift_register is
end tb_shift_register;

architecture testbench of tb_shift_register is

    constant c_CLK_PERIOD : time := 100 ns;
    
    signal s_clk  : std_logic;
    signal s_data_input  : std_logic_vector(8 - 1 downto 0);
    signal s_reset       : std_logic;
    signal s_output_0    : std_logic_vector(8 - 1 downto 0);
    signal s_output_1    : std_logic_vector(8 - 1 downto 0);
    signal s_output_2    : std_logic_vector(8 - 1 downto 0);
    signal s_output_3    : std_logic_vector(8 - 1 downto 0);
    signal s_output_4    : std_logic_vector(8 - 1 downto 0);
    signal s_output_5    : std_logic_vector(8 - 1 downto 0);
    signal s_output_6    : std_logic_vector(8 - 1 downto 0);
    signal s_output_7    : std_logic_vector(8 - 1 downto 0);

begin

    uut_shift_register: entity work.shift_register
        port map(
            clock       => s_clk,
            data_input  => s_data_input,
            reset       => s_reset,
            output_0    => s_output_0,
            output_1    => s_output_1,
            output_2    => s_output_2,
            output_3    => s_output_3,
            output_4    => s_output_4,
            output_5    => s_output_5,
            output_6    => s_output_6,
            output_7    => s_output_7
        );
        

    p_clk_gen : process
    begin
        while now < 100000 ns loop
            s_clk <= '0';
            wait for c_CLK_PERIOD / 2;
            s_clk <= '1';
            wait for c_CLK_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
    
--    p_reset_gen : process
--    begin
--        wait for 250 ns;
--        s_reset <= '1';
--        wait for 160 ns;
--        s_reset <= '0';
--        wait;
--    end process p_reset_gen;

    
    p_stimulus : process
        begin
        report "Stimulus process started" severity note;
            s_data_input <= x"48";
            wait for 75 ns;
            s_data_input <= x"45";
            wait for 100 ns;
            s_data_input <= x"4C";
            wait for 100 ns;
            s_data_input <= x"4C";
            wait for 100 ns;
            s_data_input <= x"4F";
            wait for 100 ns;
            s_data_input <= x"20";
            wait for 100 ns;
            s_data_input <= x"57";
            wait for 100 ns;
            s_data_input <= x"4F";
            wait for 100 ns;
            s_data_input <= x"52";
            wait for 100 ns;
            s_data_input <= x"4C";
            wait for 100 ns;
            s_data_input <= x"44";
        report "Stimulus process finished" severity note;
        wait;
        end process p_stimulus; 

end testbench;
