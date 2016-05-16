# Tester

The tester class is the way to use MatlabSpec for testing.

This class provides a `test` function for comparing two matrices within a certain RMSE tolerance. It keeps track internally of the number of tests it has run and the results of the tests.

## Use

To use the Tester just create a tester object:

```matlab
testerObject = MatlabSpec.Tester;

matrixA = [2 2; 4 4];
matrixB = [2 2; 4 4.0000000001];

testerObject.test(matrixA, matrixB, 'Test similar matrices')
```

and then start testing if two things are equal with it, be sure to provide a short test description.

```matlab
matrixA = [2 2; 4 4];
matrixB = [2 2; 4 4.0000000001];

testerObject.test(matrixA, matrixB, 'Test similar matrices')
```

and then the testerObject will display a test result. Here's an actual session:

```matlab
EDU>> testerObject = MatlabSpec.Tester;
EDU>>
EDU>> matrixA = [2 2; 4 4];
EDU>> matrixB = [2 2; 4 4.0000000001];
EDU>>
EDU>> testerObject.test(matrixA, matrixB, 'Test similar matrices')
Test similar matrices FAILED | RMSE:5e-11
```

That output is telling us that the Root mean square error between the two matrices is `5e-11` which is greater than the tolerance of the tester class.

To increase the tolerance just pass in the desired tolerance when you create the object:

```matlab
EDU>> testerObject = MatlabSpec.Tester(1e-10);
EDU>>
EDU>> matrixA = [2 2; 4 4];
EDU>> matrixB = [2 2; 4 4.0000000001];
EDU>>
EDU>> testerObject.test(matrixA, matrixB, 'Test similar matrices')
Test similar matrices PASSED | RMSE:5e-11
```

The `run_tests` function relies on this object.
