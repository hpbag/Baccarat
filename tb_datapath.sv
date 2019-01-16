module tb_datapath();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").
	logic clk;
	logic slow_clock;
	logic fast_clock;
	logic resetb;
    logic load_pcard1;
	logic load_pcard2;
	logic load_pcard3;
    logic load_dcard1;
	logic load_dcard2;
	logic load_dcard3;
	
	//outputs
    logic [3:0] pcard3_out;
	logic [3:0] pscore_out;
	logic [3:0] dscore_out;
	logic [6:0] HEX5;
	logic [6:0] HEX4;
	logic [6:0] HEX3;
	logic [6:0] HEX2;
	logic [6:0] HEX1;
	logic [6:0] HEX0;

	datapath dut(.*);

	initial begin
		fast_clock = 0;	
		forever #5 fast_clock = ~fast_clock;
	end

	initial begin
		slow_clock = 1'b0;
		resetb = 1'b0;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		#10;
		
		slow_clock = 1'b1;
		resetb = 1'b0;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		#10;
		
		slow_clock = 1'b0;
		resetb = 1'b0;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		
		#30;
		#10;
		slow_clock = 1'b1;
		resetb = 1'b1;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		
		#10;
		slow_clock = 1'b0;
		resetb = 1'b1;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		
		//pcard1
		#10;
		slow_clock = 1'b1;
		resetb = 1'b1;
		load_pcard1 = 1'b1;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		
		#10;
		slow_clock = 1'b0;
		resetb = 1'b1;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		#10;
		
		//dcard1
		slow_clock = 1'b1;
		resetb = 1'b1;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b1;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		
		#10;
		slow_clock = 1'b0;
		resetb = 1'b1;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		#10;
		
		//pcard2
		slow_clock = 1'b1;
		resetb = 1'b1;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b1;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		
		#10;
		slow_clock = 1'b0;
		resetb = 1'b1;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		#10;
		
		//dcard2
		slow_clock = 1'b1;
		resetb = 1'b1;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b1;
		load_dcard3 = 1'b0;
		
		#10;
		slow_clock = 1'b0;
		resetb = 1'b1;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		#10;
		
		//pcard3
		slow_clock = 1'b1;
		resetb = 1'b1;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b1;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		
		#10;
		slow_clock = 1'b0;
		resetb = 1'b1;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		#10;
		
		//dcard3
		slow_clock = 1'b1;
		resetb = 1'b1;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b1;
		
		#10;
		slow_clock = 1'b0;
		resetb = 1'b1;
		load_pcard1 = 1'b0;
		load_pcard2 = 1'b0;
		load_pcard3 = 1'b0;
		load_dcard1 = 1'b0;
		load_dcard2 = 1'b0;
		load_dcard3 = 1'b0;
		#10;
	end
						
endmodule


	