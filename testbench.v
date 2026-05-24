module testbench;

reg [3:0] data;
wire parity;
reg [4:0] received_data;
wire error;

// Instantiate the main module
parity_checker_system uut();

// Test cases
initial begin

    // Test Case 1
    uut.data = 4'b1011;
    #10;
    uut.received_data = {uut.data, uut.parity};

    #10;
    $display("Test 1");
    $display("Received Data = %b | Error = %b",
              uut.received_data, uut.error);

    // Test Case 2 (Error Introduced)
    #10;
    uut.received_data = 5'b10011;

    #10;
    $display("Test 2");
    $display("Received Data = %b | Error = %b",
              uut.received_data, uut.error);

    // Test Case 3
    #10;
    uut.data = 4'b1100;
    #10;
    uut.received_data = {uut.data, uut.parity};

    #10;
    $display("Test 3");
    $display("Received Data = %b | Error = %b",
              uut.received_data, uut.error);

    #10;
    $finish;

end

endmodule
