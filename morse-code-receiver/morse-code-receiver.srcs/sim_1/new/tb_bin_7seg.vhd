library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_bin_7seg is
    -- Entity of testbench is always empty
end entity tb_bin_7seg;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_bin_7seg is

    -- Local signals
    signal s_bin  : std_logic_vector(8 - 1 downto 0);
    signal s_seg  : std_logic_vector(7 - 1 downto 0);

begin
    -- Connecting testbench signals with decoder entity
    -- (Unit Under Test)
    uut_bin_7seg : entity work.bin_7seg
        port map(
            bin_i => s_bin,
            seg_o => s_seg
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        s_bin <= "00110000"; wait for 50 ns; -- 0
        assert (s_seg = "00000001")
        report "Input combination 00110000 FAILED" severity error;
        
        s_bin <= "00110001"; wait for 50 ns; -- 1
        assert (s_seg = "1001111")
        report "Input combination 00110001 FAILED" severity error;
        
        s_bin <= "00110010"; wait for 50 ns; -- 2
        assert (s_seg = "0010010")
        report "Input combination 00110010 FAILED" severity error;
        
        s_bin <= "00110011"; wait for 50 ns; -- 3
        assert (s_seg = "0000110")
        report "Input combination 00110011 FAILED" severity error;
        
        s_bin <= "00110100"; wait for 50 ns; -- 4
        assert (s_seg = "1001100")
        report "Input combination 00110100 FAILED" severity error;
        
        s_bin <= "00110101"; wait for 50 ns; -- 5
        assert (s_seg = "0100100")
        report "Input combination 00110101 FAILED" severity error;
        
        s_bin <= "00110110"; wait for 50 ns; -- 6
        assert (s_seg = "0100000")
        report "Input combination 00110110 FAILED" severity error;
        
        s_bin <= "00110111"; wait for 50 ns; -- 7
        assert (s_seg = "0001111")
        report "Input combination 00110111 FAILED" severity error;
        
        s_bin <= "00111000"; wait for 50 ns; -- 8
        assert (s_seg = "0000000")
        report "Input combination 00111000 FAILED" severity error;
        
        s_bin <= "00111001"; wait for 50 ns; -- 9
        assert (s_seg = "0000100")
        report "Input combination 00111001 FAILED" severity error;
        
        s_bin <= "01000001"; wait for 50 ns; -- A
        assert (s_seg = "0001000")
        report "Input combination 01000001 FAILED" severity error;
        
        s_bin <= "01000010"; wait for 50 ns; -- b
        assert (s_seg = "1100000")
        report "Input combination 01000010 FAILED" severity error;
        
        s_bin <= "01000011"; wait for 50 ns; -- C
        assert (s_seg = "0110001")
        report "Input combination 01000011 FAILED" severity error;
        
        s_bin <= "01000100"; wait for 50 ns; -- d
        assert (s_seg = "1000010")
        report "Input combination 01000100 FAILED" severity error;
        
        s_bin <= "01000101"; wait for 50 ns; -- E
        assert (s_seg = "0110000")
        report "Input combination 01000101 FAILED" severity error;
        
        s_bin <= "01000110"; wait for 50 ns; -- F
        assert (s_seg = "0111000")
        report "Input combination 01000110 FAILED" severity error;
        
        s_bin <= "01000111"; wait for 50 ns; -- G
        assert (s_seg = "0100001")
        report "Input combination 01000111 FAILED" severity error;
        
        s_bin <= "01001000"; wait for 50 ns; -- h
        assert (s_seg = "1101000")
        report "Input combination 01001000 FAILED" severity error;
        
        s_bin <= "01001001"; wait for 50 ns; -- I
        assert (s_seg = "1111001")
        report "Input combination 01001001 FAILED" severity error;
        
        s_bin <= "01001010"; wait for 50 ns; -- J
        assert (s_seg = "1000011")
        report "Input combination 01001010 FAILED" severity error;
        
        s_bin <= "01001011"; wait for 50 ns; -- K
        assert (s_seg = "0101000")
        report "Input combination 01001011 FAILED" severity error;
        
        s_bin <= "01001100"; wait for 50 ns; -- L
        assert (s_seg = "1110001")
        report "Input combination 01001100 FAILED" severity error;
        
        s_bin <= "01001101"; wait for 50 ns; -- M
        assert (s_seg = "0101011")
        report "Input combination 01001101 FAILED" severity error;
        
        s_bin <= "01001110"; wait for 50 ns; -- N
        assert (s_seg = "0001001")
        report "Input combination 01001110 FAILED" severity error;
        
        s_bin <= "01001111"; wait for 50 ns; -- o
        assert (s_seg = "1100010")
        report "Input combination 01001111 FAILED" severity error;
        
        s_bin <= "01010000"; wait for 50 ns; -- P
        assert (s_seg = "0011000")
        report "Input combination 01010000 FAILED" severity error;
        
        s_bin <= "01010001"; wait for 50 ns; -- q
        assert (s_seg = "0001100")
        report "Input combination 01010001 FAILED" severity error;
        
        s_bin <= "01010010"; wait for 50 ns; -- r
        assert (s_seg = "0011001")
        report "Input combination 01010010 FAILED" severity error;
        
        s_bin <= "01010011"; wait for 50 ns; -- S
        assert (s_seg = "0100100")
        report "Input combination 01010011 FAILED" severity error;
        
        s_bin <= "01010100"; wait for 50 ns; -- t
        assert (s_seg = "1110000")
        report "Input combination 01010100 FAILED" severity error;
        
        s_bin <= "01010101"; wait for 50 ns; -- U
        assert (s_seg = "1000001")
        report "Input combination 01010101 FAILED" severity error;
        
        s_bin <= "01010110"; wait for 50 ns; -- V
        assert (s_seg = "1000101")
        report "Input combination 01010110 FAILED" severity error;
        
        s_bin <= "01010111"; wait for 50 ns; -- W
        assert (s_seg = "1010101")
        report "Input combination 01010111 FAILED" severity error;
        
        s_bin <= "01011000"; wait for 50 ns; -- X
        assert (s_seg = "1001000")
        report "Input combination 01011000 FAILED" severity error;
        
        s_bin <= "01011001"; wait for 50 ns; -- Y
        assert (s_seg = "1000100")
        report "Input combination 01011001 FAILED" severity error;
        
        s_bin <= "01011010"; wait for 50 ns; -- Z
        assert (s_seg = "0010110")
        report "Input combination 01011010 FAILED" severity error;
        
        s_bin <= "01011111"; wait for 50 ns; -- off1
        assert (s_seg = "1111111")
        report "Input combination 01011111 FAILED" severity error;
        
         s_bin <= "11111001"; wait for 50 ns; -- off1
        assert (s_seg = "1111111")
        report "Input combination 11111001 FAILED" severity error;
                
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
