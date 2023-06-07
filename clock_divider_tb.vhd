library ieee;
use ieee.std_logic_1164.all;

entity clock_divider_tb is
end clock_divider_tb;

architecture behavioral of clock_divider_tb is
    component clock_divider is
        port (
            reset: in std_logic;
            MCLK: in std_logic;
            HUNDREDHZCLOCK: buffer std_logic
        );
    end component;

    signal reset_tb: std_logic := '0';
    signal MCLK_tb: std_logic := '1';
    signal HUNDREDHZCLOCK_tb: std_logic;

    constant MCLK_period: time := 20000 ns;      -- Assuming a 50kHz input clock (1 / 50kHz = 20 us)
    constant clk_period: time := 5000000 ns;       -- Desired 100Hz output clock period

	begin
    uut: clock_divider
        port map (
            reset => reset_tb,
            MCLK => MCLK_tb,
            HUNDREDHZCLOCK => HUNDREDHZCLOCK_tb
        );

    -- MCLK generation process
    MCLK_process: process
    begin
        while now < 1000 ms loop   -- Run for 400 milliseconds
            wait for MCLK_period / 2;
				MCLK_tb <= not MCLK_tb;   -- Toggle the MCLK signal every MCLK_period
        end loop;
        wait;
    end process;
	 
    -- Check the frequency of the output clock
    frequency_check_process2: process
    begin
        wait for clk_period;   -- Wait for one period of the output clock
        while now < 1000 ms loop   -- Run for 400 milliseconds
            -- wait for clk_period
				assert HUNDREDHZCLOCK_tb = '0' report "Incorrect output clock frequency" severity error;
            wait for clk_period;
            assert HUNDREDHZCLOCK_tb = '1' report "Incorrect output clock frequency" severity error;
				wait for clk_period;
        end loop;
        wait;
    end process;

end behavioral;