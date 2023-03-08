Part I (Problem + Approach):

 

The end ‘goal’ of this assignment is to determine which curve fit is a more ‘accurate’ fit of the semi-random data. To do this, you will calculate curve fits and corresponding RMSE (root mean squared error). Of course, graphs are extremely useful for showing your results!

 

Download Module5_Assignment.m file and calcRMSE.m file to the same folder; add your code within the Moudle5_Assignment.m script. The script has the following workflow you will follow:

 

1. x and y are already defined [note: every time you run the file, the y-values will be slightly different!]

2. calculate the curve fits for 1st, 2nd, and 3rd degree polynomials

3. calculate RMSE (root mean squared error) for each of the polynomial fits (use calcRMSE.m)

4. Plot your three curve fits!

  a. Initialize Figure 1

  b. For each of the three graphs…

Call subplot()
Plot raw data
Plot curve fit
Add other features (axis labels title, legend, etc.)
Add the RMSE value as text on the graph 
- Hint: use strcat() and num2str()
5. Output important information!

Display the equations for each curve fit
Use fprintf()
- Pro-Tip: instead of ‘%d’ for your data-values, try using ‘%3.2f’
- Display the RMSE values in a table
Note: throughout the provided .m file, you will see %YOUR CODE GOES HERE. That is your cue to program in that area. Sometimes, there are commented starter lines of code to help you as well (ex: %fprint( … ) ). Good luck and happy plotting!

 

Desired Output:

 

In addition to returning the plot at the top of this document, you should also have the following output in the command window. The first three lines are from fprintf() commands and a table provides the RMSE values for each fit.

 

-----------------------------------------------------------------------------------------

 

Polynomial Deg1: 9.79x + -53.18

Polynomial Deg2: 0.18x^2 0.54x + 19.84

Polynomial Deg3: 0.00x^3 0.16x^2 1.08x + 17.90

 

    RMSE_1      RMSE_2     RMSE_3

    ______         ______        ______

    44.352          22.946         22.924

 

-----------------------------------------------------------------------------------------

 

Additional Tasks:

The goal of the script is to see which curve fit is best. So… which is the best? Create an additional output that clearly states which degree is polynomial fit is best. Hint: would you use max() or min() on your RMSE values?
Open the calcRMSE.m script. Delete its contents, then write the function yourself! Can you write it in one line? Look up the formula online if you need to.
RMSE is a good metric to measure error of curve fits. However, some plots include an R2 value, where R2=1 is a perfect fit. Look online for the equation of R2, then program this as a separate .m file function, then add the R2 values to the graphs.
Highlight the minimum value of raw data. To do this, you can add another ‘dataset’ that is simply the x and y values of the minimum value of the dataset. Extract the minimum value (and its index!). Then, when plotting, use hold on and add your plot(). Use a different color so it stands out!
In addition to the three subplots, create a second figure and plot four things: raw data plus the three polynomial fits. Make all the curve fit lines different colors and line shapes. Hint: make good use of the ‘hold on’ command.
 

Hints:

Polynomial fitting is done with the polyfit() and polyval() functions. Refer to the Curve Fitting video or get help from the command line.
To use the calcRMSE.m file, be sure it is in the same folder as your assignment_mod5.m script
If you do not know what to use as inputs to calcRMSE.m, open the .m file to understand it. You can also call ‘help calcRMSE.m’ in the command window
Start your figure with figure(1)
For subplot(), think about what you want your output to be, one row by three side by side graphs.
The first subplot command should be subplot(1,3,1)
When plotting multiple datasets onto one graph, use the ‘hold on’ command in between your plot() functions.
To plot the RMSE value on your plot, think about what data type (kind of variable) it is. You need to convert the RMSE values to text to go onto the plot. Refer to the video on Graphical Text.
To combine two strings together, use the strcat() function.
For outputting using fprintf(), you can use the coeffs you calculated using polyfit(). You need to use the index to call a specific value (coeffs(1) for example). But, which value in coeffs relates to c0, c1, and c2 in c2*x2 + c1*x + c0?
Creating a table can be done with table(). 

-------------------------------------------------------------------------------------------------------------------------------------------------------
% Curve Fitting Assignment
clc, clearvars, close all, format compact

%%% GOAL: find the most 'accurate' curve fit to data

%%% Define Variables
x = linspace(0,50,20);
y = 20 + (0.2*(x.^2)) + 100.*(rand(1,length(x))-0.5);

%%% Calculate Variables
% 1st, 2nd, and 3rd Degree Polynomial Fits
coef_1 = polyfit(x,y,1); yfit_1 = polyval(coef_1,x);
coef_2 = polyfit(x,y,2); yfit_2 = polyval(coef_2,x);
coef_3 = polyfit(x,y,3); yfit_3 = polyval(coef_3,x);

% Calculate Root Mean Squared Error (RMSE)
% uses function calcRMSE.m
RMSE_1 = calcRMSE(y,yfit_1);
RMSE_2 = calcRMSE(y,yfit_2);
RMSE_3 = calcRMSE(y,yfit_3);



% Plot Figures

%%%%%%%%%% FIGURE 1 %%%%%%%%%%%
figure(1)

%%%% Plot 1/3 - Polynomial Degree 1
subplot(1,3,1)

% Plotting
plot(x,y,'ko','MarkerFaceColor','k')
hold on 
plot(x,yfit_1,'-.r','LineWidth',2)

grid on
title('First Degree Polynomial Fit')
xlabel('x'), ylabel('y'), legend('Raw','Deg1 Fit','Location','Northwest')
msg1 = strcat('RMSE= ', num2str(RMSE_1));
text(1/5*max(x),2/3*max(y),msg1)


%%%% Plot 2/3 - Polynomial Degree 2
subplot(1,3,2)

% Plotting
plot(x,y,'ko','MarkerFaceColor','k')
hold on 
plot(x,yfit_2,'-.r','LineWidth',2)

grid on
title('Second Degree Polynomial Fit')
xlabel('x'), ylabel('y'), legend('Raw','Deg2 Fit','Location','Northwest')
msg2 = strcat('RMSE= ', num2str(RMSE_2));
text(1/5*max(x),2/3*max(y),msg2)


%%%% Plot 3/3 - Polynomial Degree 3
subplot(1,3,3)

% Plotting
plot(x,y,'ko','MarkerFaceColor','k')
hold on 
plot(x,yfit_3,'-.r','LineWidth',2)

grid on
title('Third Degree Polynomial Fit')
xlabel('x'), ylabel('y'), legend('Raw','Deg3 Fit','Location','Northwest')
msg3 = strcat('RMSE= ', num2str(RMSE_3));
text(1/5*max(x),2/3*max(y),msg3)



%%% Outputs to Command Window

% Equations of Fits
fprintf('Polynomial Deg1: %3.2fx + %3.2f\n', coef_1(1), coef_1(2))
fprintf('Polynomial Deg2: %3.2fx^2 %3.2fx + %3.2f\n', coef_2(1), coef_2(2), coef_2(3))
fprintf('Polynomial Deg3: %3.2fx^3 %3.2fx^2 %3.2fx + %3.2f\n', coef_3(1), coef_3(2), coef_3(3), coef_3(4))
fprintf('\n')

% Table of RMSE
tableRMSE = table(RMSE_1, RMSE_2, RMSE_3);
disp(tableRMSE)

