function varargout = basiq_pid_motor_gui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @basiq_pid_motor_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @basiq_pid_motor_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


function basiq_pid_motor_gui_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
load 'main.mat'; 
% The load functiona is not working sometimes and we need to execute it
% manually on opening.


function varargout = basiq_pid_motor_gui_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function voltage_Callback(hObject, eventdata, handles)


function voltage_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function simulate_button_Callback(hObject, eventdata, handles)
% We have a bug here, the Simulate button works only when pressing it twice.
% //TODO Investigate and fix the cause of the bug.
voltage = get(handles.slider1,'value')
P_value = str2double(get(handles.p_value,'string'))
I_value = str2double(get(handles.i_value,'string'))
D_value = str2double(get(handles.d_value,'string'))
save('main.mat','voltage','-append');
save('main.mat','P_value','-append');
save('main.mat','I_value','-append');
save('main.mat','D_value','-append');
%load('main.mat');
sim('basic_pid_engine');


function figure1_CreateFcn(hObject, eventdata, handles)


function slider1_Callback(hObject, eventdata, handles)
voltage = get(handles.slider1,'value');
set(handles.text3, 'string', voltage);
save('main.mat','voltage','-append');


function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function togglebutton1_Callback(hObject, eventdata, handles)



function p_value_Callback(hObject, eventdata, handles)
P_value = str2double(get(handles.p_value,'string'));
P_value
save('main.mat','P_value','-append');


function p_value_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function i_value_Callback(hObject, eventdata, handles)
I_value = str2double(get(handles.i_value,'string'));
I_value
save('main.mat','I_value','-append');


function i_value_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d_value_Callback(hObject, eventdata, handles)
D_value = str2double(get(handles.d_value,'string'));
D_value
save('main.mat','D_value','-append');


function d_value_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton2_Callback(hObject, eventdata, handles)
P_value = 53
I_value = 60
D_value = 3
set(handles.p_value,'string',P_value);
set(handles.i_value,'string',I_value);
set(handles.d_value,'string',D_value);


function n_value_Callback(hObject, eventdata, handles)
N_value = str2double(get(handles.n_value,'string'));
N_value
save('main.mat','N_value','-append');


function n_value_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'),get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
