module tb_baccarat();


	logic CLOCK_50;
	logic [3:0] KEY;
	
	//outputs
	logic [9:0] LEDR;
	logic [6:0] HEX5;
	logic [6:0] HEX4;
	logic [6:0] HEX3;
	logic [6:0] HEX2;
	logic [6:0] HEX1;
	logic [6:0] HEX0;

	baccarat dut(.*);

	initial begin
		CLOCK_50 = 0;	
		forever #5 CLOCK_50 = ~CLOCK_50;
	end

	initial begin
		KEY = 4'b1111;
		#10;
		KEY = 4'b0110;
		#10;
		KEY = 4'b0111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;
		KEY = 4'b1110;
		#10;
		KEY = 4'b1111;
		#10;

	end
endmodule

