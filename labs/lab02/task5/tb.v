
module tb;

  reg  [3:0] t_a;
  reg  [3:0] t_b;
  reg        t_op;
  wire [3:0] t_result;

  reg  [3:0] expected;
  integer errors;

  alu DUT (
    .a      (t_a),
    .b      (t_b),
    .op     (t_op),
    .result (t_result)
  );

  initial begin
    errors = 0;

    // -------------------------
    // Addition tests
    // -------------------------

    t_a = 4'd5;
    t_b = 4'd3;
    t_op = 1'b0;
    #1;

    expected = t_a + t_b;

    if (t_result !== expected) begin
      $display("FAIL: ADD a=%d b=%d got=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end
    else begin
      $display("PASS: ADD a=%d b=%d result=%d",
               t_a, t_b, t_result);
    end


    // -------------------------
    // Sensitivity-list test
    // Change ONLY op.
    // a and b stay the same.
    // -------------------------

    t_op = 1'b1;
    #1;

    expected = t_a - t_b;

    if (t_result !== expected) begin
      $display("FAIL: SUB after changing ONLY op: a=%d b=%d got=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end
    else begin
      $display("PASS: SUB after changing ONLY op: result=%d",
               t_result);
    end


    // -------------------------
    // More subtraction tests
    // -------------------------

    t_a = 4'd7;
    t_b = 4'd2;
    t_op = 1'b1;
    #1;

    expected = t_a - t_b;

    if (t_result !== expected) begin
      $display("FAIL: SUB a=%d b=%d got=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end
    else begin
      $display("PASS: SUB a=%d b=%d result=%d",
               t_a, t_b, t_result);
    end


    t_a = 4'd3;
    t_b = 4'd5;
    t_op = 1'b1;
    #1;

    expected = t_a - t_b;

    if (t_result !== expected) begin
      $display("FAIL: SUB a=%d b=%d got=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end
    else begin
      $display("PASS: SUB a=%d b=%d result=%d",
               t_a, t_b, t_result);
    end


    // -------------------------
    // More addition tests
    // -------------------------

    t_a = 4'd9;
    t_b = 4'd6;
    t_op = 1'b0;
    #1;

    expected = t_a + t_b;

    if (t_result !== expected) begin
      $display("FAIL: ADD a=%d b=%d got=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end
    else begin
      $display("PASS: ADD a=%d b=%d result=%d",
               t_a, t_b, t_result);
    end


    // -------------------------
    // Final result
    // -------------------------

    $display("--------------------------------");

    if (errors == 0)
      $display("ALL TESTS PASSED");
    else
      $display("%0d TEST(S) FAILED", errors);

    $finish;
  end

endmodule
