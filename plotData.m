function plotData(x, y)
    figure;
    %Divide data between admitted and not atmitted:
    admitted = find(y);
    notAdmitted = find (y==0); 

    %Plot both admitted and not atmitted:
    scatter(x(admitted(1:length(admitted) ,1),1) ,  x(admitted(1:length(admitted) ,1),2) , '+','MarkerEdgeColor','k' );
    hold on;
    scatter(x(notAdmitted(1:length(notAdmitted) ,1),1) ,  x(notAdmitted(1:length(notAdmitted) ,1),2) , 'o','MarkerEdgeColor','k','MarkerFaceColor','y' );
    xlabel('Exam 1 score');
    ylabel('Exam 2 score');
    legend('Admitted', 'Not Admitted');
    