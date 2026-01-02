LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_tb IS
END full_adder_tb;

ARCHITECTURE behavioral OF full_adder_tb IS
    COMPONENT full_adder
        PORT (
            a, b, cin : IN STD_LOGIC;
            sum, cout : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a, b, cin, sum, cout : STD_LOGIC := '0';

BEGIN
    uut : full_adder PORT MAP(a, b, cin, sum, cout);

    stim : PROCESS
    BEGIN
        a <= '0';
        b <= '0';
        cin <= '0';
        WAIT FOR 10 ns;
        a <= '0';
        b <= '0';
        cin <= '1';
        WAIT FOR 10 ns;
        a <= '0';
        b <= '1';
        cin <= '0';
        WAIT FOR 10 ns;
        a <= '0';
        b <= '1';
        cin <= '1';
        WAIT FOR 10 ns;
        a <= '1';
        b <= '0';
        cin <= '0';
        WAIT FOR 10 ns;
        a <= '1';
        b <= '0';
        cin <= '1';
        WAIT FOR 10 ns;
        a <= '1';
        b <= '1';
        cin <= '0';
        WAIT FOR 10 ns;
        a <= '1';
        b <= '1';
        cin <= '1';
        WAIT FOR 10 ns;
        WAIT;
    END PROCESS;
END behavioral;
