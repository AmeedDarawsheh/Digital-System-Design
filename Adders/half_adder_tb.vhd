LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY half_adder_tb IS
END half_adder_tb;

ARCHITECTURE behavioral OF half_adder_tb IS
    COMPONENT half_adder
        PORT (
            a, b : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a, b, sum, carry : STD_LOGIC := '0';

BEGIN
    uut : half_adder PORT MAP(a, b, sum, carry);

    stim : PROCESS
    BEGIN
        a <= '0';
        b <= '0';
        WAIT FOR 10 ns;
        a <= '0';
        b <= '1';
        WAIT FOR 10 ns;
        a <= '1';
        b <= '0';
        WAIT FOR 10 ns;
        a <= '1';
        b <= '1';
        WAIT FOR 10 ns;
        WAIT;
    END PROCESS;
END behavioral;
