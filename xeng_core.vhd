library IEEE;
use IEEE.std_logic_1164.all;

entity xeng_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    i0_pol0: in std_logic_vector(7 downto 0); 
    i0_pol1: in std_logic_vector(7 downto 0); 
    i1_pol0: in std_logic_vector(7 downto 0); 
    i1_pol1: in std_logic_vector(7 downto 0); 
    newacc: in std_logic; 
    bin: out std_logic_vector(10 downto 0); 
    p0xp0: out std_logic_vector(63 downto 0); 
    p0xp1: out std_logic_vector(63 downto 0); 
    p1xp0: out std_logic_vector(63 downto 0); 
    p1xp1: out std_logic_vector(63 downto 0); 
    rdy: out std_logic
  );
end xeng_core;

architecture structural of xeng_core is
begin
end structural;

