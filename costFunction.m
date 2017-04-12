function [E,grad] = costFunction(X,y,w)
    thesigmoid=sigmoid(w'*X);
    E=-sum(sum(y'*log(thesigmoid) + (1-y)'*log(1-thesigmoid)))/size(X,2);
    for i=1:size(X,1)
        grad(i)=sum((thesigmoid-y)'*X(i,:)')/size(X,2);
    end