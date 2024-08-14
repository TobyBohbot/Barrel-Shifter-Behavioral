library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL ;


entity testbench_barrel_shifter is
end testbench_barrel_shifter;

architecture testbench_arch of testbench_barrel_shifter is
    -- Declaration of the barrel shifter component to be tested.
    component barrel_shifter_behavioral
        Port (
            X   : in std_logic_vector(3 downto 0); -- Input vector to be shifted
            sel : in std_logic_vector(1 downto 0); -- Selector vector indicating the shift amount
            Y   : out std_logic_vector(3 downto 0) -- Output shifted vector
        );
    end component;

    -- Signals corresponding to the inputs and output of the barrel shifter for simulation.
    signal X : std_logic_vector(3 downto 0);
    signal sel : std_logic_vector(1 downto 0);
    signal Y : std_logic_vector(3 downto 0);

begin

    -- Instantiation of the barrel shifter with mapping of testbench signals to component ports.
    UUT: barrel_shifter_behavioral port map (
        X => X,
        sel => sel,
        Y => Y
    );

    -- Stimulus process
    test: process
    begin
		-- Nested loop to test all possible combinations of inputs.
		-- Outer loop: iterate through all possible values of X (0 to 15, since X is 4 bits).
        for i in 0 to 15 loop
            X <= std_logic_vector(to_unsigned(i, 4)); -- Convert loop index to std_logic_vector for X.
				
				-- Inner loop: iterate through all possible shift amounts (0 to 3, since sel is 2 bits).
            for j in 0 to 3 loop
                sel <= std_logic_vector(to_unsigned(j, 2)); -- Convert loop index to std_logic_vector for sel.
                wait for 10 ns;
            end loop;
        end loop;

        wait;
    end process test;

end testbench_arch;
