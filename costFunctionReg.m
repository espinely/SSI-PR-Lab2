function [E,grad] = costFunctionReg(X,y,w,lambda)
    %Predict output using sigmoid function:
    thesigmoid=sigmoid(w'*X);
    %Calculate the error between predicted and real outputs using
    %regularization:
    E=-sum(sum(y'*log(thesigmoid) + (1-y)'*log(1-thesigmoid)))/size(X,2) + (lambda/2)*sum(w(2:end).^2);
    for i=1:size(X,1)
        %Calculate gradient:
        if i==1
            grad(i)=sum((thesigmoid-y)'*X(i,:)')/size(X,2);
        else
            grad(i)=sum((thesigmoid-y)'*X(i,:)')/size(X,2) + lambda*w(i);
        end
    end