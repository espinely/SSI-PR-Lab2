%% FIRST PROBLEM:

clc;clear all;close all;
%Import data:
filename = 'lab2data1.txt';
%and split information separed by commas:
delimiterIn = ',';
A = importdata(filename,delimiterIn);
plotData(A(:,1:2),A(:,3));

%Try sigmoid function by generating a series of values:
% x = -5:0.01:5; 
% s = sigmoid (x);
% figure;
% plot(x,s);

%Generate basis function:
phi=[ones(size(A(:,1:2),1),1),A(:,1:2)];
%Initialize weights as zeroes:
w=zeros(size(phi,2),1);
%Test the cost function for these zero weights:
[E,grad]=costFunction(phi',A(:,3),w);

%Initialize weights for the minimizing function:
initial_parameters=zeros(size(phi,2),1);
%Configuration of the minimizing function:
options=optimset('GradObj', 'on', 'MaxIter', 400);
%Calculate the optimal weights by minimizing the error of the cost function:
[wopt, cost] = fminunc( @(t)costFunction(phi',A(:,3),t), initial_parameters, options);

%Determine and plot the decision boundary:
pointsx=[min(min(A(:,1:2))) max(max(A(:,1:2)))];
pointsy=((wopt(1) + wopt(2)*pointsx)/-wopt(3));
plot(pointsx,pointsy);

%Calculate the probability of acceptance for a candidate:
exams=[45 85];
X=[ones(size(exams,1),1),exams];
y=sigmoid(wopt'*X')

%% SECOND PART:

clc;clear all;close all;
%Import data:
filename = 'lab2data2.txt';
%and split information separed by commas:
delimiterIn = ',';
A = importdata(filename,delimiterIn);
plotData(A(:,1:2),A(:,3));

%Transform features to a set of 6th order polynomial features:
phi=transformFeatures(A(:,1),A(:,2));

%Regularization with weughts set to 0:
lambda=0.0005;
w=zeros(size(phi,2),1);
[E,grad]=costFunctionReg(phi',A(:,3),w,lambda);

%Calculate optimum weights by minimizing the cost of the regularized
%optimizer:
initial_parameters=zeros(size(phi,2),1);
options=optimset('GradObj', 'on', 'MaxIter', 400);
[wopt, cost] = fminunc( @(t)costFunctionReg(phi',A(:,3),t,lambda), initial_parameters, options);

%Plot the decision boundary:
% Here is the grid range
u = linspace(-1, 1.5, 50);
v = linspace(-1, 1.5, 50);
z = zeros(length(u), length(v));
% Evaluate z = theta*x over the grid
for i = 1:length(u)
    for j = 1:length(v)
        z(i,j) = transformFeatures(u(i), v(j))*wopt;
    end
end
z = z'; % important to transpose z before calling contour
% you need to specify the range [0, 0]
contour(u, v, z, [0, 0], 'LineWidth', 2)
hold off

%By decrementing the value of the regularization term lambda, we've been
%able to see how the decision boundary gets a less smooth shape in order to
%classify the elements more precisely, while by increasing this
%value the shape gets a mora circled shape, loosing accuracy in the
%classification.