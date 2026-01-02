LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY GCD_ASM_tb IS
END GCD_ASM_tb;

ARCHITECTURE behavioral OF GCD_ASM_tb IS
    COMPONENT GCD_ASM
        PORT (
            CLK, RESET, S : IN STD_LOGIC;
            Number1, Number2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
            GCD : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL CLK : STD_LOGIC := '0';
    SIGNAL RESET : STD_LOGIC := '0';
    SIGNAL S : STD_LOGIC := '0';
    SIGNAL Number1, Number2 : STD_LOGIC_VECTOR(4 DOWNTO 0) := (OTHERS => '0');
    SIGNAL GCD : STD_LOGIC_VECTOR(4 DOWNTO 0);

    CONSTANT CLK_PERIOD : TIME := 10 ns;

BEGIN
    uut: GCD_ASM PORT MAP (CLK, RESET, S, Number1, Number2, GCD);

    -- Clock generation
    CLK <= NOT CLK AFTER CLK_PERIOD / 2;

    stim: PROCESS
    BEGIN
        RESET <= '0';
        WAIT FOR CLK_PERIOD * 5;
        RESET <= '1';
        WAIT FOR CLK_PERIOD * 2;

        -- Test GCD(12, 8) = 4
        Number1 <= "01100";  -- 12
        Number2 <= "01000";  -- 8
        S <= '1';
        WAIT FOR CLK_PERIOD * 2;
        S <= '0';
        WAIT FOR 100 ns;

        -- Test GCD(15, 10) = 5
        Number1 <= "01111";  -- 15
        Number2 <= "01010";  -- 10
        S <= '1';
        WAIT FOR CLK_PERIOD * 2;
        S <= '0';
        WAIT FOR 100 ns;

        WAIT;
    END PROCESS;
END behavioral;
