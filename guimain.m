function varargout = guimain(varargin)
% GUIMAIN MATLAB code for guimain.fig
%      GUIMAIN, by itself, creates a new GUIMAIN or raises the existing
%      singleton*.
%
%      H = GUIMAIN returns the handle to a new GUIMAIN or the handle to
%      the existing singleton*.
%
%      GUIMAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIMAIN.M with the given input arguments.
%
%      GUIMAIN('Property','Value',...) creates a new GUIMAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guimain_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guimain_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guimain

% Last Modified by GUIDE v2.5 08-Dec-2017 02:05:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guimain_OpeningFcn, ...
                   'gui_OutputFcn',  @guimain_OutputFcn, ...
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


% --- Executes just before guimain is made visible.
function guimain_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guimain (see VARARGIN)

% Choose default command line output for guimain
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guimain wait for user response (see UIRESUME)
% uiwait(handles.figure1);

axes(handles.axes1)

global tomada

tomada = false;
cat = 1;

url = getURL();

ss  = imread(url);
fh = image(ss);
while(~tomada)
    ss  = imread(url);
    set(fh,'CData',ss);
    drawnow;
end

if (tomada)
    [img, fclas] = clasifica(ss);

    bars = obtainBars(fclas);

    t = '';

    [ugh, b] = size(bars);

    for i=1:b
        temp = bars(i);

        if (temp == 1)
            t = strcat(t, 'Negro ');
        elseif (temp == 2)
            t = strcat(t, 'Cafe ');
        elseif (temp == 3)
            t = strcat(t, 'Rojo ');
        elseif (temp == 4)
            t = strcat(t, 'Naranja ');
        elseif (temp == 5)
            t = strcat(t, 'Amarillo ');
        elseif (temp == 8)
            t = strcat(t, 'Violeta ');
        elseif (temp == 9)
            t = strcat(t, 'Gris ');
        elseif (temp == 10)
            t = strcat(t, 'Blanco ');
        elseif (temp == 11)
            t = strcat('Dorado ');
        elseif (temp == 12)
            t = strcat('Plata ');
        end
    end
    imwrite(ss, 'test.png');

    figure, imshow(img);
    title(t);
    tomada = false;
end


% --- Outputs from this function are returned to the command line.
function varargout = guimain_OutputFcn(hObject, eventdata, handles) 
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
    if (~tomada)
        hObject.String = 'Regresar';
        tomada = true;
    end
