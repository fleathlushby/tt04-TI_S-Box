import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

# input_A = [0,1,2,3,4,5,6,7,5,6]
# input_B = [7,6,5,4,3,2,1,0,5,7]
# input_Cin = 0
Sum = [7,7,7,7,7,7,7,7,10,13]

@cocotb.test()
async def test_rca(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    dut._log.info("reset")
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("check 10 inputs")
    for i in range(10):
        dut._log.info("check input {}".format(i))
        await ClockCycles(dut.clk, 1000)
        # dut.ui_in[6:4].value = 0b101
        # dut.ui_in[3:1].value = 0b010
        dut.ui_in.value = 0b00111111
        # assert int(dut.uo_out.value) == Sum[i]
        assert dut.uio_oe == 0xFF
