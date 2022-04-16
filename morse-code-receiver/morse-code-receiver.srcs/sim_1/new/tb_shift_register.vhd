library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.data_types_pkg.all;

entity tb_shift_register is
end tb_shift_register;

architecture testbench of tb_shift_register is

    constant c_CLK_100MHZ_PERIOD : time := 100 ns;
    
    signal s_clk    : std_logic;
    signal s_reset  : std_logic;
    signal s_data_i : std_logic_vector(8 - 1 downto 0);
    signal s_data_o : t_byte_array(8 - 1 downto 0);

begin

    uut_shift_register: entity work.shift_register
        port map(
            clock   => s_clk,
            reset   => s_reset,
            data_i  => s_data_i,
            data_o  => s_data_o
        );
        

    p_clk_gen : process
    begin
        while now < 100000 ns loop  -- 100 usec of simulation
            s_clk <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
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
--            s_reset <= '1';
--            wait for 100 ns;
--            s_reset <= '0';
--            wait for 100 ns;
            s_data_i <= x"48";
            wait for 75 ns;
            s_data_i <= x"45";
            wait for 100 ns;
            s_data_i <= x"4C";
            wait for 100 ns;
            s_data_i <= x"4C";
            wait for 100 ns;
            s_data_i <= x"4F";
            wait for 100 ns;
            s_data_i <= x"20";
            wait for 100 ns;
            s_data_i <= x"57";
            wait for 100 ns;
            s_data_i <= x"4F";
            wait for 100 ns;
            s_data_i <= x"52";
            wait for 100 ns;
            s_data_i <= x"4C";
            wait for 100 ns;
            s_data_i <= x"44";
        report "Stimulus process finished" severity note;
        wait;
        end process p_stimulus; 

end testbench;
