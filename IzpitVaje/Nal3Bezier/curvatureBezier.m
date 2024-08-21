function k = curvatureBezier(b,t)
  db = bezierDerivative(b);
  ddb = bezierDerivative(db);

  dx = deCasteljau(db(1,:), t);
  dy = deCasteljau(db(2,:), t);
  ddx = deCasteljau(ddb(1,:), t);
  ddy = deCasteljau(ddb(2,:), t);

  expr1 = dx.*ddy - dy.*ddx;
  expr2 = sqrt(dx.^2 + dy.^2).^3;
  k = expr1./expr2; 
