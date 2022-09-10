clear all
clc

p=4; % Population size
c=2; % number of pairs of chromosomes to be crossovered
tg=2; % Total number of generations 

figure
xlabel('Number of generation')
ylabel('Function Value')
hold on
P=population(p)
K=0;
[x1 y1]=size(P)

for i=1:tg   
    Cr=crossover(P,c);
    P(p+1:p+2*c,:)=Cr
    
    E=evaluation(P)
    [P S]=selection(P,E,p)
    K(i,1)=sum(S)/p
    K(i,2)=S(1) % best
    plot(K(:,1),'b.'); drawnow
    hold on
    plot(K(:,2),'r.'); drawnow
end
Max_fitness_value=max(K(:,2))
P2=bi2de(P)  % convert binary to real numbers
x= max(P2)
 
H= ((22*x)-(x*x))
Optimal_solution=[H]
