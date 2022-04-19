library ieee;
use ieee.std_logic_1164.all;

package data_types_pkg is
    type t_byte_array is array(natural range <>) of std_logic_vector(8 - 1 downto 0);
end data_types_pkg;