function ax_margins(ax, x, y)
%adjust the limits of an axis to add 2.5 percent margins

xmin = min(x);
xmax = max(x);
r = xmax - xmin;
ax.XLim = [xmin - r*0.025, xmax + r*0.025];

ymin = min(y);
ymax = max(y);
r = ymax - ymin;
ax.YLim = [ymin - r*0.025, ymax + r*0.025];

end
