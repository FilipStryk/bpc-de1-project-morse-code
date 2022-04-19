library ieee;
use ieee.std_logic_1164.all;

entity display_driver is
    Port(
        clk     : in std_logic;
        rst     : in std_logic;
        char0_i : in std_logic_vector(8 - 1 downto 0);
        char1_i : in std_logic_vector(8 - 1 downto 0);
        char2_i : in std_logic_vector(8 - 1 downto 0);
        char3_i : in std_logic_vector(8 - 1 downto 0);
        char4_i : in std_logic_vector(8 - 1 downto 0);
        char5_i : in std_logic_vector(8 - 1 downto 0);
        char6_i : in std_logic_vector(8 - 1 downto 0);
        char7_i : in std_logic_vector(8 - 1 downto 0);
        seg_o   : out std_logic_vector(7 - 1 downto 0);
        anodes_o: out std_logic_vector(8 - 1 downto 0)
    );
end display_driver;

architecture Behavioral of display_driver is

    signal s_en     : std_logic;
    signal s_cnt    : std_logic_vector(3 - 1 downto 0);
    signal s_ascii  : std_logic_Vector(8 - 1 downto 0);

begin

    clk_en : entity work.clock_enable
        generic map(
            g_MAX => 200000
--            g_MAX => 4
        )
        port map(
            clk  => clk,
            rst  => rst,
            ce_o => s_en
        );
    
    bin_cnt : entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH => 3
        )
        port map(
            clk      => clk,
            rst      => rst,
            en_i     => s_en,
            cnt_o    => s_cnt,
            cnt_up_i => '0'
        );

    ascii2seg : entity work.bin_7seg
        port map(
            bin_i => s_ascii,
            seg_o => seg_o
        );

    p_mux : process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                s_ascii <= char0_i;
                anodes_o <= "11111110";
            else
                case s_cnt is
                    when "000" =>
                        s_ascii  <= char0_i;
                        anodes_o <= "11111110";
                    when "001" =>
                        s_ascii  <= char1_i;
                        anodes_o <= "11111101";
                    when "010" =>
                        s_ascii  <= char2_i;
                        anodes_o <= "11111011";
                    when "011" =>
                        s_ascii  <= char3_i;
                        anodes_o <= "11110111";
                    when "100" =>
                        s_ascii  <= char4_i;
                        anodes_o <= "11101111";
                    when "101" =>
                        s_ascii  <= char5_i;
                        anodes_o <= "11011111";
                    when "110" =>
                        s_ascii  <= char6_i;
                        anodes_o <= "10111111";
                    when others =>
                        s_ascii  <= char7_i;
                        anodes_o <= "01111111";
                end case;
            end if;
        end if;
    end process p_mux;


end Behavioral;
