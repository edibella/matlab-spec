function run_tests(packageName, tolerance)
  % Run all tests in the tests sub-package of a package

  % Init Tester Object
  if nargin == 2
    testerObj = MatlabSpec.Tester(tolerance);
  else
    testerObj = MatlabSpec.Tester;
  end

  % Verify package is on path
  packageTestPath = look_for_package(packageName);

  % Find Test Files
  TestFiles = find_test_files(packageTestPath);

  % Loop through test files and run them, handing each the testerObj
  run_test_files(TestFiles, packageName, testerObj);

  % Use Tester Object to return results
  display_results(testerObj);
end

function packageTestPath = look_for_package(packageName);
  packageTestPath = which([packageName '.test']);

  if strcmp(packageTestPath, '')
    message = ['\n----------\n' ...
                'Package ' packageName '.test not found on path!' ...
               '\nEnsure that this package is available and that it ' ...
               'contains a `test` method.' ...
               '\n----------'];
    error('something:anything', message) % messageID required to use newline
  end
end

function TestFiles = find_test_files(packageTestPath)
  [absolutePath, ~, ~] = fileparts(packageTestPath);
  testFilePaths = [absolutePath '/+tests/*.m'];
  TestFiles = dir(testFilePaths);
end

function run_test_files(TestFiles, packageName, testerObj)
  nTestFiles = numel(TestFiles);
  for iTestFile = 1:nTestFiles
    % Get filename and remove extension
    fullName = TestFiles(iTestFile).name;
    [~, fileName, ~] = fileparts(fullName);

    % Build command to be eval'd
    testName = strcat(packageName, '.tests.', fileName);
    testCommand = sprintf('%s(testerObj);', testName);
    fprintf('- Running Test %d - \r', iTestFile)
    eval(testCommand)
  end
end

function display_results(testerObj)
  if testerObj.failCount > 0
    message = sprintf('%i of %i tests FAILED.', testerObj.failCount, testerObj.testCount);
  else
    message = 'All tests PASSED!';
  end
  disp(message)
end
