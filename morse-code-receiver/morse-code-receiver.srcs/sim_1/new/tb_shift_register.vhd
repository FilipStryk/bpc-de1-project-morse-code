library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.data_types_pkg.all;

entity tb_shift_register is
end tb_shift_register;

architecture testbench of tb_shift_register is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    signal s_clk    : std_logic;
    signal s_reset  : std_logic;
    signal s_data_i : std_logic_vector(8 - 1 downto 0);
    signal s_data_o : t_byte_array(8 - 1 downto 0);

begin

    uut: entity work.shift_register
        port map(
            clk     => s_clk,
            arst    => s_reset,
            data_i  => s_data_i,
            data_o  => s_data_o
        );

    
    p_stimulus : process
    begin

        report "Stimulus process started" severity note;
            s_reset <= '0';
            s_clk <= '0';
            wait for 10 ns;
            
            s_data_i <= x"48";
            
            s_clk <= '1';
            wait for 10 ns;
            s_clk <= '0';
            wait for 50 ns;
            
            s_data_i <= x"45";
            
            s_clk <= '1';
            wait for 10 ns;
            s_clk <= '0';
            wait for 50 ns;
            
            s_data_i <= x"4C";
            s_clk <= '1';
            wait for 10 ns;
            s_clk <= '0';
            wait for 50 ns;

            s_reset <= '1';
            wait for 10 ns;
            s_reset <= '0';
            wait for 50 ns;
            
            s_data_i <= x"48";
            s_clk <= '1';
            wait for 10 ns;
            s_clk <= '0';
            wait for 50 ns;
            
            s_data_i <= x"45";
            s_clk <= '1';
            wait for 10 ns;
            s_clk <= '0';
            wait for 50 ns;
            
            s_data_i <= x"4C";
            s_clk <= '1';
            wait for 10 ns;
            s_clk <= '0';
            wait for 50 ns;

            s_data_i <= x"4C";
            s_clk <= '1';
            wait for 10 ns;
            s_clk <= '0';
            wait for 50 ns;

            s_data_i <= x"4F";
            s_clk <= '1';
            wait for 10 ns;
            s_clk <= '0';
            wait for 50 ns;

            s_data_i <= x"20";
            s_clk <= '1';
            wait for 10 ns;
            s_clk <= '0';
            wait for 50 ns;

            s_data_i <= x"57";
            s_clk <= '1';
            wait for 10 ns;
            s_clk <= '0';
            wait for 50 ns;

            s_data_i <= x"4F";
            s_clk <= '1';
            wait for 10 ns;
            s_clk <= '0';
            wait for 50 ns;

            s_data_i <= x"52";
            s_clk <= '1';
            wait for 10 ns;
            s_clk <= '0';
            wait for 50 ns;

            s_data_i <= x"4C";
            s_clk <= '1';
            wait for 10 ns;
            s_clk <= '0';
            wait for 50 ns;

            s_data_i <= x"44";
            s_clk <= '1';
            wait for 10 ns;
            s_clk <= '0';
        report "Stimulus process finished" severity note;
        wait;

    end process p_stimulus; 


end testbench;
