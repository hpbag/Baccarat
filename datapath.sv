module datapath(input slow_clock, input fast_clock, input resetb,
                input load_pcard1, input load_pcard2, input load_pcard3,
                input load_dcard1, input load_dcard2, input load_dcard3,
                output [3:0] pcard3_out,
                output [3:0] pscore_out, output [3:0] dscore_out,
                output[6:0] HEX5, output[6:0] HEX4, output[6:0] HEX3,
                output[6:0] HEX2, output[6:0] HEX1, output[6:0] HEX0);
						

	
	wire [3:0] new_card, p_card1, p_card2, p_card3, d_card1, d_card2, d_card3;
	
	dealcard carddealer (.clock(fast_clock), .resetb(resetb), .new_card(new_card));
	
	reg4 Pcard1 (.in_card(new_card), .enable(load_pcard1), .reset(resetb), .step_clock(slow_clock), .out_card(p_card1));
	reg4 Pcard2 (.in_card(new_card), .enable(load_pcard2), .reset(resetb), .step_clock(slow_clock), .out_card(p_card2));
	reg4 Pcard3 (.in_card(new_card), .enable(load_pcard3), .reset(resetb), .step_clock(slow_clock), .out_card(p_card3));
	reg4 Dcard1 (.in_card(new_card), .enable(load_dcard1), .reset(resetb), .step_clock(slow_clock), .out_card(d_card1));
	reg4 Dcard2 (.in_card(new_card), .enable(load_dcard2), .reset(resetb), .step_clock(slow_clock), .out_card(d_card2));
	reg4 Dcard3 (.in_card(new_card), .enable(load_dcard3), .reset(resetb), .step_clock(slow_clock), .out_card(d_card3));
	
	card7seg displayhex0 (.card(p_card1), .seg7(HEX0));
	card7seg displayhex1 (.card(p_card2), .seg7(HEX1));
	card7seg displayhex2 (.card(p_card3), .seg7(HEX2));
	card7seg displayhex3 (.card(d_card1), .seg7(HEX3));
	card7seg displayhex4 (.card(d_card2), .seg7(HEX4));
	card7seg displayhex5 (.card(d_card3), .seg7(HEX5));
	
	scorehand player_score (.card1(p_card1), .card2(p_card2), .card3(p_card3), .total(pscore_out));
	scorehand dealer_score (.card1(d_card1), .card2(d_card2), .card3(d_card3), .total(dscore_out));
	
	assign pcard3_out = p_card3;
	
endmodule

/*module reg4( input [3:0] in_card, input enable, input reset, input step_clock, output reg [3:0] out_card);
	
	
	always @(posedge step_clock) begin
		case(reset)
			1'b0: out_card = 4'b0000;
			1'b1: out_card = enable ? in_card : out_card;
			default: out_card = 4'b0000;
		endcase

    end
endmodule
*/

module reg4(step_clock, enable, in_card, out_card, reset); 
  input step_clock, enable, reset; 
  input [3:0] in_card; 
  output reg [3:0] out_card; 
  wire [3:0] next_out; 
  
  assign next_out = enable ? in_card : out_card; 
  
  always @(posedge step_clock) 
    case(reset)
			1'b0: out_card <= 4'b0000;
			1'b1: out_card <= next_out;
			//default: out_card = 4'b0000;
	endcase 
endmodule 
