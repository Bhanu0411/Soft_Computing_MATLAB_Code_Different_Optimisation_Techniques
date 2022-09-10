clc;
clear all;

model = CreateModel()
CostFunction = @(tour) TourLength(tour, model)
nVar = model.n

MaxIt = 1;        % Maximum Number of Iteration
nAnt = 3;         % Number of Ants (Population Size)
Q = 1;
tau0 = 0.5;	      % Phromone Initial value
alpha = 1;        % Phromone Exponential Weight
beta = 1;         % Heuristic Exponential Weight
rho = 0.05;       % Evaporation Rate

eta = 1./model.D             % Heuristic Information Matrix
tau = tau0*ones(nVar, nVar)   % Phromone Matrix
BestCost = zeros(MaxIt, 1)    % Array to Hold Best Cost Values

empty_ant.Tour = []
empty_ant.Cost = []

% Ant Colony Matrix
ant = repmat(empty_ant, nAnt, 1)

% Best Ant
BestSol.Cost = inf


for iter = 1:MaxIt
    % Move Ants
    for k = 1:nAnt 
        ant(k).Tour = randi([1 nVar])
        for l = 2:nVar
            i = ant(k).Tour(end)           
            P = tau(i, :).^alpha.*eta(i, :).^beta            
            P(ant(k).Tour) = 0           
            P = P/sum(P)           
            j = RouletteWheelSelection(P)           
            ant(k).Tour = [ant(k).Tour j]           
        end
      
        ant(k).Cost = CostFunction(ant(k).Tour)
        
        if ant(k).Cost<BestSol.Cost
            BestSol = ant(k)
        end
        
    end
    
    % Update Phromones
    for k = 1:nAnt      
        tour = ant(k).Tour      
        tour = [tour tour(1)]     
        for l = 1:nVar        
            i = tour(l)
            j = tour(l+1)     
            tau(i, j) = tau(i, j)+Q/ant(k).Cost            
        end        
    end
    
    % Evaporation
    tau = (1-rho)*tau   
    % Store Best Cost
    BestCost(iter) = BestSol.Cost    
    % Plot Solution
    figure(1)
    PlotSolution(BestSol.Tour, model) 
end
