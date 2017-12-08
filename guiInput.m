function varargout = guiInput(varargin)
% GUIINPUT MATLAB code for guiInput.fig
%      GUIINPUT, by itself, creates a new GUIINPUT or raises the existing
%      singleton*.
%
%      H = GUIINPUT returns the handle to a new GUIINPUT or the handle to
%      the existing singleton*.
%
%      GUIINPUT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIINPUT.M with the given input arguments.
%
%      GUIINPUT('Property','Value',...) creates a new GUIINPUT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiInput_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiInput_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiInput

% Last Modified by GUIDE v2.5 07-Dec-2017 16:36:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiInput_OpeningFcn, ...
                   'gui_OutputFcn',  @guiInput_OutputFcn, ...
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


% --- Executes just before guiInput is made visible.
function guiInput_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiInput (see VARARGIN)

% Choose default command line output for guiInput
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiInput wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1)

global tomada
global selected

selected = 'Negro';
tomada = false;
cat = 1;

url = getURL();

while (1)
    ss  = imread(url);
    fh = image(ss);
    while(~tomada)
        ss  = imread(url);
        set(fh,'CData',ss);
        drawnow;
    end

    if (strcmp(selected, 'Negro') == 1)
       cat = 1;
    elseif (strcmp(selected, 'Café') == 1)
       cat = 2;
    elseif (strcmp(selected, 'Rojo') == 1)
       cat = 3;
    elseif (strcmp(selected, 'Naranja') == 1)
       cat = 4;
    elseif (strcmp(selected, 'Amarillo') == 1)
       cat = 5;
    elseif (strcmp(selected, 'Verde') == 1)
       cat = 6;
    elseif (strcmp(selected, 'Azul') == 1)
       cat = 7;
    elseif (strcmp(selected, 'Violeta') == 1)
       cat = 8;
    elseif (strcmp(selected, 'Gris') == 1)
       cat = 9;
    elseif (strcmp(selected, 'Blanco') == 1)
       cat = 10;
    elseif (strcmp(selected, 'Dorado') == 1)
       cat = 11;
    elseif (strcmp(selected, 'Plata') == 1)
       cat = 12;
    elseif (strcmp(selected, 'Fondo') == 1)
       cat = 13;
    elseif (strcmp(selected, 'Papel y alambre') == 1)
       cat = 14;
    end

    if (tomada) 
        cuenta(ss, cat);
        imwrite(ss, 'test.png');
        tomada = false;
    end
end


% --- Outputs from this function are returned to the command line.
function varargout = guiInput_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tomada
tomada = true;


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global selected;
selected = hObject.String;
