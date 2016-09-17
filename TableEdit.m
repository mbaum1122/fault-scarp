function TableEdit(hObject,eventdata)
%htable is handle to table
%eventdata is structure with 
data = get(gcf,'UserData');

i = eventdata.Indices;
pdata = eventdata.PreviousData;
ndata = eventdata.NewData;

% replot table data

scarpdata = str2double(get(findobj(gcf,'Tag','DataTable'),'Data'))
hplot = findobj('Tag','IC_Axes');
xdata = scarpdata(:,1);
ydata = scarpdata(:,2);
plot(h,xdata,ydata,'-ko')


