function v = odbojnaHitrostMatrika(v0,Xlevi,Xdesni)

  u = Xdesni - Xlevi;
  A = [u(1) u(2); u(2) -u(1)];
  v = A * [1 0; 0 -1] * inv(A) * v0;
