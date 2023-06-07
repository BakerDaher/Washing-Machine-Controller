library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity washing_machine is 
    Port(
        CK      : in std_logic;
        start   : in std_logic;
        reset   : in std_logic;
        userMode: in std_logic_vector(4 downto 0);
        state   : out std_logic_vector(1 downto 0)
    );
end washing_machine;

architecture Behavioral of washing_machine is
    signal hz      : std_logic;
    signal tState  : std_logic_vector(1 downto 0);

    signal washC   : integer;
    signal spinC   : integer;
    signal rinseC  : integer;
begin
    with userMode select washC <= 
        4 when "10000",
        5 when "01000",
        5 when "00100",
        0 when "00010",
        5 when "00001",
        0 when others;

    with userMode select spinC <= 
        3 when "10000",
        4 when "01000",
        3 when "00100",
        6 when "00010",
        3 when "00001",
        0 when others;

    with userMode select rinseC <= 
        3 when "10000",
        1 when "01000",
        2 when "00100",
        4 when "00010",
        2 when "00001",
        0 when others;
    
    process(CK, start, reset)
        variable curState : unsigned(1 downto 0) := "11";
        constant freq  : integer := 9 ;
        variable tick     : integer := 0;
        variable zero     : std_logic := '0';
        variable counter  : integer := 0 ;
    begin
        if rising_edge(CK) then
            if curState = "11" and start = '1'  then
                counter := washC;
                curState := "00";
            elsif curState = "11" and start = '0' then 
                curState := curState;
            end if;
            
            if reset = '1' then
                curState := "11";
                zero := '0';
                counter := 0;
                tick := 0;
            end if;
            
            if zero = '1' then
                curState := resize(curState, curState'length) + "01";
                zero := '0';
                tick := 0;
            end if;
            
            if curState = "00" and zero = '0' then
                if tick < freq then
                    tick := tick + 1;
                else
                    tick := 0;
                    counter := counter - 1;
                end if;
                
                if counter = 0 then
                    zero := '1';
                    counter := spinC;
                end if;
            end if;
        
            if curState = "01" and zero = '0' then
                if tick < freq then
                    tick := tick + 1;
                else
                    tick := 0;
                    counter := counter - 1;
                end if;
                
                if counter = 0 then
                    zero := '1';
                    counter := rinseC;
                end if;
            end if;
            
            if curState = "10" and zero = '0' then
                if tick < freq then
                    tick := tick + 1;
                else
                    tick := 0;
                    counter := counter - 1;
                end if;
                
                if counter = 0 then
                    curState := "11";
                end if;
            end if;
        end if;
        
        tState <= std_logic_vector(curState);
    end process;
			state <= tState ;
		
end Behavioral;
