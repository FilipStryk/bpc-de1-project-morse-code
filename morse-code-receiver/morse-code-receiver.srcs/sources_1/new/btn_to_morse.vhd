library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity btn_to_morse is
    generic (
        g_DOT_MIN   : natural := 1;
        g_DOT_MAX   : natural := 5;
        g_DASH_MIN  : natural := 6;
        g_DASH_MAX  : natural := 10
    );
    port (
        clk         : in std_logic;
        rst         : in std_logic;
        btn_i       : in std_logic;
        dot_o       : out std_logic;
        dash_o      : out std_logic;
        led_dash_o  : out std_logic;
        led_dot_o   : out std_logic;
        cnt_o       : out std_logic_vector(8 - 1 downto 0)
    );
end btn_to_morse;

architecture behavioral of btn_to_morse is

    type t_state is (INIT, PUSHED, DOT, DASH);
    signal s_state  : t_state;
    signal s_en     : std_logic;
    signal s_cnt    : unsigned(8 - 1 downto 0);

begin   

    clk_en : entity work.clock_enable
        generic map(
            g_MAX => 2 -- for simulation only
--            g_MAX => 2500000
        )
        port map(
            clk  => clk,
            rst  => rst,
            ce_o => s_en
        );


    p_fsm : process(clk)
    begin
        
        if rising_edge(clk) then
            if (rst = '1') then
                s_state <= INIT;
                s_cnt <= (others => '0');
            else
                case(s_state) is
                    when INIT =>
                        s_cnt <= (others => '0');
                        if (btn_i = '1') then
                            s_state <= PUSHED;
                        end if;
                    when PUSHED =>
                        if (btn_i = '1' and s_en = '1') then
                            s_cnt <= s_cnt + 1;
                        elsif (btn_i = '1') then
                            NULL;
                        elsif (btn_i = '0' and s_cnt >= g_DOT_MIN and s_cnt <= g_DOT_MAX) then
                            s_state <= DOT;
                        elsif (btn_i = '0' and s_cnt >= g_DASH_MIN and s_cnt <= g_DASH_MAX) then
                            s_state <= DASH;
                        else
                            s_state <= INIT;
                        end if;
                    when DOT =>
                        if (btn_i = '1') then
                            s_state <= INIT;
                        end if;
                    when DASH =>
                        if (btn_i = '1') then
                            s_state <= INIT;
                        end if;
                    when others =>
                        s_state <= INIT;
                        s_cnt <= (others => '0');
                end case;
            end if;
        end if;
            
    end process p_fsm;
   
    
    p_output : process(s_state) 
    begin

        case(s_state) is
            when DOT =>
                dot_o <= '1';
                dash_o <= '0';
            when DASH =>
                dot_o <= '0';
                dash_o <= '1';
            when others =>
                dot_o <= '0';
                dash_o <= '0';
        end case;

    end process p_output;

   
    led_dot_o <= '1' when (s_state = PUSHED and s_cnt >= g_DOT_MIN and s_cnt <= g_DOT_MAX) else '0';
    led_dash_o <= '1' when (s_state = PUSHED and s_cnt >= g_DASH_MIN and s_cnt <= g_DASH_MAX) else '0'; 
    cnt_o <= std_logic_vector(s_cnt);
     
end behavioral;
