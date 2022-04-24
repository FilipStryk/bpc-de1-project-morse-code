----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2022 15:05:19
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( CLK100MHz : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           BTNU : in std_logic;
           BTNR : in std_logic;
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN: out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is
    signal s_char0: std_logic_vector(8-1 downto 0);
    signal s_char1: std_logic_vector(8-1 downto 0);
    signal s_char2: std_logic_vector(8-1 downto 0);
    signal s_char3: std_logic_vector(8-1 downto 0);
    signal s_char4: std_logic_vector(8-1 downto 0);
    signal s_char5: std_logic_vector(8-1 downto 0);
    signal s_char6: std_logic_vector(8-1 downto 0);
    signal s_char7: std_logic_vector(8-1 downto 0);
    signal s_dot_o: std_logic;
    signal s_dash_o: std_logic;
    signal s_bin_o: std_logic_vector(7 downto 0);
    
    
    
begin
    btn_to_morse : entity work.btn_to_morse
        port map(
            btn_i => BTNL,
            clk => CLK100MHz,
            local_rst => BTNU,
            dot_o => s_dot_o,
            dash_o => s_dash_o
    
    
    );
    
    morse_to_bin : entity work.morse_to_bin
        port map(
            local_rst => BTNU,
            enter => BTNC,
            bin_o => s_bin_o,
            dot_i => s_dot_o,
            dash_i => s_dash_o
            
                     
    );
    
    shift_register: entity work.shift_register
        port map(
            data_i => s_bin_o,
            data_o(0) => s_char0,
            data_o(1) => s_char1,
            data_o(2) => s_char2,
            data_o(3) => s_char3,
            data_o(4) => s_char4,
            data_o(5) => s_char5,
            data_o(6) => s_char6,
            data_o(7) => s_char7,
            reset => BTNR,
            clock => BTNC
    );
    
    display_driver: entity work.display_driver
        port map(
            clk => CLK100MHz,
            rst => BTNR,
            char0_i => s_char0,
            char1_i => s_char1,
            char2_i => s_char2,
            char3_i => s_char3,
            char4_i => s_char4,
            char5_i => s_char5,
            char6_i => s_char6,
            char7_i => s_char7, 
            
                      
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG,
            anodes_o(8 - 1 downto 0) => AN(8 - 1 downto 0)
            
         
            
     );

end Behavioral;
