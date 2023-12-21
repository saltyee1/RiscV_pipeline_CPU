module Branch_Predictor (
    clk, rst, 
    Branch_taken,
    is_branch,
    Guess_result
);
    input clk, rst;
    input is_branch;
    input Branch_taken;
    output reg Guess_result;

    reg [1:0] state, nextstate;

    parameter noB0 = 2'b00;
    parameter noB1 = 2'b01;
    parameter goB0 = 2'b10;
    parameter goB1 = 2'b10;

    parameter nottaken = 1'b0;
    parameter taken    = 1'b1;

    always @(posedge clk) begin
        if (rst)begin
            state <= 2'b00;
        end else begin
            state <= nextstate;
        end
    end

    always @(*) begin
        case (state)
            noB0: nextstate = (!is_branch) ? noB0 : ((Branch_taken == nottaken) ? noB0: noB1);
                            // not taken --> back to self state: taken --> go to next state
            noB1: nextstate = (!is_branch) ? noB1 : ((Branch_taken == nottaken) ? noB0: goB0);
                            // not taken --> back to last state: taken --> go to next state
            goB0: nextstate = (!is_branch) ? goB0 : ((Branch_taken == nottaken) ? noB1: goB1);
                            // not taken --> back to last state: taken --> go to next state
            goB1: nextstate = (!is_branch) ? goB1 : ((Branch_taken == nottaken) ? goB1: goB0);
                            // not taken --> back to last state: taken --> go to self state
            default: nextstate = 2'bXX;
        endcase
    end

    always @(*) begin
        case (state)
            noB0: Guess_result = nottaken; // output nottaken signal
            noB1: Guess_result = nottaken; // output nottaken signal
            goB0: Guess_result = taken;    // output taken signal
            goB1: Guess_result = taken;    // output taken signal
            default: Guess_result = 2'bXX;
        endcase
    end
    
endmodule