function y = sigmoid (x)

    %Compute sigmoid prediction:
    y = 1./(1 + exp(-x(:)));
   
end
    