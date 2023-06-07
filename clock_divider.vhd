library ieee;
use ieee.std_logic_1164.all;

entity clock_divider is
    port(
		  reset: in std_logic ;
        MCLK : in  std_logic;   
        HUNDREDHZCLOCK : buffer std_logic   
    );
end clock_divider;

architecture behavioral of clock_divider is
	  signal counter : integer range 0 to 250 := 0; 
begin
	
    process(MCLK , reset)
    begin
		if reset = '1' then
			HUNDREDHZCLOCK <= '0' ;
        elsif rising_edge(MCLK) then
            counter <= counter + 1;
            if counter = 250 - 1  then   
                HUNDREDHZCLOCK <= not HUNDREDHZCLOCK ;    
                counter <= 0;              
            end if;
        end if;
    end process;
end behavioral;
