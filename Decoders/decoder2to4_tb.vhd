LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoder2to4_tb IS
END decoder2to4_tb;

ARCHITECTURE behavioral OF decoder2to4_tb IS
    COMPONENT decoder2to4
        PORT (
            a : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL a : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    SIGNAL y : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    uut : decoder2to4 PORT MAP(a, y);

    stim : PROCESS
    BEGIN
        a <= "00";
        WAIT FOR 10 ns;
        a <= "01";
        WAIT FOR 10 ns;
        a <= "10";
        WAIT FOR 10 ns;
        a <= "11";
        WAIT FOR 10 ns;
        WAIT;
    END PROCESS;
END behavioral;
