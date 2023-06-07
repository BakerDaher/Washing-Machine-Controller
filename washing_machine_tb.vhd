library ieee;
use ieee.std_logic_1164.all;

entity washing_machine_tb is
end washing_machine_tb;

architecture behavioral of washing_machine_tb is
    component washing_machine is 
        port (
            CK: in std_logic;
            start: in std_logic;
            reset: in std_logic;
            userMode: in std_logic_vector(4 downto 0);
            state: out std_logic_vector(1 downto 0)
        );
    end component;

    signal CK_tb: std_logic := '1';
    signal start_tb: std_logic := '1';
    signal reset_tb: std_logic := '0';
    signal userMode_tb: std_logic_vector(4 downto 0) := "10000";
    signal state_tb: std_logic_vector(1 downto 0);
	 
	 -- 100Hz = 10^10 = 1 clk
    constant CK_period: time := 10000000 ns;    -- 1 clk 100Hz clock period
	 constant CK_ten_period: time := 100000000 ns;    -- 1 cycle 10Hz clock period
begin
    uut: washing_machine
        port map (
            CK => CK_tb,
            start => start_tb,
            reset => reset_tb,
            userMode => userMode_tb,
            state => state_tb
        );

    -- Clock generation process
    clock_process: process
    begin
        while now < 1000 ms loop   -- Run for 400 milliseconds
            wait for CK_period / 2;
				CK_tb <= not CK_tb;   -- Toggle the CK signal every CK_period
        end loop;
        wait;
    end process;

    check_process: process
    begin
        
        while now < 1000 ms loop   -- Run for 400 milliseconds
				wait for 5000000 ns;
			   assert state_tb = "11" report "Incorrect state" severity error;
            wait for CK_period ;
				
				-- Add assertions or print statements to check the state and time_sn signals
            -- For example:
				
            assert state_tb = "00" report "Incorrect state" severity error;
            wait for (CK_ten_period * 4 );
				
				-- assert time_sn_tb = "00100" report "Incorrect time_sn" severity error;
            
            assert state_tb = "01" report "Incorrect state" severity error;
				wait for (CK_ten_period * 3 );
				
				
            assert state_tb = "10" report "Incorrect state" severity error;
				wait for (CK_ten_period * 3 ) - CK_period  ;
        
		  end loop;
        wait;
    end process;

end behavioral;