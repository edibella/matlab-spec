# run_tests


The `run_tests` function takes in a packages name (without the plus sign) and runs all of the tests in it's `+tests` sub-package using the same instance of the Tester class.

All packages use the `run_tests` function to run their tests as `packageName.test`.

## Example


```console
>> MatlabSpec.run_tests('PreInterpolator');
Griddata Test - kSpace PASSED | RMSE:0
Griddata Test - kMask PASSED | RMSE:0
GROG Test - kSpace PASSED | RMSE:0
GROG Test - kMask PASSED | RMSE:0
NN test - kSpace PASSED | RMSE:0
NN test - kMask PASSED | RMSE:0
All tests PASSED!
```
