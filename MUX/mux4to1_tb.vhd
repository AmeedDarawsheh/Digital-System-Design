LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4to1_tb IS
END mux4to1_tb;

ARCHITECTURE behavioral OF mux4to1_tb IS
    COMPONENT mux4to1
        PORT (
            i : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            y : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1010";
    SIGNAL s : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    SIGNAL y : STD_LOGIC;

BEGIN
    uut : mux4to1 PORT MAP(i, s, y);

    stim : PROCESS
    BEGIN
        s <= "00";
        WAIT FOR 10 ns;
        s <= "01";
        WAIT FOR 10 ns;
        s <= "10";
        WAIT FOR 10 ns;
        s <= "11";
        WAIT FOR 10 ns;
        WAIT;
    END PROCESS;
END behavioral;
