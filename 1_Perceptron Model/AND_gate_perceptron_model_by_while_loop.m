clear;
clc;
 
w1=2
w2=3
 
%w3=1
% b=-1;
 
x1=[0 0 1 1];
x2=[0 1 0 1];
y=[0 0 0 1];
 
err=100;
iter=0;
 
while err>0
    
    for i=1:4
        ycal=x1(i)*w1+x2(i)*w2
        
        %%% we are performing the task of activation function block
        if ycal>2
            ycal=1;
        else
            ycal=0;
        end
        
        %%% calculating the error
        error(i)=y(i)-ycal
        
        w1=w1+0.5*error(i)%*x1(i)
        w2=w2+0.5*error(i)%*x2(i)
% w3=w3+0.5*error(i)
    end
    iter=iter+1
    err=max(abs(error))
end
