module Hit_Unit (
    input is_branch,
    input branch_taken,
    input guess,
    output reg hit
);

always @(*) begin
    if (is_branch) begin
       hit = ~(guess ^ branch_taken);
    end
    else begin      //instruction except branch is hit
        hit = 1'b1;
    end
end

endmodule