function PlotSolution(tour, model)

    tour = [tour tour(1)]    
    plot(model.x(tour), model.y(tour), 'k-o', ...
        'MarkerSize', 10, ...
        'MarkerFaceColor', 'y', ...
        'LineWidth', 1.5);   
    xlabel('x')
    ylabel('y')   
    
	
    xmin = min(model.x);
    xmax = max(model.x);
    xlim([xmin xmax]);
    
    ymin = min(model.y);
    ymax = max(model.y);
    ylim([ymin ymax]);    
end