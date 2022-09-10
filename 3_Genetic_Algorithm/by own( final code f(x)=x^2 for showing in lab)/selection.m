	function [YY1 YY2] = selection(P,F,p)
% P - population, F - fitness value, p - population size
[x y]=size(P)
Y1 = zeros(p,y)

e=3;
for i = 1:e
    [r1 c1]=find(F==max(F))
    Y1(i,:)=P(max(c1),:) 
    P(max(c1),:)=[]
    Fn(i)=F(max(c1))
    F(:,max(c1))=[]
end

YY1 = Y1
YY2 = Fn 
end
