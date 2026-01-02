LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder IS
    PORT (
        a : IN STD_LOGIC;
        b : IN STD_LOGIC;
        cin : IN STD_LOGIC;
        sum : OUT STD_LOGIC;
        cout : OUT STD_LOGIC
    );
END full_adder;

ARCHITECTURE structural OF full_adder IS
    SIGNAL w_sum, w_carry1, w_carry2 : STD_LOGIC;

    COMPONENT half_adder
        PORT (
            a, b : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN
    HA1 : half_adder PORT MAP(a, b, w_sum, w_carry1);
    HA2 : half_adder PORT MAP(w_sum, cin, sum, w_carry2);
    cout <= w_carry1 OR w_carry2;
END structural;
