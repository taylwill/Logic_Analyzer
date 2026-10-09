library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_channel is
  port (
    clk: in std_logic;
    enable: in std_logic;
    data_in: in std_logic;
    data_out: out std_logic;
    done: out std_logic
  );
end logic_channel;

architecture logic_channel of logic_channel is
  constant i: integer := 400_000;
begin
  process(clk, data_in, enable)
      variable count: integer;
  begin
    if(enable = '1') then
      if(rising_edge(clk)) then
        if(count = i ) then
          data_out <= '0';
          done <= '0';            
        else
          data_out <= data_in;
          count := count + 1;
        end if;    
      end if;
    end if;
  end process;
end logic_channel;