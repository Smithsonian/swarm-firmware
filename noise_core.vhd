library IEEE;
use IEEE.std_logic_1164.all;

entity noise_core is
  port (
    arm: in std_logic; 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    seed: in std_logic_vector(31 downto 0); 
    sync: in std_logic; 
    q0: out std_logic_vector(7 downto 0); 
    q1: out std_logic_vector(7 downto 0); 
    q10: out std_logic_vector(7 downto 0); 
    q11: out std_logic_vector(7 downto 0); 
    q12: out std_logic_vector(7 downto 0); 
    q13: out std_logic_vector(7 downto 0); 
    q14: out std_logic_vector(7 downto 0); 
    q15: out std_logic_vector(7 downto 0); 
    q2: out std_logic_vector(7 downto 0); 
    q3: out std_logic_vector(7 downto 0); 
    q4: out std_logic_vector(7 downto 0); 
    q5: out std_logic_vector(7 downto 0); 
    q6: out std_logic_vector(7 downto 0); 
    q7: out std_logic_vector(7 downto 0); 
    q8: out std_logic_vector(7 downto 0); 
    q9: out std_logic_vector(7 downto 0); 
    sync_out: out std_logic
  );
end noise_core;

architecture structural of noise_core is
begin
end structural;

