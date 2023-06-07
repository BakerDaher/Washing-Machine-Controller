-- Copyright (C) 2022  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.0 Build 915 10/25/2022 SC Lite Edition"

-- DATE "06/07/2023 09:06:21"

-- 
-- Device: Altera 5M40ZM64C4 Package MBGA64
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	clock_divider IS
    PORT (
	reset : IN std_logic;
	MCLK : IN std_logic;
	HUNDREDHZCLOCK : BUFFER std_logic
	);
END clock_divider;

-- Design Ports Information


ARCHITECTURE structure OF clock_divider IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_MCLK : std_logic;
SIGNAL ww_HUNDREDHZCLOCK : std_logic;
SIGNAL \MCLK~combout\ : std_logic;
SIGNAL \Add0~15_combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~17COUT1_45\ : std_logic;
SIGNAL \Add0~12\ : std_logic;
SIGNAL \Add0~12COUT1_46\ : std_logic;
SIGNAL \Add0~5_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~2COUT1_41\ : std_logic;
SIGNAL \Add0~35_combout\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~37COUT1_42\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \Add0~32\ : std_logic;
SIGNAL \Add0~32COUT1_43\ : std_logic;
SIGNAL \Add0~25_combout\ : std_logic;
SIGNAL \Equal0~1\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~27COUT1_44\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Equal0~0\ : std_logic;
SIGNAL \HUNDREDHZCLOCK~reg0_regout\ : std_logic;
SIGNAL counter : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_reset~combout\ : std_logic;

BEGIN

ww_reset <= reset;
ww_MCLK <= MCLK;
HUNDREDHZCLOCK <= ww_HUNDREDHZCLOCK;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_reset~combout\ <= NOT \reset~combout\;

-- Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\MCLK~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_MCLK,
	combout => \MCLK~combout\);

-- Location: LC_X4_Y3_N5
\Add0~15\ : maxv_lcell
-- Equation(s):
-- \Add0~15_combout\ = (counter(5) $ ((\Add0~22\)))
-- \Add0~17\ = CARRY(((!\Add0~22\) # (!counter(5))))
-- \Add0~17COUT1_45\ = CARRY(((!\Add0~22\) # (!counter(5))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => counter(5),
	cin => \Add0~22\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~15_combout\,
	cout0 => \Add0~17\,
	cout1 => \Add0~17COUT1_45\);

-- Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: LC_X3_Y3_N2
\counter[5]\ : maxv_lcell
-- Equation(s):
-- counter(5) = DFFEAS(((\Add0~15_combout\ & ((!\Equal0~1\) # (!\Equal0~0\)))), GLOBAL(\MCLK~combout\), VCC, , !\reset~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3f00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~combout\,
	datab => \Equal0~0\,
	datac => \Equal0~1\,
	datad => \Add0~15_combout\,
	aclr => GND,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(5));

-- Location: LC_X4_Y3_N6
\Add0~10\ : maxv_lcell
-- Equation(s):
-- \Add0~10_combout\ = (counter(6) $ ((!(!\Add0~22\ & \Add0~17\) # (\Add0~22\ & \Add0~17COUT1_45\))))
-- \Add0~12\ = CARRY(((counter(6) & !\Add0~17\)))
-- \Add0~12COUT1_46\ = CARRY(((counter(6) & !\Add0~17COUT1_45\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => counter(6),
	cin => \Add0~22\,
	cin0 => \Add0~17\,
	cin1 => \Add0~17COUT1_45\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~10_combout\,
	cout0 => \Add0~12\,
	cout1 => \Add0~12COUT1_46\);

-- Location: LC_X4_Y3_N7
\Add0~5\ : maxv_lcell
-- Equation(s):
-- \Add0~5_combout\ = (((!\Add0~22\ & \Add0~12\) # (\Add0~22\ & \Add0~12COUT1_46\) $ (counter(7))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datad => counter(7),
	cin => \Add0~22\,
	cin0 => \Add0~12\,
	cin1 => \Add0~12COUT1_46\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~5_combout\);

-- Location: LC_X3_Y3_N5
\counter[7]\ : maxv_lcell
-- Equation(s):
-- counter(7) = DFFEAS(((\Add0~5_combout\ & ((!\Equal0~1\) # (!\Equal0~0\)))), GLOBAL(\MCLK~combout\), VCC, , !\reset~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3f00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~combout\,
	datab => \Equal0~0\,
	datac => \Equal0~1\,
	datad => \Add0~5_combout\,
	aclr => GND,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(7));

-- Location: LC_X4_Y3_N0
\Add0~0\ : maxv_lcell
-- Equation(s):
-- \Add0~0_combout\ = ((!counter(0)))
-- \Add0~2\ = CARRY(((counter(0))))
-- \Add0~2COUT1_41\ = CARRY(((counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => counter(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~0_combout\,
	cout0 => \Add0~2\,
	cout1 => \Add0~2COUT1_41\);

-- Location: LC_X3_Y3_N7
\counter[0]\ : maxv_lcell
-- Equation(s):
-- \Equal0~0\ = (counter(6) & (counter(7) & (counter[0] & counter(5))))
-- counter(0) = DFFEAS(\Equal0~0\, GLOBAL(\MCLK~combout\), VCC, , !\reset~combout\, \Add0~0_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~combout\,
	dataa => counter(6),
	datab => counter(7),
	datac => \Add0~0_combout\,
	datad => counter(5),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~0\,
	regout => counter(0));

-- Location: LC_X4_Y3_N1
\Add0~35\ : maxv_lcell
-- Equation(s):
-- \Add0~35_combout\ = counter(1) $ ((((\Add0~2\))))
-- \Add0~37\ = CARRY(((!\Add0~2\)) # (!counter(1)))
-- \Add0~37COUT1_42\ = CARRY(((!\Add0~2COUT1_41\)) # (!counter(1)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => counter(1),
	cin0 => \Add0~2\,
	cin1 => \Add0~2COUT1_41\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~35_combout\,
	cout0 => \Add0~37\,
	cout1 => \Add0~37COUT1_42\);

-- Location: LC_X4_Y3_N8
\counter[1]\ : maxv_lcell
-- Equation(s):
-- counter(1) = DFFEAS(((\Add0~35_combout\ & ((!\Equal0~0\) # (!\Equal0~1\)))), GLOBAL(\MCLK~combout\), VCC, , !\reset~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5f00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~combout\,
	dataa => \Equal0~1\,
	datac => \Equal0~0\,
	datad => \Add0~35_combout\,
	aclr => GND,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(1));

-- Location: LC_X4_Y3_N2
\Add0~30\ : maxv_lcell
-- Equation(s):
-- \Add0~30_combout\ = (counter(2) $ ((!\Add0~37\)))
-- \Add0~32\ = CARRY(((counter(2) & !\Add0~37\)))
-- \Add0~32COUT1_43\ = CARRY(((counter(2) & !\Add0~37COUT1_42\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => counter(2),
	cin0 => \Add0~37\,
	cin1 => \Add0~37COUT1_42\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~30_combout\,
	cout0 => \Add0~32\,
	cout1 => \Add0~32COUT1_43\);

-- Location: LC_X3_Y3_N4
\counter[2]\ : maxv_lcell
-- Equation(s):
-- \Equal0~1\ = (counter(4) & (counter(3) & (!counter[2] & !counter(1))))
-- counter(2) = DFFEAS(\Equal0~1\, GLOBAL(\MCLK~combout\), VCC, , !\reset~combout\, \Add0~30_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0008",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~combout\,
	dataa => counter(4),
	datab => counter(3),
	datac => \Add0~30_combout\,
	datad => counter(1),
	aclr => GND,
	sload => VCC,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~1\,
	regout => counter(2));

-- Location: LC_X4_Y3_N3
\Add0~25\ : maxv_lcell
-- Equation(s):
-- \Add0~25_combout\ = (counter(3) $ ((\Add0~32\)))
-- \Add0~27\ = CARRY(((!\Add0~32\) # (!counter(3))))
-- \Add0~27COUT1_44\ = CARRY(((!\Add0~32COUT1_43\) # (!counter(3))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => counter(3),
	cin0 => \Add0~32\,
	cin1 => \Add0~32COUT1_43\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~25_combout\,
	cout0 => \Add0~27\,
	cout1 => \Add0~27COUT1_44\);

-- Location: LC_X3_Y3_N6
\counter[3]\ : maxv_lcell
-- Equation(s):
-- counter(3) = DFFEAS((\Add0~25_combout\ & (((!\Equal0~0\)) # (!\Equal0~1\))), GLOBAL(\MCLK~combout\), VCC, , !\reset~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7070",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~combout\,
	dataa => \Equal0~1\,
	datab => \Equal0~0\,
	datac => \Add0~25_combout\,
	aclr => GND,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(3));

-- Location: LC_X4_Y3_N4
\Add0~20\ : maxv_lcell
-- Equation(s):
-- \Add0~20_combout\ = counter(4) $ ((((!\Add0~27\))))
-- \Add0~22\ = CARRY((counter(4) & ((!\Add0~27COUT1_44\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => counter(4),
	cin0 => \Add0~27\,
	cin1 => \Add0~27COUT1_44\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~20_combout\,
	cout => \Add0~22\);

-- Location: LC_X3_Y3_N8
\counter[4]\ : maxv_lcell
-- Equation(s):
-- counter(4) = DFFEAS(((\Add0~20_combout\ & ((!\Equal0~1\) # (!\Equal0~0\)))), GLOBAL(\MCLK~combout\), VCC, , !\reset~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3f00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~combout\,
	datab => \Equal0~0\,
	datac => \Equal0~1\,
	datad => \Add0~20_combout\,
	aclr => GND,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(4));

-- Location: LC_X4_Y3_N9
\counter[6]\ : maxv_lcell
-- Equation(s):
-- counter(6) = DFFEAS(((\Add0~10_combout\ & ((!\Equal0~1\) # (!\Equal0~0\)))), GLOBAL(\MCLK~combout\), VCC, , !\reset~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "30f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~combout\,
	datab => \Equal0~0\,
	datac => \Add0~10_combout\,
	datad => \Equal0~1\,
	aclr => GND,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(6));

-- Location: LC_X3_Y3_N9
\HUNDREDHZCLOCK~reg0\ : maxv_lcell
-- Equation(s):
-- \HUNDREDHZCLOCK~reg0_regout\ = DFFEAS(\HUNDREDHZCLOCK~reg0_regout\ $ (((\Equal0~0\ & (\Equal0~1\)))), GLOBAL(\MCLK~combout\), !\reset~combout\, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6c6c",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~combout\,
	dataa => \Equal0~0\,
	datab => \HUNDREDHZCLOCK~reg0_regout\,
	datac => \Equal0~1\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \HUNDREDHZCLOCK~reg0_regout\);

-- Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\HUNDREDHZCLOCK~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \HUNDREDHZCLOCK~reg0_regout\,
	oe => VCC,
	padio => ww_HUNDREDHZCLOCK);
END structure;


