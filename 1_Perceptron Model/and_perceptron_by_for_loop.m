clear all;
clc

P=[0,0; 0,1; 1,0; 1,1];
T=[0;0;0;1];
N=size(P,1);
R=2;
S=1;
alpha=1;
W=0.37*ones(S,R);
b=0.2;
epoch=5;

for i=1:epoch
    for j=1:4
        p=P(j,:);
        t=T(j);
        y1=(W*p')+b;
        if y1<0
            y=0;
        else
            y=1;
        end
        e=t-y;
        W=W+(e*p*alpha);
        b=b+e;
    end
end

record_W=W

record_b=b

output=zeros(4,1);
for j=1:4
    p_test=P(j,:);
    y1=(W*p_test')+b;
    if y1<0
    y=0;
    else
    y=1;
    end
output(j)=y;
end

Testing_Results=table(P(:,1),P(:,2),output,'variableNames',{'Input_1' 'Input_2' 'Output'});
disp('Training Completed......');
disp(Testing_Results)