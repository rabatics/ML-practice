function graph(X, y)



figure; hold on;


indicesOfPositiveLabels = find(y == 1);
indicedOfNegativeLabels = find(y == 0);

plot(X(indicesOfPositiveLabels, 1), X(indicesOfPositiveLabels, 2),
	'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(indicedOfNegativeLabels, 1), X(indicedOfNegativeLabels, 2),
	'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);

hold off;


end
