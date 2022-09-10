

	function Y=evaluation(P)
[x1 y1]=size(P)
H=zeros(1,x1)
for i = 1:x1
    A=bi2de(P(i,:))
    x= A

    H(1,i)= ((22*x)-(x*x))
end
Y=H 
