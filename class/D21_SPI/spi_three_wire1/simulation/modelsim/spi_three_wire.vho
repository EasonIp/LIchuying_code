-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "02/06/2017 11:52:50"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	spi_three_wire IS
    PORT (
	reset : IN std_logic;
	CLK : IN std_logic;
	GO : IN std_logic;
	bitcount : IN std_logic_vector(3 DOWNTO 0);
	SCLK : OUT std_logic;
	bitcountEN : OUT std_logic;
	rstbitcount : OUT std_logic;
	LDEN : OUT std_logic;
	SHEN : OUT std_logic;
	SCEN : OUT std_logic;
	ORDY : OUT std_logic;
	SPC : OUT std_logic
	);
END spi_three_wire;

-- Design Ports Information
-- SCLK	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitcountEN	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rstbitcount	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LDEN	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SHEN	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SCEN	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ORDY	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SPC	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitcount[0]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitcount[1]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitcount[2]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitcount[3]	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- GO	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF spi_three_wire IS
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
SIGNAL ww_CLK : std_logic;
SIGNAL ww_GO : std_logic;
SIGNAL ww_bitcount : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SCLK : std_logic;
SIGNAL ww_bitcountEN : std_logic;
SIGNAL ww_rstbitcount : std_logic;
SIGNAL ww_LDEN : std_logic;
SIGNAL ww_SHEN : std_logic;
SIGNAL ww_SCEN : std_logic;
SIGNAL ww_ORDY : std_logic;
SIGNAL ww_SPC : std_logic;
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rstbitcount~0_combout\ : std_logic;
SIGNAL \bitcount[0]~input_o\ : std_logic;
SIGNAL \bitcount[1]~input_o\ : std_logic;
SIGNAL \bitcount[2]~input_o\ : std_logic;
SIGNAL \bitcount[3]~input_o\ : std_logic;
SIGNAL \GO~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \SCLK~output_o\ : std_logic;
SIGNAL \bitcountEN~output_o\ : std_logic;
SIGNAL \rstbitcount~output_o\ : std_logic;
SIGNAL \LDEN~output_o\ : std_logic;
SIGNAL \SHEN~output_o\ : std_logic;
SIGNAL \SCEN~output_o\ : std_logic;
SIGNAL \ORDY~output_o\ : std_logic;
SIGNAL \SPC~output_o\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \fstate.X_SHIFT~q\ : std_logic;
SIGNAL \rstbitcount~1_combout\ : std_logic;
SIGNAL \fstate.X_STOP~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \fstate.X_IDLE~q\ : std_logic;
SIGNAL \reg_fstate.X_START~0_combout\ : std_logic;
SIGNAL \fstate.X_START~q\ : std_logic;
SIGNAL \SCLK~0_combout\ : std_logic;
SIGNAL \SCEN~0_combout\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \SPC~0_combout\ : std_logic;
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;

BEGIN

ww_reset <= reset;
ww_CLK <= CLK;
ww_GO <= GO;
ww_bitcount <= bitcount;
SCLK <= ww_SCLK;
bitcountEN <= ww_bitcountEN;
rstbitcount <= ww_rstbitcount;
LDEN <= ww_LDEN;
SHEN <= ww_SHEN;
SCEN <= ww_SCEN;
ORDY <= ww_ORDY;
SPC <= ww_SPC;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;

-- Location: LCCOMB_X24_Y1_N10
\rstbitcount~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \rstbitcount~0_combout\ = (\bitcount[0]~input_o\ & (\bitcount[1]~input_o\ & (\bitcount[2]~input_o\ & \bitcount[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bitcount[0]~input_o\,
	datab => \bitcount[1]~input_o\,
	datac => \bitcount[2]~input_o\,
	datad => \bitcount[3]~input_o\,
	combout => \rstbitcount~0_combout\);

-- Location: IOIBUF_X20_Y0_N8
\bitcount[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitcount(0),
	o => \bitcount[0]~input_o\);

-- Location: IOIBUF_X24_Y0_N1
\bitcount[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitcount(1),
	o => \bitcount[1]~input_o\);

-- Location: IOIBUF_X20_Y0_N1
\bitcount[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitcount(2),
	o => \bitcount[2]~input_o\);

-- Location: IOIBUF_X29_Y0_N8
\bitcount[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitcount(3),
	o => \bitcount[3]~input_o\);

-- Location: IOIBUF_X24_Y0_N8
\GO~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_GO,
	o => \GO~input_o\);

-- Location: CLKCTRL_G17
\CLK~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~inputclkctrl_outclk\);

-- Location: IOOBUF_X14_Y0_N2
\SCLK~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SCLK~0_combout\,
	devoe => ww_devoe,
	o => \SCLK~output_o\);

-- Location: IOOBUF_X26_Y0_N2
\bitcountEN~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fstate.X_SHIFT~q\,
	devoe => ww_devoe,
	o => \bitcountEN~output_o\);

-- Location: IOOBUF_X12_Y0_N9
\rstbitcount~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rstbitcount~1_combout\,
	devoe => ww_devoe,
	o => \rstbitcount~output_o\);

-- Location: IOOBUF_X22_Y0_N2
\LDEN~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fstate.X_START~q\,
	devoe => ww_devoe,
	o => \LDEN~output_o\);

-- Location: IOOBUF_X26_Y0_N9
\SHEN~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fstate.X_SHIFT~q\,
	devoe => ww_devoe,
	o => \SHEN~output_o\);

-- Location: IOOBUF_X12_Y0_N2
\SCEN~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SCEN~0_combout\,
	devoe => ww_devoe,
	o => \SCEN~output_o\);

-- Location: IOOBUF_X22_Y0_N9
\ORDY~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fstate.X_STOP~q\,
	devoe => ww_devoe,
	o => \ORDY~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\SPC~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SPC~0_combout\,
	devoe => ww_devoe,
	o => \SPC~output_o\);

-- Location: LCCOMB_X24_Y1_N0
\Selector1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\fstate.X_START~q\) # ((!\rstbitcount~0_combout\ & \fstate.X_SHIFT~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rstbitcount~0_combout\,
	datac => \fstate.X_SHIFT~q\,
	datad => \fstate.X_START~q\,
	combout => \Selector1~0_combout\);

-- Location: IOIBUF_X16_Y0_N22
\reset~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G19
\reset~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: FF_X24_Y1_N1
\fstate.X_SHIFT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Selector1~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.X_SHIFT~q\);

-- Location: LCCOMB_X24_Y1_N8
\rstbitcount~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \rstbitcount~1_combout\ = (\rstbitcount~0_combout\ & \fstate.X_SHIFT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rstbitcount~0_combout\,
	datad => \fstate.X_SHIFT~q\,
	combout => \rstbitcount~1_combout\);

-- Location: FF_X24_Y1_N19
\fstate.X_STOP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	asdata => \rstbitcount~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.X_STOP~q\);

-- Location: LCCOMB_X24_Y1_N2
\Selector0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (!\fstate.X_STOP~q\ & ((\GO~input_o\) # (\fstate.X_IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GO~input_o\,
	datac => \fstate.X_IDLE~q\,
	datad => \fstate.X_STOP~q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X24_Y1_N3
\fstate.X_IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Selector0~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.X_IDLE~q\);

-- Location: LCCOMB_X24_Y1_N28
\reg_fstate.X_START~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_fstate.X_START~0_combout\ = (\GO~input_o\ & !\fstate.X_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GO~input_o\,
	datad => \fstate.X_IDLE~q\,
	combout => \reg_fstate.X_START~0_combout\);

-- Location: FF_X24_Y1_N29
\fstate.X_START\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \reg_fstate.X_START~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.X_START~q\);

-- Location: LCCOMB_X23_Y1_N4
\SCLK~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SCLK~0_combout\ = (\fstate.X_START~q\) # (!\fstate.X_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fstate.X_START~q\,
	datad => \fstate.X_IDLE~q\,
	combout => \SCLK~0_combout\);

-- Location: LCCOMB_X24_Y1_N18
\SCEN~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SCEN~0_combout\ = (\fstate.X_STOP~q\) # (!\fstate.X_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \fstate.X_STOP~q\,
	datad => \fstate.X_IDLE~q\,
	combout => \SCEN~0_combout\);

-- Location: IOIBUF_X16_Y0_N15
\CLK~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: LCCOMB_X23_Y1_N6
\SPC~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SPC~0_combout\ = (\fstate.X_START~q\) # ((!\fstate.X_IDLE~q\) # (!\CLK~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fstate.X_START~q\,
	datac => \CLK~input_o\,
	datad => \fstate.X_IDLE~q\,
	combout => \SPC~0_combout\);

ww_SCLK <= \SCLK~output_o\;

ww_bitcountEN <= \bitcountEN~output_o\;

ww_rstbitcount <= \rstbitcount~output_o\;

ww_LDEN <= \LDEN~output_o\;

ww_SHEN <= \SHEN~output_o\;

ww_SCEN <= \SCEN~output_o\;

ww_ORDY <= \ORDY~output_o\;

ww_SPC <= \SPC~output_o\;
END structure;


