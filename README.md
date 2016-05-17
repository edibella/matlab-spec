# Matlab Spec

## Introduction

This package implements a basic unit testing for Matlab. A lot more needs to be done to make this a real testing suite.

### NPM

This package uses the node package manager to manage its version control and dependencies. To use this package simply:

1. Install Node: https://nodejs.org/en/

2. Run `npm install matlab-spec` at a unix-like terminal.

This will automatically download the files for this package (and the packages it depends on) into a `node_modules` folder. If you add this folder to your MATLAB path the package `MatlabSpec` will be available.

It is crucial to note the difference in naming conventions between MATLAB and NPM. The npm package name is `matlab-spec` and the MATLAB package name is `+MatlabSpec`. If you are new to MATLAB packages please learn more about them here: http://www.mathworks.com/help/matlab/matlab_oop/scoping-classes-with-packages.html.

### Docs

In the `docs/` directory some markdown files are provided explaining how to use each of the functions and classes this package provides.
