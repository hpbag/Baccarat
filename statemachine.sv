`define RESET				4'b0000
`define SPCARD1				4'b0001
`define SDCARD1				4'b0010
`define SPCARD2				4'b0011
`define SDCARD2				4'b0100
`define DETERMINEWINNER		4'b0101
`define PLAYERTHIRD			4'b0110
`define READTHIRD			4'b0111
`define DEALERTHIRD			4'b1000
`define PLAYERWINS			4'b1001
`define DEALERWINS			4'b1010
`define TIE 				4'b1011
`define READSCORES			4'b1100

module statemachine(input slow_clock, input resetb,
                    input [3:0] dscore, input [3:0] pscore, input [3:0] pcard3,
                    output load_pcard1, output load_pcard2,output load_pcard3,
                    output load_dcard1, output load_dcard2, output load_dcard3,
                    output player_win_light, output dealer_win_light);


	reg rload_pcard1, rload_pcard2, rload_pcard3, rload_dcard1, rload_dcard2, rload_dcard3, rplayer_win_light, rdealer_win_light;
	reg [3:0] present_state, next_state;

	assign load_pcard1 = rload_pcard1;
	assign load_pcard2 = rload_pcard2;
	assign load_pcard3 = rload_pcard3;
	assign load_dcard1 = rload_dcard1;
	assign load_dcard2 = rload_dcard2;
	assign load_dcard3 = rload_dcard3;
	assign player_win_light = rplayer_win_light;
	assign dealer_win_light = rdealer_win_light;
	
	always@ (posedge slow_clock) begin
		if (~resetb) begin
			present_state = `RESET;
			next_state = `RESET;
			rload_pcard1 = 1'b0;
			rload_pcard2 = 1'b0;
			rload_pcard3 = 1'b0;
			rload_dcard1 = 1'b0;
			rload_dcard2 = 1'b0;
			rload_dcard3 = 1'b0;
			rplayer_win_light = 1'b0;
			rdealer_win_light = 1'b0;
			
		end else begin
			case(present_state)
				`RESET: next_state = `SPCARD1;
				`SPCARD1: next_state = `SDCARD1;
				`SDCARD1: next_state = `SPCARD2;
				`SPCARD2: next_state = `SDCARD2;
				`SDCARD2: next_state = `READSCORES;
				`READSCORES:
						if (dscore == 4'b1000 || dscore == 4'b1001 || pscore == 4'b1000 || pscore == 4'b1001)
							next_state = `DETERMINEWINNER;
						else if (pscore == 4'b0000 || pscore == 4'b0001 || pscore == 4'b0010 || pscore == 4'b0011 || pscore == 4'b0100 || pscore == 4'b0101)
							next_state  = `PLAYERTHIRD;
						else if (dscore == 4'b0110 || dscore == 4'b0111 )
							next_state = `DETERMINEWINNER;
						else next_state = `DEALERTHIRD;
				`PLAYERTHIRD: 
						if(dscore == 4'b0111)
							next_state = `DETERMINEWINNER;
						else if (dscore == 4'b0000 || dscore == 4'b0001 || dscore == 4'b0010)
							next_state = `DEALERTHIRD;
						else next_state = `READTHIRD;
				`READTHIRD:
						if(dscore == 4'b0110 && (pcard3 == 4'b0110 || pcard3 == 4'b0111))
							next_state = `DEALERTHIRD;
						else if (dscore == 4'b0101 && (pcard3 == 4'b0100 || pcard3 == 4'b0101 || pcard3 == 4'b0110 || pcard3 == 4'b0111))
							next_state = `DEALERTHIRD;
						else if (dscore == 4'b0100 && (pcard3 == 4'b0010 || pcard3 == 4'b0011 || pcard3 == 4'b0100 || pcard3 == 4'b0101 || pcard3 == 4'b0110 || pcard3 == 4'b0111))
							next_state = `DEALERTHIRD;
						else if (dscore == 4'b0011 && (pcard3 != 4'b1000))
							next_state = `DEALERTHIRD;
						else next_state = `DETERMINEWINNER;
				`DEALERTHIRD: next_state = `DETERMINEWINNER;
				`DETERMINEWINNER: 
						if (pscore > dscore) 
							next_state = `PLAYERWINS;
						else if (dscore > pscore)
							next_state = `DEALERWINS;
						else next_state = `TIE;
				`PLAYERWINS: next_state = `PLAYERWINS;
				`DEALERWINS: next_state = `DEALERWINS;
				`TIE: next_state = `TIE;
				
			endcase
		
			present_state = next_state;
		
			case(present_state)
				`RESET: begin
					rload_pcard1 = 1'b0;
					rload_pcard2 = 1'b0;
					rload_pcard3 = 1'b0;
					rload_dcard1 = 1'b0;
					rload_dcard2 = 1'b0;
					rload_dcard3 = 1'b0;
					rplayer_win_light = 1'b0;
					rdealer_win_light = 1'b0; end
				`SPCARD1: begin
					rload_pcard1 = 1'b1; 
					rload_pcard2 = 1'b0;
					rload_pcard3 = 1'b0;
					rload_dcard1 = 1'b0;
					rload_dcard2 = 1'b0;
					rload_dcard3 = 1'b0;
					rplayer_win_light = 1'b0;
					rdealer_win_light = 1'b0; end
				`SDCARD1: begin
					rload_pcard1 = 1'b0;
					rload_pcard2 = 1'b0;
					rload_pcard3 = 1'b0;
					rload_dcard1 = 1'b1;
					rload_dcard2 = 1'b0;
					rload_dcard3 = 1'b0;
					rplayer_win_light = 1'b0;
					rdealer_win_light = 1'b0; end
				`SPCARD2: begin
					rload_pcard1 = 1'b0;
					rload_pcard2 = 1'b1;
					rload_pcard3 = 1'b0;
					rload_dcard1 = 1'b0;
					rload_dcard2 = 1'b0;
					rload_dcard3 = 1'b0;
					rplayer_win_light = 1'b0;
					rdealer_win_light = 1'b0; end
				`SDCARD2: begin
					rload_pcard1 = 1'b0;
					rload_pcard2 = 1'b0;
					rload_pcard3 = 1'b0;
					rload_dcard1 = 1'b0;
					rload_dcard2 = 1'b1;
					rload_dcard3 = 1'b0;
					rplayer_win_light = 1'b0;
					rdealer_win_light = 1'b0; end
				`READSCORES: begin
					rload_pcard1 = 1'b0;
					rload_pcard2 = 1'b0;
					rload_pcard3 = 1'b0;
					rload_dcard1 = 1'b0;
					rload_dcard2 = 1'b0;
					rload_dcard3 = 1'b0;
					rplayer_win_light = 1'b0;
					rdealer_win_light = 1'b0; end
				`DETERMINEWINNER: begin
					rload_pcard1 = 1'b0;
					rload_pcard2 = 1'b0;
					rload_pcard3 = 1'b0;
					rload_dcard1 = 1'b0;
					rload_dcard2 = 1'b0;
					rload_dcard3 = 1'b0;
					rplayer_win_light = 1'b0;
					rdealer_win_light = 1'b0; end
				`PLAYERTHIRD: begin
					rload_pcard1 = 1'b0;
					rload_pcard2 = 1'b0;
					rload_pcard3 = 1'b1;
					rload_dcard1 = 1'b0;
					rload_dcard2 = 1'b0;
					rload_dcard3 = 1'b0;
					rplayer_win_light = 1'b0;
					rdealer_win_light = 1'b0; end
				`READTHIRD: begin
					rload_pcard1 = 1'b0;
					rload_pcard2 = 1'b0;
					rload_pcard3 = 1'b0;
					rload_dcard1 = 1'b0;
					rload_dcard2 = 1'b0;
					rload_dcard3 = 1'b0;
					rplayer_win_light = 1'b0;
					rdealer_win_light = 1'b0; end 
				`DEALERTHIRD: begin
					rload_pcard1 = 1'b0;
					rload_pcard2 = 1'b0;
					rload_pcard3 = 1'b0;
					rload_dcard1 = 1'b0;
					rload_dcard2 = 1'b0;
					rload_dcard3 = 1'b1;
					rplayer_win_light = 1'b0;
					rdealer_win_light = 1'b0; end
				`PLAYERWINS: begin
					rload_pcard1 = 1'b0;
					rload_pcard2 = 1'b0;
					rload_pcard3 = 1'b0;
					rload_dcard1 = 1'b0;
					rload_dcard2 = 1'b0;
					rload_dcard3 = 1'b0;
					rplayer_win_light = 1'b1;
					rdealer_win_light = 1'b0; end 
				`DEALERWINS: begin
					rload_pcard1 = 1'b0;
					rload_pcard2 = 1'b0;
					rload_pcard3 = 1'b0;
					rload_dcard1 = 1'b0;
					rload_dcard2 = 1'b0;
					rload_dcard3 = 1'b0;
					rplayer_win_light = 1'b0;
					rdealer_win_light = 1'b1; end
				`TIE: begin
					rload_pcard1 = 1'b0;
					rload_pcard2 = 1'b0;
					rload_pcard3 = 1'b0;
					rload_dcard1 = 1'b0;
					rload_dcard2 = 1'b0;
					rload_dcard3 = 1'b0;
					rplayer_win_light = 1'b1;
					rdealer_win_light = 1'b1; end
            endcase
			
			
	 end
  end 

endmodule

