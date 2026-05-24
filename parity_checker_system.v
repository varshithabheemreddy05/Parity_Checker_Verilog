// Code your design here
module parity_checker_system;

reg [3:0] data;
wire parity;
reg [4:0] received_data;
wire error;

// Parity Generator
assign parity = data[0] ^ data[1] ^ data[2] ^ data[3];

// Parity Checker
assign error = received_data[0] ^ received_data[1] ^
               received_data[2] ^ received_data[3] ^
               received_data[4];

initial begin

    // Dump file for waveform
    $dumpfile("dump.vcd");
    $dumpvars(0, parity_checker_system);

    // Test Case 1
    data = 4'b1011;
    #10;
    received_data = {data, parity};

    #10;
    $display("Received Data = %b | Error = %b",
              received_data, error);

    // Test Case 2 (Error Introduced)
    #10;
    received_data = 5'b10011;

    #10;
    $display("Received Data = %b | Error = %b",
              received_data, error);

    // Test Case 3
    #10;
    data = 4'b1100;
    #10;
    received_data = {data, parity};

    #10;
    $display("Received Data = %b | Error = %b",
              received_data, error);

    #10;
    $finish;

end

endmodule
