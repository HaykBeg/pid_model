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


% --- Executes just before basiq_pid_motor_gui is made visible.
function basiq_pid_motor_gui_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
load 'main.mat';


% --- Outputs from this function are returned to the command line.
function varargout = basiq_pid_motor_gui_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function voltage_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function voltage_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in simulate_button.
function simulate_button_Callback(hObject, eventdata, handles)
%voltage = get(handles.slider1,'value');
voltage = get(handles.slider1,'value')
P_value = str2double(get(handles.p_value,'string'))
I_value = str2double(get(handles.i_value,'string'))
D_value = str2double(get(handles.d_value,'string'))
save('main.mat','voltage','-append');
save('main.mat','P_value','-append');
save('main.mat','I_value','-append');
save('main.mat','D_value','-append');
load('main.mat');
sim('basic_pid_engine');


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
voltage = get(handles.slider1,'value');
set(handles.text3, 'string', voltage);
save('main.mat','voltage','-append');


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)



function p_value_Callback(hObject, eventdata, handles)
P_value = str2double(get(handles.p_value,'string'));
P_value
save('main.mat','P_value','-append');


% --- Executes during object creation, after setting all properties.
function p_value_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function i_value_Callback(hObject, eventdata, handles)
I_value = str2double(get(handles.i_value,'string'));
I_value
save('main.mat','I_value','-append');


% --- Executes during object creation, after setting all properties.
function i_value_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d_value_Callback(hObject, eventdata, handles)
D_value = str2double(get(handles.d_value,'string'));
D_value
save('main.mat','D_value','-append');


% --- Executes during object creation, after setting all properties.
function d_value_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
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


% --- Executes during object creation, after setting all properties.
function n_value_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'),get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
