library IEEE;
use IEEE.std_logic_1164.all;

entity cgain_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    gain: in std_logic_vector(15 downto 0); 
    im: in std_logic_vector(7 downto 0); 
    phase: in std_logic_vector(11 downto 0); 
    re: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    a: out std_logic_vector(15 downto 0); 
    b: out std_logic_vector(11 downto 0); 
    sync_out: out std_logic
  );
end cgain_core;

architecture structural of cgain_core is
begin
end structural;

