Problem + Approach:
The end ‘goal’ of this assignment is to gain significant experience with loops and switch/if statements. The best way to solidify the concepts is to apply them!

Download Module6_Assignment.m file; add your code within the Moudle6_Assignment.m script. There is revenue and division data at the top of the script that will be used throughout this assignment. The revenue is reported for each division (a, b, and c) for a single company for 7 years, hence there are 21 values in division and revenue. You will be calculating total revenue, total revenue for each division, and cumulative revenue for division A throughout the script using various methods! ‘Total Revenue’ refers to all the divisions combined (the whole company, whereas ‘Revenue for Division A’ refers to only the values that correspond to division A based on the division variable. 

The script has the following workflow you will follow:

1. PART ONE 

a. Calculate total revenue using a single function

b. Calculate total revenue using a for loop

c. Calculate total revenue using a while loop

2. PART TWO 

a. Calculate each division’s total revenue (use a for loop + if statement)

b. Calculate each division’s total revenue (use a while loop + switch statement)

3. PART THREE 

  a. Filter revenue for only values for division A

  b. Calculate the cumulative revenue for division A

   - Note: cumulative revenue is the total revenue up to a given point. For example, cumulative revenue at point 3 = rev_pt1 + rev_pt2 + rev_pt3

  c. Create a side-by-side bar plot of the revenue and cumulative revenue for division A

   - Note: if you do not know how to do something, look it up!

   - Hint: to put two column vectors side-by-side: new_vect = [col1 col2]


Note: as you move through the assignment, check your calculations against parts that you know are correct (for example, check Part ONE (c) against Part ONE (a). 


Desired Output:

 

PART ONE. Each total revenue calculation should equal 602. (check your variables)

PART TWO. DivA total = 276, DivB total = 205, DivC total = 121. (check your variables)

PART THREE. Cumulative Revenue for DivA = 23, 39, 130, 174, 238, 255, 276

The below graph should be generated as well.
 


 

Additional Tasks:

You already calculated the cumulative division revenue for A, now calculate it for B and C. But wait! Do not copy and paste code… write a function that calculates cumulative division revenue for you.
Assume all the negative revenue values were recorded incorrectly. When calculating cumulative sums, skip these values using an if statement.
Create one loop that takes in revenue and division data, calculates cumulative values for each div A, B, and C in columns, and calculates total revenue for div A, B, and C in the last row of each column. Then export this as a .csv file (search online!).
 

 

Hints:

PART ONE. Easily calculate total revenue with sum().
PART ONE. To calculate total revenue using a for loop, consider creating a new value that you can add to every loop. Then, each loop: Total = Total + revenue(i)
PART ONE. Be sure to initialize the total revenue variable before the loop starts. The ‘total’ value to start would technically be zero!
PART ONE. For while loops, create a counter variable that is increased every loop. The value should not become greater than the length of the revenue variable…
PART ONE. Be sure to use control+c to end an infinite while loop!
PART TWO. Within the for loop, call the if statement that compares division(i) to the strings a, b, and c. 
PART TWO. Within the while loop, switch on the division(counter) value, using a, b, and c as the cases.
PART THREE. Get rid of zeros in the divA matrix using the nonzeros() function.
PART THREE. For cumulative calculations, you will need to grab a previous value. That index location likely involves an ‘i-1’ when you calculate the ith term. i is the current term. i-1 is the previous term.
PART THREE. Consider running a for loop from 2:length(divA). Also, every loop call TotalDivA (i-1) somewhere in your code.
PART THREE. A side-by-side bar plot requires the each set of side-by-side values to be in the same row. Then consecutive pairs be in a new column. The easiest way to do this, is to create two columns of divA data and cumulative divA data. Then, combine them, with [col1 col2].
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------
 % Module 6 Assignment - Loops
clc, clearvars, format compact, close all

% Raw Data (over 7 years, 1 company with 3 divisions)
division = ['a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c'];
revenue = [23, 44, -5, 16, 7, 9, 91, -1, -40, 44, 32, 35, 64, 71, 90, 17, 61, 27, 21, -9, 5];
        % revenue values in thousands

%%%%%%%%% PART ONE %%%%%%%%%
% Calculate total revenue using a single built-in function
TotalRev1 = sum(revenue);

% Calculate total revenue using a For Loop 
TotalRev2 = 0;
for i = 1:length(revenue)
   TotalRev2 = TotalRev2 + revenue(i); 
end

% Calculate total revenue using a While Loop
TotalRev3 = 0;
vals = length(revenue);
counter = 1;
while counter <= vals
    TotalRev3 = TotalRev3 + revenue(counter);
    counter = counter + 1;
end


%%%%%%%%% PART TWO %%%%%%%%%
% Calculate division a, b, and c's total revenue using a For Loop + If Statement
DivTotal1 = [0, 0, 0];
for i = 1:length(revenue)
    
   if division(i) == 'a'
       DivTotal1(1) = DivTotal1(1) + revenue(i);
   elseif division(i) == 'b'
       DivTotal1(2) = DivTotal1(2) + revenue(i);
   else   % division c
       DivTotal1(3) = DivTotal1(3) + revenue(i);
   end
   
end

% Calculate division a, b, and c's total revenue using a While Loop + Switch Statement
DivTotal2 = [0, 0, 0];
counter = 1;

while counter <= length(revenue)
    
    switch division(counter)
        case 'a'
        DivTotal2(1) = DivTotal2(1) + revenue(counter);
        case 'b'
        DivTotal2(2) = DivTotal2(2) + revenue(counter);
        otherwise    % c
        DivTotal2(3) = DivTotal2(3) + revenue(counter);
    end
   
    counter = counter + 1;
    
end

%%%%%%% PART THREE %%%%%%%
% Calculate division a's CUMULATIVE revenue
% Cumulative revenue is total revenue up to that point
% Example: the cumulative revenue for the third point is 23 + 44 - 5 = 65

% 'Filter' to just get the division a values in a separate matrix
logicA = (division == 'a');
divA = revenue.*logicA;

% Eliminate the zeros in divA to get a concise matrix
divA = nonzeros(divA)';

% Calculate the cumulative revenue for division a
CumuDivA = divA(1);
for i = 2:length(divA)
    % Cumulative = Previous + New Revenue
    CumuDivA(i) = CumuDivA(i-1) + divA(i);
end

% Make a Side-By-Side Barplot of the data!
bar_data = [divA' CumuDivA'];
bar(bar_data), legend('Revenue','Cumulative','Location','Northwest'), grid on
title('Revenue and Cumulative Revenue'), xlabel('Year'), ylabel('Thousands')

                                                                                             
                                                                                                           
