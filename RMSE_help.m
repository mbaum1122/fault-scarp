function RMSE_help(hObject, ~)

sz = get(groot, 'Screensize');
pos = [sz(4)*0.05 sz(4)*0.05 max([700, sz(3)/2]) sz(4)*0.85];

help_fig = figure('name', 'RMSE Explanation',...
    'Position', pos,...
    'NumberTitle', 'off',... %get rid of the 'Figure 1:'
    'MenuBar', 'none',... %remove 'File', 'Edit', etc. menu
    'ToolBar', 'none',... %remove icon based lower toolbar
    'Resize', 'on');

help_panel = uipanel('Parent', help_fig,...
    'Units', 'normalized',...
    'Position', [0.02 0.02 0.96 0.96],...
    'FontSize', 14);

annotation(help_panel, 'textbox', [0.02 0.02 0.96 0.96],...
    'String',...
        {'The ``root mean squared error" (RMSE) is a measure of how closely'...
        'one set of points approximates another.',...
        '',...
        'In this case, the RMSE is indicating how closely your solutions to the',...
        'diffusion equation overlap your observed fault scarp profile.',...
        '',...
        'The RMSE is calculated by taking the vertical difference between',...
        'the points in each set that share horizontal coordinates, squaring',...
        'all of the differences, finding the averaged squared difference,',...
        'then taking the square root of the average squared difference.',...
        '',...
        'Hence the name ``root mean squared error". RMSE is the root of the',...
        'average squared error.',...
        '',...
        'Expressed as an equation:',...
        '',...
        'RMSE = $\sqrt{\left[\sum_{1}^{n}\left(y_{obs} - y_{calc}\right)^2\right]/n}$',...
        '',...
        'where $y_{obs}$ is your set of observed profile heights, $y_{calc}$ is the',...
        'set of calculated profles (solutions to the diffusion equation),',...
        'and $n$ is the total number of observations',...
        '',...
        'Here, the RMSE is expressed as a percentage of the',...
        'range of observed $y$ values. The smaller the better!'},...
    'Interpreter', 'latex',...
    'FontSize', 16,...
    'VerticalAlignment', 'middle',...
    'HorizontalAlignment', 'center',...
    'EdgeColor', 'none');

end
