library ieee;
use ieee.std_logic_1164.all;

entity main_tb is
end main_tb;

architecture Behavioral of main_tb is
  -- Declare signals for the test bench
  signal Clock_tb       : std_logic := '1';
  signal start_tb       : std_logic := '1' ;
  signal reset_tb       : std_logic := '0' ;
  signal userMode_tb    : std_logic_vector(4 downto 0) := "10000" ;
  signal state_tb       : std_logic_vector(1 downto 0);
  signal SevSegData_tb  : std_logic_vector(6 downto 0);
  signal SevSegDriver_tb : std_logic_vector(7 downto 0);

  -- Instantiate the main entity
  component main
    Port (
      Clock       : in  std_logic;
      start       : in  std_logic;
      reset       : in  std_logic;
      state       : out std_logic_vector(1 downto 0);
      userMode    : in  std_logic_vector(4 downto 0);
      SevSegData  : out std_logic_vector(6 downto 0);
      SevSegDriver: out std_logic_vector(7 downto 0)
    );
  end component;
  
  -- Other signals or components required for the test bench can be added here
	constant MCLK_period: time := 20000 ns;      -- Assuming a 50kHz input clock (1 / 50kHz = 20 us)
   constant clk_period: time := 5000000 ns;       -- Desired 100Hz output clock period
	
	constant one_CK_period: time := 10000000 ns;    -- 1 clk 100Hz clock period
	constant CK_ten_period: time := 100000000 ns;    -- 1 cycle 10Hz clock period
	
begin
  -- Instantiate the main entity
  dut: main
    Port Map (
      Clock       => Clock_tb ,
      start       => start_tb ,
      reset       => reset_tb ,
      state       => state_tb ,
      userMode    => userMode_tb ,
      SevSegData  => SevSegData_tb ,
      SevSegDriver=> SevSegDriver_tb 
    );
	 
	 
    
  -- MCLK generation process
    MCLK_process: process
    begin
        while now < 1000 ms loop   -- Run for 400 milliseconds
            wait for MCLK_period / 2;
				Clock_tb <= not Clock_tb ;   -- Toggle the MCLK signal every MCLK_period
        end loop;
        wait;
    end process;
  
  -- Stimulus process for providing inputs
  process
  begin
	while now < 1000 ms loop
		 wait for 2500000 ns ;
		 assert state_tb = "11" report "Incorrect state" severity error;
		 assert SevSegData_tb = "1001110" report "Error: Unexpected SEV_SEG_DATA value for Whitespace Mode" severity error;
       assert SevSegDriver_tb = "01111111" report "Error: Unexpected SEV_SEG_DRIVER value for Whitespace Mode" severity error;
       wait for one_CK_period ;
		 
		 assert state_tb = "00" report "Incorrect state" severity error;
		 assert SevSegData_tb = "1111110" report "Error: Unexpected SEV_SEG_DATA value for Whitespace Mode" severity error;
       assert SevSegDriver_tb = "10111111" report "Error: Unexpected SEV_SEG_DRIVER value for Whitespace Mode" severity error; 
		 wait for (CK_ten_period * 5 );
		 
		 assert state_tb = "01" report "Incorrect state" severity error;
		 assert SevSegData_tb = "1000011" report "Error: Unexpected SEV_SEG_DATA value for Whitespace Mode" severity error;
       assert SevSegDriver_tb = "11011111" report "Error: Unexpected SEV_SEG_DRIVER value for Whitespace Mode" severity error; 
		 wait for (CK_ten_period * 3 );
		 
		 
		 assert state_tb = "10" report "Incorrect state" severity error;
		 assert SevSegData_tb = "1001110" report "Error: Unexpected SEV_SEG_DATA value for Whitespace Mode" severity error;
       assert SevSegDriver_tb = "01111111" report "Error: Unexpected SEV_SEG_DRIVER value for Whitespace Mode" severity error; 
		 wait for (CK_ten_period * 2 );
     end loop;
    wait;
  end process;
  
  -- Add assertions or other processes to monitor and check the outputs if needed
  
end Behavioral;