library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Defining the entity for the behavioral barrel shifter
entity barrel_shifter_behavioral is
    Port (
        X   : in std_logic_vector(3 downto 0); -- 4-bit input vector to be shifted
        sel : in std_logic_vector(1 downto 0); -- 2-bit selector to determine the shift amount
        Y   : out std_logic_vector(3 downto 0) -- 4-bit output vector after shifting
    );
end barrel_shifter_behavioral;

-- Defining the architecture of the behavioral barrel shifter
architecture behavioral of barrel_shifter_behavioral is

begin
    -- We use a selected signal assignment statement with the 'with-select' construct
    -- to determine the output based on the value of the selector (sel).
    with sel select
        Y <= X when "00", 									   -- If sel is "00", no shift operation is performed, and X is directly assigned to Y.
             X(2 downto 0) & X(3) when "01",          -- If sel is "01", perform a 1-bit right shift. The most significant bit (MSB) becomes the least significant bit (LSB).
             X(1 downto 0) & X(3 downto 2) when "10", -- If sel is "10", perform a 2-bit right shift. 
             X(0) & X(3 downto 1) when others;        -- For any other value of sel, "11" in this case, perform a 3-bit right shift.
end behavioral;

