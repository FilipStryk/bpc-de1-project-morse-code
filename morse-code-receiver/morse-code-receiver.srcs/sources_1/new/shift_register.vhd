library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_register is    
    port (
        clock       : in std_logic;
        reset       : in std_logic;
        data_input  : in std_logic_vector(8 - 1 downto 0);
        output_0    : out std_logic_vector(8 - 1 downto 0);
        output_1    : out std_logic_vector(8 - 1 downto 0);
        output_2    : out std_logic_vector(8 - 1 downto 0);
        output_3    : out std_logic_vector(8 - 1 downto 0);
        output_4    : out std_logic_vector(8 - 1 downto 0);
        output_5    : out std_logic_vector(8 - 1 downto 0);
        output_6    : out std_logic_vector(8 - 1 downto 0);
        output_7    : out std_logic_vector(8 - 1 downto 0)
    );
end shift_register;

architecture Behavioral of shift_register is
    
    signal s_length : integer := 0;
--    type reg_output is array(0 to 7) of unsigned(7 - 1 downto 0);
--    signal s_output : reg_output;
    
begin   

    p_shift_register: process(clock, reset)
        type reg_output is array(0 to 7) of std_logic_vector(8 - 1 downto 0);
        variable s_output : reg_output;
    begin
            
        if (reset = '1') then
            s_length <= 0;
            s_output := (others => (others => '0'));
        elsif rising_edge(clock) then
            if (s_length < 7) then
                s_length <= s_length + 1;
            end if;

            for i in 7 downto 1 loop
                if (i <= s_length) then
                    s_output(i) := s_output(i-1);
                end if; 
            end loop;

            s_output(0) := data_input;            

        end if;

        output_0 <= s_output(0);
        output_1 <= s_output(1);
        output_2 <= s_output(2);
        output_3 <= s_output(3);
        output_4 <= s_output(4);
        output_5 <= s_output(5);
        output_6 <= s_output(6);
        output_7 <= s_output(7);

    end process p_shift_register;

end Behavioral;
