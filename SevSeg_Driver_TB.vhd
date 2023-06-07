LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SevSeg_Driver_Tb IS
END SevSeg_Driver_Tb;

ARCHITECTURE behavior OF SevSeg_Driver_tb IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT SevSeg_Driver
    PORT (
        userMode      : IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
        CLK           : IN  STD_LOGIC;
        start         : IN  STD_LOGIC;
        SEV_SEG_DATA  : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
        SEV_SEG_DRIVER: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
    END COMPONENT;

    -- Inputs
    SIGNAL userMode      : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
    SIGNAL CLK           : STD_LOGIC := '1';
    SIGNAL start         : STD_LOGIC := '0';
    -- Outputs
    SIGNAL SEV_SEG_DATA  : STD_LOGIC_VECTOR (4 DOWNTO 0);
    SIGNAL SEV_SEG_DRIVER: STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: SevSeg_Driver PORT MAP (
        userMode      => userMode,
        CLK           => CLK,
        start         => start,
        SEV_SEG_DATA  => SEV_SEG_DATA,
        SEV_SEG_DRIVER=> SEV_SEG_DRIVER
    );

    -- Clock process
    clk_proc: process
    begin
        while now < 80000000 ns loop
            CLK <= '1';
            wait for 5000000 ns;
            CLK <= '0';
            wait for 5000000 ns;
        end loop;
        wait;
    end process clk_proc;

    -- Stimulus process
    stim_proc: process
    begin
		 
        userMode <= "00001"; -- Whitespace Mode
        start <= '0';
		  wait for 5000000 ns;
        assert SEV_SEG_DATA = "10000" report "Error: Unexpected SEV_SEG_DATA value for Whitespace Mode" severity error;
        assert SEV_SEG_DRIVER = "01111111" report "Error: Unexpected SEV_SEG_DRIVER value for Whitespace Mode" severity error;
		  wait for 10000000 ns;
		  
		  
		  assert SEV_SEG_DATA = "10001" report "Error: Unexpected SEV_SEG_DATA value for Whitespace Mode" severity error;
        assert SEV_SEG_DRIVER = "10111111" report "Error: Unexpected SEV_SEG_DRIVER value for Whitespace Mode" severity error;
		  wait for 100000000 ns;
		  
		  assert SEV_SEG_DATA = "10111" report "Error: Unexpected SEV_SEG_DATA value for Whitespace Mode" severity error;
        assert SEV_SEG_DRIVER = "11011111" report "Error: Unexpected SEV_SEG_DRIVER value for Whitespace Mode" severity error;
		  wait for 100000000 ns;
		  
		  
		  assert SEV_SEG_DATA = "11011" report "Error: Unexpected SEV_SEG_DATA value for Whitespace Mode" severity error;
        assert SEV_SEG_DRIVER = "11101111" report "Error: Unexpected SEV_SEG_DRIVER value for Whitespace Mode" severity error;
		  wait for 100000000 ns;
		  
		  assert SEV_SEG_DATA = "10110" report "Error: Unexpected SEV_SEG_DATA value for Whitespace Mode" severity error;
        assert SEV_SEG_DRIVER = "11110111" report "Error: Unexpected SEV_SEG_DRIVER value for Whitespace Mode" severity error;
		  wait for 100000000 ns;
		  
		  assert SEV_SEG_DATA = "01110" report "Error: Unexpected SEV_SEG_DATA value for Whitespace Mode" severity error;
        assert SEV_SEG_DRIVER = "11111011" report "Error: Unexpected SEV_SEG_DRIVER value for Whitespace Mode" severity error;
		  wait for 100000000 ns;
		  
		   assert SEV_SEG_DATA = "11010" report "Error: Unexpected SEV_SEG_DATA value for Whitespace Mode" severity error;
        assert SEV_SEG_DRIVER = "11111101" report "Error: Unexpected SEV_SEG_DRIVER value for Whitespace Mode" severity error;
		  wait for 100000000 ns;
		  
		   assert SEV_SEG_DATA = "11010" report "Error: Unexpected SEV_SEG_DATA value for Whitespace Mode" severity error;
        assert SEV_SEG_DRIVER = "11111110" report "Error: Unexpected SEV_SEG_DRIVER value for Whitespace Mode" severity error;
		  wait for 100000000 ns;
		  
        -- Add more test cases for other modes and expected output values

        -- End the simulation
        wait;
		  
    end process stim_proc;
	 
end behavior ;
	 