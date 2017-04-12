function y = predict (x,w)

    X=[ones(size(x,1),1),x];
    y=sigmoid(w'*X');
   
end
    