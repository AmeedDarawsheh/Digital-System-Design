----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/08/2026 02:13:01 PM
-- Design Name:
-- Module Name: halfadder - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY halfadder IS
    PORT (
        a : IN STD_LOGIC;
        b : IN STD_LOGIC;
        s : OUT STD_LOGIC;
        c : OUT STD_LOGIC);
END halfadder;

ARCHITECTURE Behavioral OF halfadder IS

BEGIN

    s <= a XOR b;
    c <= a AND b;

END Behavioral;
