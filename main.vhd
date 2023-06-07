library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
  Port (
    Clock       : in  std_logic;
    start       : in  std_logic;
    reset       : in  std_logic;
    state        : out std_logic_vector(1 downto 0);
    userMode   : in  std_logic_vector(4 downto 0);
    SevSegData  : out std_logic_vector(6 downto 0);
    SevSegDriver: out std_logic_vector(7 downto 0)
  );	
end main;

architecture Behavioral of main is
  signal dataSevSeg : std_logic_vector(4 downto 0);
  signal hz : std_logic;
  signal start_inv : std_logic;  -- Signal to store the inverted value of 'start'

  component washing_machine is
    Port (
      CK       : in  std_logic;
      start    : in  std_logic;
      reset    : in  std_logic;
      userMode : in  std_logic_vector(4 downto 0);
      state    : out std_logic_vector(1 downto 0)    
		);
  end component;

  component clock_divider is
    Port (
      reset          : in  std_logic;
      MCLK           : in  std_logic;
      HUNDREDHZCLOCK : out std_logic
    );
  end component;

  component SevSeg_Decoder is
    Port (
      INPUT     : in  std_logic_vector(4 downto 0);
      SEVSEG_BUS: out std_logic_vector(6 downto 0)
    );
  end component;

  component SevSeg_Driver is
    Port (
      userMode      : in  std_logic_vector(4 downto 0);
      CLK           : in  std_logic;
      start         : in  std_logic;
      SEV_SEG_DATA  : out std_logic_vector(4 downto 0);
      SEV_SEG_DRIVER: out std_logic_vector(7 downto 0)
    );
  end component;

  
begin
  clk : clock_divider Port Map(reset, Clock, hz);
  wsh : washing_machine Port Map(hz, start, reset, userMode, state);

   -- Assign inverted 'start' signal to 'start_inv'
   start_inv <= not start;

  driver : SevSeg_Driver
    PORT MAP(userMode, hz, start_inv, dataSevSeg, SevSegDriver);
  decoder : SevSeg_Decoder PORT MAP(dataSevSeg, SevSegData);
end Behavioral;