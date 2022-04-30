library ieee;
use ieee.std_logic_1164.all;

entity edge_detector is
    port(
        clk     : in std_logic;
        sig_i   : in std_logic;
        rise_o  : out std_logic;
        fall_o  : out std_logic
    );
end edge_detector;

architecture Behavioral of edge_detector is

    signal s_curr : std_logic;
    signal s_prev : std_logic;

begin


    p_detector : process(clk)
    begin

        if rising_edge(clk) then
            s_curr <= sig_i;
            s_prev <= s_curr;
        end if;

    end process p_detector;


    rise_o <= s_curr and (not s_prev);
    fall_o <= (not s_curr) and s_prev;

end Behavioral;
