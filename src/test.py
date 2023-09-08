import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

input = [0x62, 0x04, 0x05, 0xf8, 0x95]
output = [0x0, 0x0, 0x55, 0xa2, 0x0c]

@cocotb.test()
async def test_ti_sbox(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    dut._log.info("reset")
    dut.rst_n.value = 0
    dut.ena.value = 0
    await ClockCycles(dut.clk, 120)
    dut.rst_n.value = 1
    dut.ena.value = 1
    # await ClockCycles(dut.clk, 100)
    # dut.ena.value = 0
    
    dut._log.info("check 5 inputs")
    for i in range(5):
        dut._log.info("check input {}".format(i))
        dut.ui_in.value = input[i]
        await ClockCycles(dut.clk, 20)
        assert int(dut.uo_out.value) == output[i]
        assert dut.uio_oe == 0xFF
