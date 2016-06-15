classdef Tester < handle
  properties
    tolerance = 1e-12;
    testCount = 0;
    passCount = 0;
    failCount = 0;
  end
  methods
    function self = Tester(tolerance)
      if nargin == 1
        self.tolerance = tolerance;
      end
    end

    function test(self, matrixA, matrixB, testDescription)
      self.increment_test_count
      rmse = self.compute_rmse(matrixA, matrixB);
      testResult = self.test_result(rmse);
      self.display_rmse_message(rmse, testResult, testDescription);
    end

    function test_struct(self, StructA, StructB, testDescription)
      self.increment_test_count
      if isequal(StructA, StructB)
        self.increment_fail_count
        testResult = ' - structs match';
      else
        self.increment_pass_count
        testResult = ' - structs don''t match';
        StructA
        StructB
      end
      self.display_result_message(testResult, testDescription)
    end

    function testResult = test_result(self, rmse)
      if rmse > self.tolerance
        testResult = ' FAILED';
        self.increment_fail_count
      else
        testResult = ' PASSED';
        self.increment_pass_count
      end
    end

    function increment_test_count(self)
      self.testCount = self.testCount + 1;
    end

    function increment_pass_count(self)
      self.passCount = self.passCount + 1;
    end

    function increment_fail_count(self)
      self.failCount = self.failCount + 1;
    end

    function rootMeanSquaredError = compute_rmse(self, matrixA, matrixB)
      squaredError = abs(matrixA - matrixB).^2;
      meanError = mean(squaredError(:));
      rootMeanSquaredError = sqrt(meanError);
      rmse = rootMeanSquaredError;
    end

    function display_result_message(self, testResult, testDescription)
      message = strcat(testDescription, testResult);
      disp(message)
    end

    function display_rmse_message(self, rmse, testResult, testDescription)
      message = strcat(testDescription, testResult, ' | RMSE:', num2str(rmse));
      disp(message)
    end
  end
end
