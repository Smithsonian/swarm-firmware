library IEEE;
use IEEE.std_logic_1164.all;

entity fft_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    i0: in std_logic_vector(17 downto 0); 
    i1: in std_logic_vector(17 downto 0); 
    i10: in std_logic_vector(17 downto 0); 
    i11: in std_logic_vector(17 downto 0); 
    i12: in std_logic_vector(17 downto 0); 
    i13: in std_logic_vector(17 downto 0); 
    i14: in std_logic_vector(17 downto 0); 
    i15: in std_logic_vector(17 downto 0); 
    i2: in std_logic_vector(17 downto 0); 
    i3: in std_logic_vector(17 downto 0); 
    i4: in std_logic_vector(17 downto 0); 
    i5: in std_logic_vector(17 downto 0); 
    i6: in std_logic_vector(17 downto 0); 
    i7: in std_logic_vector(17 downto 0); 
    i8: in std_logic_vector(17 downto 0); 
    i9: in std_logic_vector(17 downto 0); 
    shift: in std_logic_vector(14 downto 0); 
    sync: in std_logic; 
    oflow: out std_logic_vector(31 downto 0); 
    q0: out std_logic_vector(35 downto 0); 
    q1: out std_logic_vector(35 downto 0); 
    q2: out std_logic_vector(35 downto 0); 
    q3: out std_logic_vector(35 downto 0); 
    q4: out std_logic_vector(35 downto 0); 
    q5: out std_logic_vector(35 downto 0); 
    q6: out std_logic_vector(35 downto 0); 
    q7: out std_logic_vector(35 downto 0); 
    sync_out: out std_logic
  );
end fft_core;

architecture structural of fft_core is
begin
end structural;

