library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity x86_register_file is
    Port (
        clk       : in  std_logic;
        rst       : in  std_logic;

        -- Read port A
        read_sel_a : in  std_logic_vector(4 downto 0);
        read_data_a : out std_logic_vector(31 downto 0);

        -- Read port B
        read_sel_b : in  std_logic_vector(4 downto 0);
        read_data_b : out std_logic_vector(31 downto 0);

        -- Write port
        write_enable : in  std_logic;
        write_sel    : in  std_logic_vector(4 downto 0);
        write_data   : in  std_logic_vector(31 downto 0);

        -- Debug outputs (64 bits each, Logisim-friendly)
        regfile_state0 : out std_logic_vector(63 downto 0);
        regfile_state1 : out std_logic_vector(63 downto 0);
        regfile_state2 : out std_logic_vector(63 downto 0);
        regfile_state3 : out std_logic_vector(63 downto 0)
    );
end x86_register_file;

architecture Behavioral of x86_register_file is

    type reg_array is array(0 to 7) of std_logic_vector(31 downto 0);
    signal registers : reg_array := (others => (others => '0'));

    function read_reg(sel : std_logic_vector(4 downto 0); regs : reg_array) return std_logic_vector is
        variable outv : std_logic_vector(31 downto 0) := (others => '0');
        variable idx  : integer;
    begin
        idx := to_integer(unsigned(sel));
        if idx < 8 then
            outv := regs(idx);                                -- full 32-bit
        elsif idx < 16 then
            outv(15 downto 0) := regs(idx-8)(15 downto 0);    -- 16-bit low
        elsif idx < 20 then
            outv(7 downto 0)  := regs(idx-16)(7 downto 0);    -- 8-bit low
        elsif idx < 24 then
            outv(7 downto 0)  := regs(idx-20)(15 downto 8);   -- 8-bit high
        end if;
        return outv;
    end function;

begin

    -- Write logic
    process(clk, rst)
        variable idx : integer;
    begin
        if rst = '1' then
            registers <= (others => (others => '0'));
        elsif rising_edge(clk) then
            if write_enable = '1' then
                idx := to_integer(unsigned(write_sel));
                if idx < 8 then
                    registers(idx) <= write_data;                        -- 32-bit
                elsif idx < 16 then
                    registers(idx-8)(15 downto 0) <= write_data(15 downto 0); -- 16-bit
                elsif idx < 20 then
                    registers(idx-16)(7 downto 0) <= write_data(7 downto 0);   -- 8-bit low
                elsif idx < 24 then
                    registers(idx-20)(15 downto 8) <= write_data(7 downto 0);  -- 8-bit high
                end if;
            end if;
        end if;
    end process;

    -- Combinational reads
    read_data_a <= read_reg(read_sel_a, registers);
    read_data_b <= read_reg(read_sel_b, registers);

    -- Debug outputs (grouped 2 registers per 64-bit bus)
    regfile_state0 <= registers(0) & registers(1); -- EAX, EBX
    regfile_state1 <= registers(2) & registers(3); -- ECX, EDX
    regfile_state2 <= registers(4) & registers(5); -- ESI, EDI
    regfile_state3 <= registers(6) & registers(7); -- EBP, ESP

end Behavioral;
