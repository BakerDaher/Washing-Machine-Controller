LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SevSeg_Decoder_tb IS
END SevSeg_Decoder_tb;

ARCHITECTURE behavior OF SevSeg_Decoder_tb IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT SevSeg_Decoder
    PORT (
        INPUT      : IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
        SEVSEG_BUS : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
    END COMPONENT;

    -- Inputs
    SIGNAL INPUT      : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
    -- Outputs
    SIGNAL SEVSEG_BUS : STD_LOGIC_VECTOR (6 DOWNTO 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: SevSeg_Decoder PORT MAP (
        INPUT      => INPUT,
        SEVSEG_BUS => SEVSEG_BUS
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test input values
        INPUT <= "00000"; -- 0
        wait for 10 ns;
        assert SEVSEG_BUS = "1111110" report "Error: Unexpected output for input 00000" severity error;

        INPUT <= "00001"; -- 1
        wait for 10 ns;
        assert SEVSEG_BUS = "0110000" report "Error: Unexpected output for input 00001" severity error;

        wait;
    end process;

END;
