----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/10/2020 10:59:59 AM
-- Design Name: 
-- Module Name: padding_unit_test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity padding_unit_test is
--  Port ( );
end padding_unit_test;

architecture Behavioral of padding_unit_test is

component padding_unit is
    Generic (addr_length_g : Integer := 10;
             data_size_g : Integer := 8;
             input_image_length_g : Integer := 25;
             output_image_length_g : Integer := 27);
             
    Port ( clk : in STD_LOGIC;
           rst_n : in STD_LOGIC;
           start_in : in STD_LOGIC;
           finished_out : out STD_LOGIC;
           ioi_wea_out : out STD_LOGIC_VECTOR(0 DOWNTO 0);
           ioi_addra_out : out STD_LOGIC_VECTOR(addr_length_g -1 DOWNTO 0);
           ioi_douta_in : in STD_LOGIC_VECTOR(data_size_g -1 DOWNTO 0);
           padi_wea_out : out STD_LOGIC_VECTOR(0 DOWNTO 0);
           padi_addra_out : out STD_LOGIC_VECTOR(addr_length_g -1 DOWNTO 0);
           padi_dina_out : out STD_LOGIC_VECTOR(data_size_g -1 DOWNTO 0);
           padi_web_out : out STD_LOGIC_VECTOR(0 DOWNTO 0);
           padi_addrb_out : out STD_LOGIC_VECTOR(addr_length_g -1 DOWNTO 0);
           padi_dinb_out : out STD_LOGIC_VECTOR(data_size_g -1 DOWNTO 0));
end component;

signal clk : STD_LOGIC := '0';
signal rst_n : STD_LOGIC;
signal start : STD_LOGIC;
signal finished : STD_LOGIC;
signal ioi_wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal ioi_addra : STD_LOGIC_VECTOR(9 DOWNTO 0);
signal ioi_douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal padi_wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal padi_addra : STD_LOGIC_VECTOR(9 DOWNTO 0);
signal padi_dina : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal padi_web : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal padi_addrb : STD_LOGIC_VECTOR(9 DOWNTO 0);
signal padi_dinb : STD_LOGIC_VECTOR(7 DOWNTO 0);
begin

uut_1 : padding_unit
    port map (clk => clk,
              rst_n => rst_n,
              start_in =>  start,
              finished_out => finished,
              ioi_wea_out => ioi_wea,
              ioi_addra_out => ioi_addra,
              ioi_douta_in => ioi_douta,
              padi_wea_out => padi_wea,
              padi_addra_out => padi_addra,
              padi_dina_out => padi_dina,
              padi_web_out => padi_web,
              padi_addrb_out => padi_addrb,
              padi_dinb_out => padi_dinb);

clk <= not clk after 5ns;

stimuli : process
    begin
        start <= '0';
        rst_n <= '1';
        ioi_douta <= "00000001";
        wait for 5ns;
        start <= '1';
        wait for 10ns;
        start <= '0';
        wait;
    end process;

end Behavioral;
