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
      self.display_test_message(rmse, testResult, testDescription);
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

    function display_test_message(self, rmse, testResult, testDescription)
      message = strcat(testDescription, testResult, ' | RMSE:', num2str(rmse));
      disp(message)
    end
  end
end
