module tb_statemachine();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").
	logic clk;
	logic slow_clock;
	logic resetb;
	logic [3:0] dscore;
	logic [3:0] pscore;
	logic [3:0] pcard3;
    logic load_pcard1;
	logic load_pcard2;
	logic load_pcard3;
    logic load_dcard1;
	logic load_dcard2;
	logic load_dcard3;
    logic player_win_light;
	logic dealer_win_light;

	statemachine dut(.*);

  initial begin
    clk = 0;	
    forever #5 clk = ~clk;
  end

  initial begin
	slow_clock = 1'b0;
	resetb = 1'b1;
	dscore = 4'b0;
	pscore = 4'b0;
	pcard3 = 4'b0;
    #10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	
	
	
	// c-reset state
	resetb = 1'b0;
	slow_clock = 1'b1;
	#10;
	// nothing happens because no posedge clk
	resetb = 1'b1;
	slow_clock = 1'b0;
	#10;
	// pcard1 state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard1 state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// pcard2 state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard2 state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// read scores state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// player third state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dealer third state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// determine winner state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// tie state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	
	
	
	// a-reset state
	resetb = 1'b0;
	slow_clock = 1'b1;
	#10;
	// nothing happens because no posedge clk
	resetb = 1'b1;
	slow_clock = 1'b0;
	#10;
	// pcard1 state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard1 state
	pscore = 4'd3;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// pcard2 state
	dscore = 4'd4;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard2 state
	pscore = 4'd7;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// read scores state
	dscore = 4'd8;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// determine winner state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dealer wins state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	
	
	
	
	// b-reset state
	resetb = 1'b0;
	slow_clock = 1'b1;
	#10;
	// nothing happens because no posedge clk
	resetb = 1'b1;
	slow_clock = 1'b0;
	#10;
	// pcard1 state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard1 state
	pscore = 4'd3;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// pcard2 state
	dscore = 4'd3;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard2 state
	pscore = 4'd7;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// read scores state
	dscore = 4'd6;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// determine winner state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// player wins state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	
	
	
	// h-reset state
	resetb = 1'b0;
	slow_clock = 1'b1;
	#10;
	// nothing happens because no posedge clk
	resetb = 1'b1;
	slow_clock = 1'b0;
	#10;
	// pcard1 state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard1 state
	pscore = 4'd1;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// pcard2 state
	dscore = 4'd3;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard2 state
	pscore = 4'd3;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// read scores state
	dscore = 4'd7;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// determine winner state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// player wins state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	
	
	
    
	// i-reset state
	resetb = 1'b0;
	slow_clock = 1'b1;
	#10;
	// nothing happens because no posedge clk
	resetb = 1'b1;
	slow_clock = 1'b0;
	#10;
	// pcard1 state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard1 state
	pscore = 4'd1;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// pcard2 state
	dscore = 4'd1;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard2 state
	pscore = 4'd3;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// read scores state
	dscore = 4'd3;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// player third state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// read third state
	pcard3 = 4'b1000;
	pscore = 4'd1;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// determine winner state
	dscore = 4'd4;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dealer wins state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	
	
	// g-reset state
	resetb = 1'b0;
	slow_clock = 1'b1;
	#10;
	// nothing happens because no posedge clk
	resetb = 1'b1;
	slow_clock = 1'b0;
	#10;
	// pcard1 state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard1 state
	pscore = 4'd1;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// pcard2 state
	dscore = 4'd1;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard2 state
	pscore = 4'd3;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// read scores state
	dscore = 4'd3;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// player third state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// read third state
	pcard3 = 4'b0010;
	pscore = 4'd5;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dealer third state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// determine winner state
	dscore = 4'd4;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// player wins state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	
	
	
	
	// d-reset state
	resetb = 1'b0;
	slow_clock = 1'b1;
	#10;
	// nothing happens because no posedge clk
	resetb = 1'b1;
	slow_clock = 1'b0;
	#10;
	// pcard1 state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard1 state
	pscore = 4'd1;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// pcard2 state
	dscore = 4'd2;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard2 state
	pscore = 4'd4;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// read scores state
	dscore = 4'd6;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// player third state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// read third state
	pcard3 = 4'b0110;
	pscore = 4'd0;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dealer third state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// determine winner state
	dscore = 4'd9;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dealer wins state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	
	
	
	
	// e-reset state
	resetb = 1'b0;
	slow_clock = 1'b1;
	#10;
	// nothing happens because no posedge clk
	resetb = 1'b1;
	slow_clock = 1'b0;
	#10;
	// pcard1 state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard1 state
	pscore = 4'd3;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// pcard2 state
	dscore = 4'd4;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard2 state
	pscore = 4'd4;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// read scores state
	dscore = 4'd5;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// player third state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// read third state
	pcard3 = 4'b0101;
	pscore = 4'd9;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dealer third state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// determine winner state
	dscore = 4'd6;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// player wins state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	
	
	
	
	// f-reset state
	resetb = 1'b0;
	slow_clock = 1'b1;
	#10;
	// nothing happens because no posedge clk
	resetb = 1'b1;
	slow_clock = 1'b0;
	#10;
	// pcard1 state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard1 state
	pscore = 4'd2;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// pcard2 state
	dscore = 4'd2;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dcard2 state
	pscore = 4'd4;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// read scores state
	dscore = 4'd4;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// player third state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// read third state
	pcard3 = 4'b0010;
	pscore = 4'd6;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// dealer third state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// determine winner state
	dscore = 4'd6;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	// tie state
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
	slow_clock = 1'b1;
	#10;
	slow_clock = 1'b0;
	#10;
		
	end			
endmodule




