module card7seg(input [3:0] card, output[6:0] seg7);

	reg [6:0] HEX;
	
	always @(card)
		case(card)
		//4'b0000: HEX0 = 7'b1111111;  //off
		4'b0001: HEX = 7'b0001000;  //ace
		4'b0010: HEX = 7'b0100100;  //2
		4'b0011: HEX = 7'b0110000;  //3
		4'b0100: HEX = 7'b0011001;  //4
		4'b0101: HEX = 7'b0010010;  //5
		4'b0110: HEX = 7'b0000010;  //6
		4'b0111: HEX = 7'b1111000;  //7
		4'b1000: HEX = 7'b0000000;  //8
		4'b1001: HEX = 7'b0010000;  //9
		4'b1010: HEX = 7'b1000000;  //0
		4'b1011: HEX = 7'b1100001;  //jack
		4'b1100: HEX = 7'b0011000;  //queen
		4'b1101: HEX = 7'b0001001;  //king
		//if( SW == 4'b1110: HEX0 = 7'b1111111;  //off
		//if( SW == 4'b1111: HEX0 = 7'b1111111;  //off
		default: HEX = 7'b1111111;
		endcase
	assign seg7 = HEX;  

endmodule

