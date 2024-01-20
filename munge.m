
function [result, matrixA, matrixB] = munge(n)

%{
Assignment Name: Programming Assignment 6   Course and Semester : CS3363-60544 Fall 2023
Instructor's Name : Richard L. Churchill
Due Date and Time : Saturday, November 18, 2023, 11:59 PM U.S. CST.
Date and time submitted: 11/18/2023 5:45pm
Your Name and csx user ID : Christopher Tjahjo ctjahjo


To run this script please connect to the csx server then type matlab <enter>
Wait for for the software to open when it put >>
once it fully launches type munge(n) where n is a number of your choosing
%}


    if n < 9
        result = 0;
        matrixA = [];
        matrixB = [];
    else
        % makes a matrix based on user input
        randomMatrix = randn(n, n);
        
        % takes the sub matrix
        subMatrix = randomMatrix(4:9, 2:7);
        
        % Multiply the matrix and transpose it
        matrixA = subMatrix * subMatrix.';
        
        % does cholesky decomposition
        [triangular1, triangular2] = chol(matrixA);
        
        % multiply triangular matries
        matrixB = triangular1 * triangular2;
        
        % Subtract A from B
        result = matrixB - matrixA;
    end
end

