LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4to1 IS
    PORT (
        i : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        y : OUT STD_LOGIC
    );
END mux4to1;

ARCHITECTURE behavioral OF mux4to1 IS
BEGIN
    WITH s SELECT
        y <= i(0) WHEN "00",
        i(1) WHEN "01",
        i(2) WHEN "10",
        i(3) WHEN "11",
        '0' WHEN OTHERS;
END behavioral;
