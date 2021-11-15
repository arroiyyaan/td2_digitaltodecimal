-- Rilwanu Ar Roiyyaan KASNO
-- M2 Integration Circuit and System
-- ADE course - TD2

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dig2dec is
  port (
  -- declaring the I/O with corresponding bit size
  val_input  : in std_logic_vector (15 downto 0);
  seg4 : out std_logic_vector(3 downto 0);
  seg3 : out std_logic_vector(3 downto 0);
  seg2 : out std_logic_vector(3 downto 0);
  seg1 : out std_logic_vector(3 downto 0);
  seg0 : out std_logic_vector(3 downto 0)

  );
end entity;


architecture rtl of dig2dec is
  -- initiating an "alias" of a process called dec_data to be 'val_input' which is the binary vector input
  alias dec_data : std_logic_vector(15 downto 0) is val_input;
  -- declaring bridging signals for outputs and decimal operations
  signal segment0, segment1, segment2, segment3, segment4 : unsigned(3 downto 0);

begin

  -- starting the process, all codes within this process are run sequentially
  process (dec_data)
    type digit_space is array (3 downto 0) of std_logic_vector(3 downto 0);

    -- declaring logic variables with corresponding bit size
    variable val0 : std_logic_vector(15 downto 0);
    variable val1 : std_logic_vector(12 downto 0);
    variable val2 : std_logic_vector(9 downto 0);
    variable val3 : std_logic_vector(6 downto 0);
    variable val4 : std_logic_vector(3 downto 0);

  begin

    -- setting up all values in the logic vectors as zeros
    val0 := (others => '0');
    val1 := (others => '0');
    val2 := (others => '0');
    val3 := (others => '0');
    val4 := (others => '0');

    -- starting the loop for 5 iteration, as representation of 5 BCD digits
    for i in 0 to 5 loop

      -- here the each BCD digit is detected if it exceeds 4
      -- if it does, then the current BCD digit is added with 3(10) or 0011
      
		--if i<5 and val4>"0100" then
        --val4 := std_logic_vector(unsigned(val4) + 3);
      --end if;

      if i<5 and val3>"0100" then
        val3 := std_logic_vector(unsigned(val3) + 3);
      end if;

      if i<5 and val2>"0100" then
        val2 := std_logic_vector(unsigned(val2) + 3);
      end if;

      if i<5 and val1>"0100" then
        val1 := std_logic_vector(unsigned(val1) + 3);
      end if;

      if i<5 and val0>"0100" then
        val0 := std_logic_vector(unsigned(val0) + 3);
      end if;

    end loop;

    -- resizing the 'valX' to corresponding size of segmentX
    segment0 <= resize(unsigned(val0), segment0'length);
    segment1 <= resize(unsigned(val1), segment1'length);
    segment2 <= resize(unsigned(val2), segment2'length);
    segment3 <= resize(unsigned(val3), segment3'length);
    segment4 <= resize(unsigned(val4), segment4'length);

    -- after the resizing process, all segmentX are assigned to segX as outputs
    (seg4, seg3, seg2, seg1) <= digit_space'(std_logic_vector(segment0),
                                                std_logic_vector(segment1),
                                                std_logic_vector(segment2),
                                                std_logic_vector(segment3));

  end process;
end architecture;
