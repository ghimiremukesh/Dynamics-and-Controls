% GUI for Project One
% Mukesh Ghimire
% Yiqiu Dai

function varargout = Project_2_GUI(varargin)
% PROJECT_2_GUI MATLAB code for Project_2_GUI.fig
%      PROJECT_2_GUI, by itself, creates a new PROJECT_2_GUI or raises the existing
%      singleton*.
%
%      H = PROJECT_2_GUI returns the handle to a new PROJECT_2_GUI or the handle to
%      the existing singleton*.
%
%      PROJECT_2_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_2_GUI.M with the given input arguments.
%
%      PROJECT_2_GUI('Property','Value',...) creates a new PROJECT_2_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_2_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_2_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project_2_GUI

% Last Modified by GUIDE v2.5 26-Nov-2018 14:49:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project_2_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Project_2_GUI_OutputFcn, ...
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


% --- Executes just before Project_2_GUI is made visible.
function Project_2_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project_2_GUI (see VARARGIN)

% Choose default command line output for Project_2_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project_2_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


 


% --- Outputs from this function are returned to the command line.
function varargout = Project_2_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function m_un_Callback(hObject, eventdata, handles)
% hObject    handle to m_un (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_un as text
%        str2double(get(hObject,'String')) returns contents of m_un as a double


% --- Executes during object creation, after setting all properties.
function m_un_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_un (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bplot.
function bplot_Callback(hObject, eventdata, handles)
% hObject    handle to bplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global m m_un e k j w_n 

m = 10;
m_un = str2double(get(handles.m_un, 'String'));
e = str2double(get(handles.e, 'String'))/100;
k = str2double(get(handles.k, 'String'))*1000;
j = 0.01;
w_n = sqrt(k/m);
num = [-m_un*e/m 0 0];
den = [1 2*j*w_n w_n^2];
system = tf(num, den);
bode(system);
grid on;
hold on;
% legend(['K = ' num2str(k)], ['e = ' num2str(e)]);

function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e_Callback(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e as text
%        str2double(get(hObject,'String')) returns contents of e as a double


% --- Executes during object creation, after setting all properties.
function e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
