module tb_scorehand();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").
	logic clk;
	logic [3:0] card1;
    logic [3:0] card2;
	logic [3:0] card3;
	logic [3:0] total;
	logic [3:0] counta;
	logic [3:0] countb;
	logic [3:0] countc;

	scorehand dut(.*);

  initial begin
    clk = 0;	
    forever #5 clk = ~clk;
  end

  initial begin
    card1 = 4'b0000;
	card2 = 4'b0000;
	card3 = 4'b0000;
    #10;
    assert (total === 4'b0000);  // 0
		
	card1 = 4'b0100;
	card2 = 4'b0101;
	card3 = 4'b0010;
    #10;
    assert (total === 4'b0001);  // (2+4+5)%10 -> 1
	
	card1 = 4'b1000;
	card2 = 4'b1100;
	card3 = 4'b1110;
    #10;
    assert (total === 4'b1000);  // (8+12+14)%10 -> (8+0+0) -> 8
	
	card1 = 4'b1111;
	card2 = 4'b0000;
	card3 = 4'b0010;
    #10;
    assert (total === 4'b0010);  // (15+0+2)%10 -> (0+0+2) -> 2
	
	card1 = 4'b1111;
	card2 = 4'b1111;
	card3 = 4'b1111;
    #10;
    assert (total === 4'b0000);  // (15+15+15)%10 -> (0+0+0) -> 0
	
	card1 = 4'b0000;
	card2 = 4'b0010;
	card3 = 4'b1101;
    #10;
    assert (total === 4'b0010);  // (0+2+13)%10 -> (0+2+0) -> 2
	
	card1 = 4'b1010;
	card2 = 4'b1010;
	card3 = 4'b1010;
    #10;
    assert (total === 4'b0000);  // (10+10+10)%10 -> (0+0+0) -> 0
	
	card1 = 4'b1011;
	card2 = 4'b1100;
	card3 = 4'b1101;
    #10;
    assert (total === 4'b0000);  // (11+12+13)%10 -> (0+0+0) -> 0
	
	for(counta = 4'd0; counta < 4'd15; counta++) begin
		for(countb = 4'd0; countb < 4'd15; countb++) begin
			for(countc = 4'd0; countc < 4'd15; countc++) begin
				card1 = counta;
				card2 = countb;
				card3 = countc;
				#10;
			end
		end
	end

  end			
endmodule


