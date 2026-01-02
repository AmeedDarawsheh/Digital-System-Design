LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY half_adder IS
    PORT (
        a : IN STD_LOGIC;
        b : IN STD_LOGIC;
        sum : OUT STD_LOGIC;
        carry : OUT STD_LOGIC
    );
END half_adder;

ARCHITECTURE behavioral OF half_adder IS
BEGIN
    sum <= a XOR b;
    carry <= a AND b;
END behavioral;
