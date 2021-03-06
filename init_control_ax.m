function data = init_control_ax(x, y, handles, data)

%plot in control tab axes
axes(handles.control_ax);
plot(x, y, 'ko', 'Tag', 'observations');
ax_margins(handles.control_ax, x, y);
legend({'Observed Scarp Profile'},...
        'Location', 'eastoutside',...
        'Fontsize', 12);

end
