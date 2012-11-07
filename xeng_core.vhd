library IEEE;
use IEEE.std_logic_1164.all;

entity xeng_core is
  port (
    ant: in std_logic_vector(15 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    mcnt_in: in std_logic_vector(31 downto 0); 
    sync_in: in std_logic; 
    window_valid: in std_logic; 
    burst_out: out std_logic_vector(31 downto 0); 
    mcnt_out: out std_logic_vector(31 downto 0); 
    sync_out: out std_logic; 
    valid_out: out std_logic
  );
end xeng_core;

architecture structural of xeng_core is
begin
end structural;

