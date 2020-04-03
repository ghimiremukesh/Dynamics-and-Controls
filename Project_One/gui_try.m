% GUI for Project One
% Mukesh Ghimire
% Yiqiu Dai

function varargout = gui_try(varargin)
% GUI_TRY MATLAB code for gui_try.fig
%      GUI_TRY, by itself, creates a new GUI_TRY or raises the existing
%      singleton*.
%
%      H = GUI_TRY returns the handle to a new GUI_TRY or the handle to
%      the existing singleton*.
%
%      GUI_TRY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TRY.M with the given input arguments.
%
%      GUI_TRY('Property','Value',...) creates a new GUI_TRY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_try_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_try_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_try

% Last Modified by GUIDE v2.5 29-Oct-2018 00:34:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_try_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_try_OutputFcn, ...
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


% --- Executes just before gui_try is made visible.
function gui_try_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_try (see VARARGIN)

% Choose default command line output for gui_try
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_try wait for user response (see UIRESUME)
% uiwait(handles.figure1);


 


% --- Outputs from this function are returned to the command line.
function varargout = gui_try_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function speed_Callback(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of speed as text
%        str2double(get(hObject,'String')) returns contents of speed as a double


% --- Executes during object creation, after setting all properties.
function speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calcbutton.
function calcbutton_Callback(hObject, eventdata, handles)
% hObject    handle to calcbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f v p TT 
set(handles.stime, 'String', "Calculating.....");
set(handles.force, 'String', "Calculating.....");

speed = str2double(get(handles.speed, 'String'));
v = speed * 0.44704;
assignin('base' , 'v', v); % to save the value in the workspace

f = 2*pi*v/0.65; % L = 0.65m
assignin('base', 'f', f);

p = 2*f;
assignin('base', 'p', p);

TT=2+3*(2*pi/f);
assignin('base','TT', TT);

sim Project_One_Simulink_for_GUI

% to check for the settling time when the displacement is less than 0.5 mm
for i = length(d):-1:1
    if (abs(d(i)) >= 0.001) 
        set(handles.stime, 'String', ceil(t(i))+" seconds"); % rounded to nearest whole number for precision
        break;
    end
end

set(handles.force, 'String', max(abs(force)) + " Newtons");
axes(handles.axes1);
plot(t,d);

xlabel('time in seconds');
ylabel('displacement in meters');

axes(handles.axes2);
plot(t, force);

xlabel('time in seconds');
ylabel('force in Newtons');
