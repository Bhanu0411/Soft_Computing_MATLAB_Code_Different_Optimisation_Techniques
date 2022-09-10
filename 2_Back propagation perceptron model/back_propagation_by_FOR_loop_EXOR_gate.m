clear all;
clc;

input=[0 0; 0 1; 1 0;1 1];
target=[0;1;1;0];
bias=[-1,-1,-1];
alpha=1;
iteration=60000;
w=[0 0 0;0.1 0.1 0.1 ;0.1 0.1 0.1];
for i=1:iteration
    out=zeros(4,1);
    numln=length(input(:,1));
    for j=1:numln
        H1=bias(1,1)*w(1,1)+input(j,1)*w(1,2)+input(j,2)*w(1,3);
        x2(1)=sigma(H1);
        
        H2=bias(1,2)*w(2,1)+input(j,1)*w(2,2)+input(j,2)*w(2,3);
        x2(2)=sigma(H2);
        
        x3_1=bias(1,3)*w(3,1)+x2(1)*w(3,2)+x2(2)*w(3,3);
        out(j)=sigma(x3_1);
        
        delta3_1=out(j)*(1-out(j))*(target(j)-out(j));
        delta2_1=x2(1)*(1-x2(1))*w(3,2)*delta3_1;
        delta2_2=x2(2)*(1-x2(2))*w(3,3)*delta3_1;
        
        for k=1:3
            if k==1
              w(1,k)=w(1,k)+alpha*bias(1,1)*delta2_1;
              w(2,k)=w(2,k)+alpha*bias(1,2)*delta2_2;
              w(3,k)=w(3,k)+alpha*bias(1,3)*delta3_1;
                
            else
                w(1,k)=w(1,k)+alpha*input(j,1)*delta2_1;
                w(2,k)=w(2,k)+alpha*input(j,2)*delta2_2;
                w(3,k)=w(3,k)+alpha*x2(k-1)*delta3_1;
            end
        end
    end
end
input
target
Testing_Results=table(input(:,1),input(:,2),out,'variableNames',{'Input_1' 'Input_2' 'Output'});
disp('Final Output After Weights updates');
disp(Testing_Results)
     