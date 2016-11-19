function data = init_control_tab(tabgroup, data)

%CONSTRUCT CONTROL TAB
control_tab = uitab('Parent', tabgroup, 'Title', 'Program Controls',...
                      'Tag', 'control_tab');

%table, text above it, and button for loading data
control_table_panel = uipanel('Parent', control_tab,...
        'Units', 'normalized',...
        'Position', [0 0 0.17 1],...
        'Title', 'Input Data',...
        'FontSize', 12);
control_buttongroup_load = uibuttongroup('Parent', control_table_panel,...
        'Units', 'normalized',...
        'Position', [0.0522 0.92 0.89 0.07]);
%control_button_load
uicontrol(control_buttongroup_load,...
        'Style', 'pushbutton',...
        'Units', 'normalized',...
        'Position', [.05 .05 .9 .9],...
        'String', 'LOAD DATA',...
        'FontSize', 14,...
        'Callback', @load_data);
%control_table
uitable('Parent', control_table_panel,...
        'ColumnName', {'X'; 'Y'},...
        'ColumnEditable', [true true],...
        'Units', 'normalized',...
        'Position', [0.0522 0.09 0.89 0.82],...
        'Tag', 'control_table',...
        'CellEditCallback', @table_edited);
control_buttongroup_save = uibuttongroup('Parent', control_table_panel,...
        'Units', 'normalized',...
        'Position', [0.0522 0.01 0.89 0.07]);
%control_button_save
uicontrol(control_buttongroup_save,...
        'Style', 'pushbutton',...
        'Units', 'normalized',...
        'Position', [.05 .05 0.9 0.9],...
        'String', 'Save Edited Data',...
        'FontSize', 14,...
        'ForegroundColor', [0.5 0.5 0.5],...
        'Tag', 'control_button_save',...
        'Callback', @save_data);

%axes, one with exaggeration and one without
control_ax_panel = uipanel('Parent', control_tab,...
        'Units', 'normalized',...
        'Position', [0.18 0.5 0.81 0.5],...
        'Title', 'Input Scarp Observations',...
        'FontSize', 12);
control_ax = axes('Parent', control_ax_panel,...
        'Units', 'normalized',...
        'Position', [0.05 0.15 0.925 0.7],...
        'Tag','control_ax',...
        'Box', 'on',...
        'XGrid', 'on',...
        'YGrid', 'on',...
        'NextPlot', 'add',...
        'FontSize', 12);
        control_ax.YLabel.String = 'Height, Y (meters)';
        control_ax.XLabel.String = 'Horizontal Distance, X (meters)';
        axis equal;
        text(0.5, 0.5, 'Load Scarp Profile Data',...
            'HorizontalAlignment', 'center',...
            'VerticalAlignment', 'middle',...
            'Tag', 'results_ax_text',...
            'Fontsize', 14);
%control_ax_exag_checkbox
uicontrol('Parent', control_ax_panel,...
        'Style', 'checkbox',...
        'Units', 'normalized',...
        'Position', [0.445 .875 0.2 0.1],...
        'String', 'Scale Axes Equally',...
        'FontSize', 12,...
        'HorizontalAlignment', 'center',...
        'Value', 1,...
        'Callback', @rescale_control_axes);

%control panel
control_panel = uipanel('Parent', control_tab,...
        'Units', 'normalized',...
        'Position', [0.18 0 0.81 0.49],...
        'Title', 'Control Panel',...
        'FontSize', 12);
%governing_eq
equation_panel = uipanel('Parent', control_panel,...
        'Units', 'normalized',...
        'Position', [0.01 0.725 0.15 0.25],...
        'Title', 'Governing Equation',...
        'Fontsize', 12);
annotation(equation_panel, 'textbox', [0 0 1 1],...
        'String', '$\frac{\partial y}{\partial t} = \kappa\frac{\partial^2 y}{\partial x^2}$',...
        'Interpreter', 'latex',...
        'Fontsize', 25 + data.fontsize_adjustment,...
        'HorizontalAlignment', 'center',...
        'VerticalAlignment', 'middle',...
        'EdgeColor', 'none');
solution_times_panel = uipanel('Parent', control_panel,...
        'Units', 'normalized',...
        'Position', [0.17 0.725 0.57 0.25],...
        'Title', 'Solution Times (years)',...
        'Fontsize', 12);
%solution_time_1
uicontrol('Parent', solution_times_panel,...
        'Units', 'normalized',...
        'Position', [0.01 0.075 0.15 0.575],...
        'Style', 'edit',...
        'FontSize', 12,...
        'Tag', 'solution_time_1',...
        'Callback', @check_numerical_input);
        uicontrol('Parent', solution_times_panel,...
        'Units', 'normalized',...
        'Position', [0.01 .7 0.15 0.25],...
        'Style', 'text',...
        'String', 'Solution Time 1',...
        'Fontsize', 11 + data.fontsize_adjustment);
%solution_time_2
solution_time_2 = uicontrol('Parent', solution_times_panel,...
        'Units', 'normalized',...
        'Position', [0.176 0.075 0.15 0.575],...
        'Style', 'edit',...
        'FontSize', 12,...
        'Tag', 'solution_time_2',...
        'Callback', @check_numerical_input);
        uicontrol('Parent', solution_times_panel,...
        'Units', 'normalized',...
        'Position', [0.176 .7 0.15 0.25],...
        'Style', 'text',...
        'String', 'Solution Time 2',...
        'Fontsize', 11 + data.fontsize_adjustment);
%solution_time_3
uicontrol('Parent', solution_times_panel,...
        'Units', 'normalized',...
        'Position', [0.342 0.075 0.15 0.575],...
        'Style', 'edit',...
        'FontSize', 12,...
        'Tag', 'solution_time_3',...
        'Callback', @check_numerical_input);
        uicontrol('Parent', solution_times_panel,...
        'Units', 'normalized',...
        'Position', [0.342 .7 0.15 0.25],...
        'Style', 'text',...
        'String', 'Solution Time 3',...
        'Fontsize', 11 + data.fontsize_adjustment);
%solution_time_4
uicontrol('Parent', solution_times_panel,...
        'Units', 'normalized',...
        'Position', [0.508 0.075 0.15 0.575],...
        'Style', 'edit',...
        'FontSize', 12,...
        'Tag', 'solution_time_4',...
        'Callback', @check_numerical_input);
        uicontrol('Parent', solution_times_panel,...
        'Units', 'normalized',...
        'Position', [0.508 .7 0.15 0.25],...
        'Style', 'text',...
        'String', 'Solution Time 4',...
        'Fontsize', 11 + data.fontsize_adjustment);
%solution_time_5
uicontrol('Parent', solution_times_panel,...
        'Units', 'normalized',...
        'Position', [0.674 0.075 0.15 0.575],...
        'Style', 'edit',...
        'FontSize', 12,...
        'Tag', 'solution_time_5',...
        'Callback', @check_numerical_input);
        uicontrol('Parent', solution_times_panel,...
        'Units', 'normalized',...
        'Position', [0.674 .7 0.15 0.25],...
        'Style', 'text',...
        'String', 'Solution Time 5',...
        'Fontsize', 11 + data.fontsize_adjustment);
%total_time
uicontrol('Parent', solution_times_panel,...
        'Units', 'normalized',...
        'Position', [0.84 0.075 0.15 .575],...
        'Style', 'edit',...
        'FontSize', 14,...
        'Tag', 'solution_time_6',...
        'Callback', @check_numerical_input);
        uicontrol('Parent', solution_times_panel,...
        'Units', 'normalized',...
        'Position', [0.84 .7 0.15 0.25],...
        'Style', 'text',...
        'String', 'Solution Time 6',...
        'Fontsize', 11 + data.fontsize_adjustment);
clear_times_buttongroup = uibuttongroup('Parent', control_panel,...
        'Units', 'normalized',...
        'Position', [0.75 0.725 0.08 0.225],...
        'Fontsize', 12);
uicontrol('Parent', clear_times_buttongroup,...
        'Style', 'pushbutton',...
        'Units', 'normalized',...
        'Position', [0.05 0.05 0.9 0.9],...
        'String', '<html>Clear<br>Times',...
        'Tag', 'clear_times_button',...
        'FontSize', 14 + data.fontsize_adjustment,...
        'Callback', @clear_times);
run_buttongroup = uibuttongroup('Parent', control_panel,...
        'Units', 'normalized',...
        'Position', [0.84 0.725 0.15 0.225],...
        'Fontsize', 12);
uicontrol('Parent', run_buttongroup,...
        'Style', 'pushbutton',...
        'Units', 'normalized',...
        'Position', [0.05 0.05 0.9 0.9],...
        'ForegroundColor', [0.5 0.5 0.5],...
        'String', 'RUN SOLVER',...
        'Tag', 'run_button',...
        'FontSize', 14,...
        'Callback', @run_model);
%kappa
parameter_panel = uipanel('Parent', control_panel,...
        'Units', 'normalized',...
        'Position', [0.51 0.52 0.48 0.2],...
        'Title', 'Diffusion Coefficient',...
        'Fontsize', 12);
uicontrol('Parent', parameter_panel,...
        'Units', 'normalized',...
        'Position', [0.5 0.1 0.45 .85],...
        'Style', 'edit',...
        'Fontsize', 12,...
        'Tag', 'kappa',...
        'Callback', @check_numerical_input);
        annotation(parameter_panel, 'textbox', [0.05 0.1 0.45 .85],...
        'String', 'Kappa, $\kappa$ ($m^2/yr$):',...
        'Interpreter', 'latex',...
        'Fontsize', 16,...
        'HorizontalAlignment', 'center',...
        'VerticalAlignment', 'middle',...
        'EdgeColor', 'none');

%instructions
instructions_panel = uipanel('Parent', control_panel,...
        'Units', 'normalized',...
        'Position', [0.01 0.02 0.49 0.7],...
        'Title', 'Instructions',...
        'Fontsize', 12);
annotation(instructions_panel, 'textbox', [0.01 0.8 0.98 0.2],...
        'String', {'1.  Load observations of a fault scarp profile from a 2 column delimited file,',
                  '     where the first column is horizontal distance and the second is scarp profile height.',
                  '',
                  '2.  Drag elements in the Initial Conditions tab to set the initial profile of the fault scarp,',
                            '     its shape when it first formed.',
                  '',
                  '3.  Enter the diffusion coefficient (kappa) and the desired solution times in this tab,',
                            '     then click RUN SOLVER.',
                  '',
                  '4.  Inspect solutions to the Governing Equation in the Results tab, finding solution',
                            '     times that yield good approximations of the observed data. Tweak the solution',
                            '     times until you have a good fit, and the time of the best fit is your age estimate.',
                            '     for your chosen value of kappa'},...
        'Fontsize', 12 + data.fontsize_adjustment,...
        'EdgeColor', 'none');

img_ax = axes('Parent', control_panel,...
        'Units', 'normalized',...
        'Position', [0.51 0.02 0.48 0.48],...
        'Box', 'off');
img = imread('img/gui-logo.png', 'png');
image(img);
axis equal;
img_ax.Color = 'none';
img_ax.XColor = 'none';
img_ax.YColor = 'none';

end
