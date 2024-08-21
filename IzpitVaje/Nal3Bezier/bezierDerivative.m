function db = bezierDerivative(b)
  n = length(b)-1;
  db = n.*(b(:,2:end)-b(:,1:(end-1)));