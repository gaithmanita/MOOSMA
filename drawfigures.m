%load('res/MOOSMAUF9.mat');

[V,I]=sort(True_Pareto(:,1));

sortedTrue_Pareto=True_Pareto(I,:)
if M == 2
    plot(Obtained_Pareto(:,1),Obtained_Pareto(:,2),'o','LineWidth',1,...
        'MarkerEdgeColor','r','MarkerSize',2);
    hold on
    plot(sortedTrue_Pareto(:,1),sortedTrue_Pareto(:,2),'k'); 
    title('Optimal Solution Pareto Set using MOOSMA');
    legend('MOOSMA','True PF');
    xlabel('F_1');
    ylabel('F_2');
    xlim([0 1]);
ylim([0 1]);
elseif M == 3
    plot3(Obtained_Pareto(:,1),Obtained_Pareto(:,2),Obtained_Pareto(:,3),'o','LineWidth',2,...
        'MarkerEdgeColor','r','MarkerSize',2);
    hold on
    plot3(Obtained_Pareto(:,1),Obtained_Pareto(:,2),Obtained_Pareto(:,3),'.','LineWidth',2,...
        'MarkerEdgeColor','k','MarkerSize',6);
    title('Optimal Solution Pareto Set using MOSMA');
    legend('MOOSMA');
    xlabel('F_1');
    ylabel('F_2');
    zlabel('F_3');
end