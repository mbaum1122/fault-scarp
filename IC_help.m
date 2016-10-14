function IC_help(hObject, ~)

sz = get(groot, 'Screensize');
pos = [1 1 max([700, sz(3)/2]) sz(4)];

help_fig = figure('name', 'Initial Conditions Help',...
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
        {'First load data in the ``Program Controls" tab.'...
        '',...
        'Click and drag the large dots on the dashed line to set the',...
        'initial profile of the fault scarp. The angle of each line',...
        'segment is displayed immediately above the plot window.',...
        '',...
        'Once an IC point has been clicked, it''s displayed in a different',...
        'color indicating it was the last point clicked.',...
        '',...
        'If ``Add Segment" or ``Delete Segment" are clicked, the addition',...
        'or deletion occurs at the last selected point.',...
        '',...
        'Clicking ``Restore" will immediately reset the IC points to their',...
        'initial configuration',...
        '',...
        'After the initial scarp profile is set, its coordinates are',...
        'automatically used as the initial conditions when solving the',...
        'diffusion equation.'},...
    'Interpreter', 'latex',...
    'FontSize', 16,...
    'VerticalAlignment', 'middle',...
    'HorizontalAlignment', 'center',...
    'EdgeColor', 'none');

end
