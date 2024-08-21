function y = tangenta(f,x0,y0,x)
syms t
df = diff(f(t));
y = vpa(subs(df,t,x0)).*(x-x0)+y0;