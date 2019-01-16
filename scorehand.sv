module scorehand(input [3:0] card1, input [3:0] card2, input [3:0] card3, output [3:0] total);

// The code describing scorehand will go here.  Remember this is a combinational
// block. The function is described in the handout.  Be sure to review the section
// on representing numbers in the lecture notes.
	reg [3:0] temp1, temp2, temp3;
	wire [6:0] tempcard1, tempcard2, tempcard3;
	
	always@(card1)
		case(card1)
			4'b1010, 4'b1011, 4'b1100, 4'b1101, 4'b1110, 4'b1111: temp1 = 4'b0000;  //0
			default: temp1 = card1;
		endcase
	assign tempcard1 = temp1;
	
	always@(card2)
		case(card2)
			4'b1010, 4'b1011, 4'b1100, 4'b1101, 4'b1110, 4'b1111: temp2 = 4'b0000;  //0
			default: temp2 = card2;
		endcase
	assign tempcard2 = temp2;
	
	always@(card3)
		case(card3)
			4'b1010, 4'b1011, 4'b1100, 4'b1101, 4'b1110, 4'b1111: temp3 = 4'b0000;  //0
			default: temp3 = card3;
		endcase
	assign tempcard3 = temp3;
	
	assign total = (tempcard1 + tempcard2 + tempcard3) %10;

endmodule

