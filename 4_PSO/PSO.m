clc
clear all


lb=[0 0]
ub=[10 10]
prob= @sphereNew


Np=2               %population size
iter=2             % No. of iteration
w=0.8              % Inertia Weight
c1=1.5             % Acceleration coefficient
c2=1.5             %acceleration coefficient



f=NaN(Np,1)

D=length(lb)

P = repmat(lb,Np,1)+ repmat((ub-lb),Np,1).*rand(Np,D)
v = repmat(lb,Np,1)+ repmat((ub-lb),Np,1).*rand(Np,D)

for p=1:Np
     f(p)=prob(P(p,:))
end

pbest=P
f_pbest=f


[f_gbest,ind]= min(f_pbest)
gbest=P(ind,:)

for t=1:iter
    
    for p=1:Np
        
        v(p,:) =w*v(p,:) + c1*rand(1,D).*(pbest(p,:)-P(p,:)) + c2*rand(1,D).*(gbest - P(p,:))
        
        P(p,:) = P(p,:) + v(p,:)
        
        P(p,:) =max(P(p,:),lb)
        P(p,:) =min(P(p,:),ub)
        
        f(p)=prob(P(p,:))
        
        if f(p)< f_pbest(p)
            
            f_pbest(p)=f(p)
            pbest(p,:)=P(p,:)
            
            if f_pbest(p)< f_gbest
                
                f_gbest=f_pbest(p)
                gbest= pbest(p,:)
                
            end
            
        end
    end
end

 bestfitnes =f_gbest
 bestsol =gbest
 