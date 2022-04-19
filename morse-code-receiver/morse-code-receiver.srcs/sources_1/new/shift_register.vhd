library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.data_types_pkg.all;

entity shift_register is
    generic (
        g_SR_WIDTH : natural := 8
    );    
    port (
        clock       : in std_logic;
        reset       : in std_logic;
        data_i      : in std_logic_vector(8 - 1 downto 0);
        data_o      : out t_byte_array(0 to g_SR_WIDTH-1)
    );
end shift_register;

architecture Behavioral of shift_register is
    
    signal s_length : natural := 0;
    
begin   

    p_shift_register: process(clock, reset)
        variable v_output : t_byte_array(0 to g_SR_WIDTH-1);
    begin
            
        if (reset = '1') then
            s_length <= 0;
            v_output := (others => (others => '0'));
        elsif rising_edge(clock) then
            if (s_length < 7) then
                s_length <= s_length + 1;
            end if;

            for i in g_SR_WIDTH-1 downto 1 loop
                if (i <= s_length) then
                    v_output(i) := v_output(i-1);
                end if; 
            end loop;

            v_output(0) := data_i;
        
        end if;
        
        data_o(0 to g_SR_WIDTH-1) <= v_output(0 to g_SR_WIDTH-1);

    end process p_shift_register;

end Behavioral;
