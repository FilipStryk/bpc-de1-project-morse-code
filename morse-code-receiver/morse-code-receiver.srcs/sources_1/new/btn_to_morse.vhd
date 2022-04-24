library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity btn_to_morse is
    Port(
        clk   : in std_logic;
        local_rst   : in std_logic;
        btn_i : in std_logic;
        dot_o : out std_logic;
        dash_o : out std_logic
    );
end btn_to_morse;

architecture Behavioral of btn_to_morse is
    signal s_en : std_logic;
    signal s_counter : unsigned(8 - 1 downto 0);
begin

    clk_en : entity work.clock_enable
        generic map(
            g_MAX => 10
--            g_MAX => 1000000
        )
        port map(
            clk  => clk,
            rst  => local_rst,
            ce_o => s_en
        );

    p_btn_to_morse : process(btn_i, s_en)
        
    begin 
        if local_rst /= '1' then
            if rising_edge(btn_i) then
                s_counter <= (others => '0');
                dot_o <= '0';
                 dash_o <= '0';
            elsif (btn_i = '1' and s_en = '1') then
                s_counter <= s_counter + 1;    
            elsif falling_edge(btn_i) and s_counter <= 1 then
                dot_o <= '1'; 
                dash_o <= '0';
            elsif falling_edge(btn_i) and s_counter >= 2 and s_counter <= 4 then
                dash_o <= '1';
                dot_o <= '0';  
            end if;    
        elsif local_rst = '1' then
            s_counter <= (others => '0');
            dot_o <= '0';
            dash_o <= '0';    
        end if;
    end process p_btn_to_morse; 
    
end Behavioral;
