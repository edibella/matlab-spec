# Tester

The tester class is the way to use MatlabSpec for testing.

This class provides a `test` function for comparing two matrices within a certain RMSE tolerance. It keeps track internally of the number of tests it has run and the results of the tests.

## Use

To use the Tester just create a tester object:

```matlab
testerObject = MatlabSpec.Tester;
```

You can specify a tolerance for rmse comparison (default is 1e-12)

```matlab
testerObject = MatlabSpec.Tester(1e-4);
```

### test and test_struct

Right now Tester can compare two matrices or two structs for equality. Both methods require that you supply the items you are comparing and a short test description. Here is an example of testing two matrices:

```matlab
matrixA = [2 2; 4 4];
matrixB = [2 2; 4 4.0000000001];
testerObject.test(matrixA, matrixB, 'Test similar matrices')
```

The output of the above will be

```
Test similar matrices FAILED | RMSE:5e-11
```

That output is telling us that the Root mean square error between the two matrices is `5e-11` which is greater than the tolerance of the tester class.

When testing structs, rmse is calculated for each field. This is a rudimentary implementation and messaging could be improved upon.

### run_tests

The `run_tests` function runs all tests in the `+test` sub-package of the package and then displays the total number of tests run, passed, and failed. You just need to provide the name of the package

`MatlabSpec.run_tests('+Critter')` will find the `Critter` package (assuming its on the matlab path) and then run all of its tests.
