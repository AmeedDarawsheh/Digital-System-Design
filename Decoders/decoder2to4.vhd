-- This is a VHDL file for a decoder 2-to-4
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY decoder2to4 IS
    PORT (
        A : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        Y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END decoder2to4;

ARCHITECTURE behavior OF decoder2to4 IS
BEGIN
    WITH A SELECT
        Y <= "0001" WHEN "00",
        "0010" WHEN "01",
        "0100" WHEN "10",
        "1000" WHEN "11",
        "0000" WHEN OTHERS;
END behavior;
