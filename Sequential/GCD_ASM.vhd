LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY GCD_ASM IS
    PORT (
        CLK, RESET, S : IN STD_LOGIC;
        Number1, Number2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        GCD : OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
END GCD_ASM;
ARCHITECTURE behavior OF GCD_ASM IS

    TYPE STATE IS (T0, T1, T2, T3, T4, T5, T6, T7);
    SIGNAL A : STD_LOGIC_VECTOR(4 DOWNTO 0) := (OTHERS => '0');
    SIGNAL B : STD_LOGIC_VECTOR(4 DOWNTO 0) := (OTHERS => '0');
    SIGNAL T : STD_LOGIC_VECTOR(4 DOWNTO 0) := (OTHERS => '0');
    SIGNAL K : INTEGER RANGE 0 TO 5 := 0;
    SIGNAL tmp : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL CURRENT_STATE, NEXT_STATE : STATE;
BEGIN
    --  state
    P1 : PROCESS (CLK, RESET)

    BEGIN
        IF RESET = '0' THEN
            CURRENT_STATE <= T0;
        ELSIF rising_edge(CLK) THEN
            CURRENT_STATE <= NEXT_STATE;
        END IF;

    END PROCESS P1;

    -- NEXT_STATE LOGIC

    P2 : PROCESS (CURRENT_STATE, S, A, B, K)
    BEGIN
        NEXT_STATE <= CURRENT_STATE;
        CASE CURRENT_STATE IS

            WHEN T0 => -- T0
                NEXT_STATE <= T1;
            WHEN T1 => -- T1
                IF S = '1' THEN
                    NEXT_STATE <= T2;
                ELSE
                    NEXT_STATE <= T1;
                END IF;

            WHEN T2 => -- T2
                IF Number1 = "00000" THEN
                    NEXT_STATE <= T1;
                ELSE
                    IF Number2 = "00000" THEN
                        NEXT_STATE <= T1;
                    ELSE
                        NEXT_STATE <= T3;
                    END IF;
                END IF;
            WHEN T3 => -- T3
                IF A(0) = '1' THEN
                    NEXT_STATE <= T4;
                ELSE
                    IF B(0) = '1' THEN
                        NEXT_STATE <= T4;
                    ELSE
                        NEXT_STATE <= T3;
                    END IF;
                END IF;
            WHEN T4 => -- T4
                IF A = B THEN
                    NEXT_STATE <= T7;
                ELSE
                    IF A(0) = '0' THEN
                        NEXT_STATE <= T4;
                    ELSIF B(0) = '0' THEN
                        NEXT_STATE <= T4;
                    ELSE
                        NEXT_STATE <= T5;
                    END IF;
                END IF;
            WHEN T5 => -- T5
                NEXT_STATE <= T6;

            WHEN T6 => -- T6
                NEXT_STATE <= T4;
            WHEN T7 => -- T7
                IF K = 0 THEN
                    NEXT_STATE <= T1;
                ELSE
                    NEXT_STATE <= T7;
                END IF;
            WHEN OTHERS =>
                NEXT_STATE <= T0;
        END CASE;
    END PROCESS P2;

    -- OUTPUT LOGIC
    P3 : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            CASE(CURRENT_STATE) IS
                WHEN T0 => -- T0
                tmp <= (OTHERS => '0');
                WHEN T1 => -- T1
                NULL;
                WHEN T2 => -- T2
                A <= Number1;
                B <= Number2;
                K <= 0;
                IF Number1 = "00000" THEN
                    tmp <= Number1;
                ELSIF Number2 = "00000" THEN
                    tmp <= Number2;
                ELSE
                    NULL;
                END IF;

                WHEN T3 => -- T3
                IF A(0) = '0' THEN
                    IF B(0) = '0' THEN
                        K <= K + 1;
                        A <= STD_LOGIC_VECTOR(shift_right(unsigned(A), 1));

                        B <= STD_LOGIC_VECTOR(shift_right(unsigned(B), 1));
                    ELSE
                        NULL;
                    END IF;
                END IF;

                WHEN T4 => -- T4
                IF A = B THEN
                    tmp <= A;
                ELSE
                    IF A(0) = '0' THEN
                        A <= STD_LOGIC_VECTOR(shift_right(unsigned(A), 1));
                    ELSE
                        IF B(0) = '0' THEN
                            B <= STD_LOGIC_VECTOR(shift_right(unsigned(B), 1));
                        ELSE
                            IF unsigned(A) < unsigned(B) THEN
                                T <= B;
                                B <= A;
                            ELSE
                                T <= A;
                            END IF;
                        END IF;
                    END IF;
                END IF;
                WHEN T5 => -- T5
                A <= STD_LOGIC_VECTOR(unsigned(T) - unsigned(B));

                WHEN T6 => -- T6
                A <= STD_LOGIC_VECTOR(shift_right(unsigned(A), 1));
                WHEN T7 => -- T7
                IF K = 0 THEN
                    NULL;
                ELSE
                    tmp <= STD_LOGIC_VECTOR(shift_left(unsigned(tmp), 1));
                    -- GCD <= GCD SLL 1;
                    K <= K - 1;

                END IF;
                WHEN OTHERS =>
                NULL;
            END CASE;
        END IF;
    END PROCESS P3;
    GCD <= tmp;
END behavior;
