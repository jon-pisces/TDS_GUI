function varargout = TDS_GUI(varargin)
% TDS_GUI MATLAB code for TDS_GUI.fig
%      New edits 2019 08 01
%      TDS_GUI, by itself, creates a new TDS_GUI or raises the existing
%      singleton*.
%
%      H = TDS_GUI returns the handle to a new TDS_GUI or the handle to
%      the existing singleton*.
%
%      TDS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TDS_GUI.M with the given input arguments.
%
%      TDS_GUI('Property','Value',...) creates a new TDS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TDS_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TDS_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%%========================================================================

%% Written by Michael Simmonds : msimmonds@eng.ucsd.edu


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TDS_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @TDS_GUI_OutputFcn, ...
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

%% ========================================================================
%  =========================== Initialization =============================
%  ========================================================================

% --- Executes just before TDS_GUI is made visible.
function TDS_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TDS_GUI (see VARARGIN)

global axFit
global axBck
global axFnl

% Choose default command line output for TDS_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

axFit = findobj('Type','axes','Tag','axes_Fitting');
axBck = findobj('Type','axes','Tag','axes_Background');
axFnl = findobj('Type','axes','Tag','axes_FinalPlot');


% Disable Features Initially

set(handles.edit_mks_HD_p1,'enable','on');
set(handles.edit_mks_HD_p2,'enable','on');
set(handles.edit_srs_D2_p1,'enable','on');
set(handles.edit_srs_D2_p2,'enable','on');
set(handles.edit_RampRate,'enable','off');
set(handles.edit_mks_Dtot,'enable','off');
set(handles.edit_srs_Dtot,'enable','off');

set(handles.pushbutton_Imp_Temp,'enable','off');
set(handles.pushbutton_Fit__MKS,'enable','off');
set(handles.pushbutton_Fit__SRS,'enable','off');
set(handles.pushbutton_kill_fit,'enable','off');
set(handles.pushbutton_PeaksFit,'enable','off');
set(handles.pushbutton_FitError,'enable','off');
set(handles.pushbutton_SlctData,'enable','off');
set(handles.pushbutton_PerformFit,'enable','off');
set(handles.pushbutton_TempTime,'enable','off');
set(handles.pushbutton_FluxTime,'enable','off');
set(handles.pushbutton_FluxTemp,'enable','off');
set(handles.pushbutton_WkspcMKS,'enable','off');
set(handles.pushbutton_WkspcSRS,'enable','off');
set(handles.pushbutton_TxtF_MKS,'enable','off');
set(handles.pushbutton_TxtF_SRS,'enable','off');
set(handles.pushbutton_Tot_D_flx,'enable','off');

set(handles.radiobutton_Scale__D2,'enable','off');
set(handles.radiobutton_Scale__HD,'enable','off');
set(handles.radiobutton_ChooseMKS,'enable','off');
set(handles.radiobutton_ChooseSRS,'enable','off');

set(handles.checkbox_Temp_Data,'enable','off');
set(handles.checkbox_D2fluxMKS,'enable','off');
set(handles.checkbox_HDfluxMKS,'enable','off');
set(handles.checkbox_HefluxMKS,'enable','off');
set(handles.checkbox_D2fluxSRS,'enable','off');
set(handles.checkbox_HDfluxSRS,'enable','off');
set(handles.checkbox_HefluxSRS,'enable','off');


% UIWAIT makes TDS_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

function varargout = TDS_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%  editable inputs initiallization ========================================
function edit_Path_MKS_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_Path_SRS_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_Var__MKS_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_Var__SRS_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_H2pk_srs_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_HDpk_srs_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_Hepk_srs_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_D2pk_srs_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_H2pk_mks_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_Hepk_mks_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_D2pk_mks_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_HDpk_mks_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mksD2PresC_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mksHePresC_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mksPresZ_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srsD2PresC_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srsHePresC_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srsPresZ_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_SampleArea_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_D2LeakRate_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_HeLeakRate_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mks_D2_p1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mks_D2_p2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mks_HD_p1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mks_HD_p2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mks_He_p1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mks_He_p2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srs_D2_p1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srs_D2_p2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srs_HD_p1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srs_HD_p2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srs_He_p1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srs_He_p2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_HD_mult_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_D2_mult_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mks_Dtot_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srs_Dtot_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_time1min_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_time1max_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_time2min_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_time2max_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_RampRate_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_Temp_min_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_Temp_max_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_time_min_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_time_max_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function radiobutton_Scale__HD_CreateFcn(hObject, eventdata, handles)


%% ===================== TDS GUI Operational Flow =========================

% - Parameters ============================================================
%       MKS,SRS, and Universal Parameters are editable and used for D Flux
%
% A Select File/Directory =================================================
%       Click on Find or type in File/Dir
%       De/Select if peak data is smoothed with a Gaussian
%       Click on Fit 
%               Fitting is displayed in Fitting Peaks/Error Plot 
%               Error is initially displayed in Fitting Peaks/Error Plot
%               Peaks are initially displayed in Final Fit Plot 
%
% B Fitting Peaks/Error ===================================================
%       Click on either Peaks Fit or Fit Error to view
%
% C Choose signal to Scale to H2 ==========================================
%       Select either HD or D2 to scale (after Background Fit select other)
%
% D Background Fit ========================================================
%       Edit t_min and t_max to include data to match H2 to either HD or D2
%       Click on Select Data to display data to be scaled
%       Click on Perform Fit to calculate background
%               Scaling of H2 is plotted for HD or D2 in Background Fit
%               The scaled H2 is overlayed with HD or D2 in Final Fit Plot
%
% E Background (Optional) =================================================
%       Edit H2 scaling factors for a*H2^2 + b*H2 + c and press enter to
%           modify fitting displayed in Final Fit Plot
%
% F Final Fit =============================================================
%       Click on Temp vs. time (MKS must be loaded first) to display
%       Click on Flux vs. time to display Background subtracted and D2
%           calibrated Flux value for HD or D2
%       Edit T_min and T_max to select Temp range on linear ramp to save
%       Click on Flux vs. Temp to display HD or D2 Flux of selected Temps
%       Edit the Ramp Rate 
%       If Both HD and D2 have a scaled H2 Background to subtract then
%           check Total to view total D for Flux vs. Temp 
%
% G Store =================================================================
%       Edit field to name Workspace variable or Text File 
%       Click on Workspace to store all data associated with fitting/result
%       Click on Text File to store data in the following format:
%         Header1 | YYYY:MM:DD D Retention = ##### [D/m^2]   
%         Header2 | Time[s] Temp[K] DFlux[D/m^2/s] Error[std/peak]           
%         Values  | #####   #####   #####          #####
%
% =========================================================================


%% ========================================================================
%  ============================== CallBacks ===============================
%  ========================================================================


% - Parameters ============================================================

function         edit_mksD2PresC_Callback(hObject, eventdata, handles)
function         edit_mksHePresC_Callback(hObject, eventdata, handles)
function         edit_mksPresZ_Callback(hObject, eventdata, handles)

function         edit_srsD2PresC_Callback(hObject, eventdata, handles)
function         edit_srsHePresC_Callback(hObject, eventdata, handles)
function         edit_srsPresZ_Callback(hObject, eventdata, handles)

function         edit_SampleArea_Callback(hObject, eventdata, handles)
dumVar = get(handles.edit_SampleArea,'String');
dumVar = eval(dumVar);
set(handles.edit_SampleArea,'String',dumVar);

function         edit_D2LeakRate_Callback(hObject, eventdata, handles)
function         edit_HeLeakRate_Callback(hObject, eventdata, handles)

% A Select File/Directory =================================================

function     radiobutton_TDS_A_Callback(hObject, eventdata, handles)
 set(handles.radiobutton_TDS_B,'Value',0)

function     radiobutton_TDS_B_Callback(hObject, eventdata, handles)
 set(handles.radiobutton_TDS_A,'Value',0)

function         edit_Path_MKS_Callback(hObject, eventdata, handles)
set(handles.pushbutton_Imp_Temp,'enable','on');
set(handles.pushbutton_Fit__MKS,'enable','on');

function         edit_Path_SRS_Callback(hObject, eventdata, handles)
set(handles.pushbutton_Fit__SRS,'enable','on');

function   pushbutton_Find_MKS_Callback(hObject, eventdata, handles)
[fileNameMKS,pathNameMKS] = uigetfile('E:\Data\MKS\Data\*.txt','Select the MKS file');
if fileNameMKS == 0
    filePathMKS = 'E:\Data\MKS\Data\*.txt';
    set(handles.pushbutton_Imp_Temp,'enable','off');
    set(handles.pushbutton_Fit__MKS,'enable','off');
else
    filePathMKS = [pathNameMKS fileNameMKS];
    set(handles.pushbutton_Imp_Temp,'enable','on');
    set(handles.pushbutton_Fit__MKS,'enable','on');
end
set(handles.edit_Path_MKS,'String',filePathMKS);


function   pushbutton_Find_SRS_Callback(hObject, eventdata, handles)
filePathSRS = [uigetdir('E:\Data\SRS\') '\'];
if strcmp(filePathSRS,[0 '\'])
    filePathSRS = 'E:\Data\SRS\';
    set(handles.pushbutton_Fit__SRS,'enable','off');
else
    set(handles.pushbutton_Fit__SRS,'enable','on');
end
set(handles.edit_Path_SRS,'String',filePathSRS);

function   pushbutton_Imp_Temp_Callback(hObject, eventdata, handles)
global mks_data
global srs_data
global srsFit

set(handles.pushbutton_Imp_Temp,'enable','off');
set(handles.checkbox_Temp_Data, 'Value',1);
set(handles.pushbutton_TempTime,'enable','on');

fileName = get(handles.edit_Path_MKS,'String');

if     get(handles.radiobutton_TDS_A,'Value')
        data = read_MKS_data_A(fileName);
elseif get(handles.radiobutton_TDS_B,'Value')
        data = read_MKS_data_B(fileName);
end

mks_data.dtList = data.dateTime;          
mks_data.temptr = data.temper_K;

if srsFit == 1
    srs_data.temptr = interp1(mks_data.dtList,mks_data.temptr,...
                              srs_data.dtList, 'linear');                      
end

T_min = str2double(get(handles.edit_Temp_min,'String'));
T_max = max(mks_data.temptr);
set(handles.edit_Temp_max,'String',num2str(T_max,'%5.2f'));

jBgn  = find(mks_data.temptr>(T_min-7.5) & mks_data.temptr<(T_min+7.5),1,'first');
jEnd  = find(mks_data.temptr>(T_max-7.5) & mks_data.temptr<(T_max+7.5),1,'first');

set(handles.edit_time_min,'String',num2str(mks_data.dtList(jBgn),'%5.2f'));
set(handles.edit_time_max,'String',num2str(mks_data.dtList(jEnd),'%5.2f'));

function    checkbox_Temp_Data_Callback(hObject, eventdata, handles)

function    checkbox_Gauss_SRS_Callback(hObject, eventdata, handles)

function    checkbox_Gauss_MKS_Callback(hObject, eventdata, handles)

function   pushbutton_Fit__MKS_Callback(hObject, eventdata, handles)
global axFit
global axBck
global axFnl
global mks_data
global srs_data
global srsFit
global killFit

set(handles.pushbutton_Fit__MKS,'enable','off');

GaussMKS = get(handles.checkbox_Gauss_MKS,'Value');
switch GaussMKS
    case 1
    filter_ = 'Gaussian';
    case 0
    filter_ = 'none';
end

massPeak.H2peak = str2double(get(handles.edit_H2pk_mks,'String'));
massPeak.HDpeak = str2double(get(handles.edit_HDpk_mks,'String'));
massPeak.D2peak = str2double(get(handles.edit_D2pk_mks,'String'));
massPeak.Hepeak = str2double(get(handles.edit_Hepk_mks,'String'));
massPeak.zeroP_ = str2double(get(handles.edit_mksPresZ,'String'));

filePathMKS = get(handles.edit_Path_MKS,'String');

if     get(handles.radiobutton_TDS_A,'Value')
       TDS_AorB = 'TDS_A';
elseif get(handles.radiobutton_TDS_B,'Value')
       TDS_AorB = 'TDS_B';
end

set(handles.pushbutton_kill_fit,'enable','on');
if get(handles.checkbox_Use_Char_Shape,'Value');
    mks_data = fit_QMS_Data(filePathMKS,filter_,axFit,massPeak,'MKS',TDS_AorB,'CHAR');
else
    mks_data = fit_QMS_Data(filePathMKS,filter_,axFit,massPeak,'MKS',TDS_AorB,'QUAD');
end

set(handles.pushbutton_kill_fit,'enable','off');

if killFit == 1
    return
end

plot_Log10_time(mks_data,'MKS Error',axFit);
plot_Log10_time(mks_data,       'HD',axBck);
plot_Log10_time(mks_data,      'MKS',axFnl);

set(handles.pushbutton_SlctData,  'enable','on');
set(handles.pushbutton_TempTime,  'enable','on');
set(handles.pushbutton_PeaksFit,  'enable','on');
set(handles.pushbutton_FitError,  'enable','on');
set(handles.radiobutton_Scale__He,'enable','on');
set(handles.radiobutton_Scale__HD,'enable','on');
set(handles.radiobutton_Scale__D2,'enable','on');
set(handles.radiobutton_ChooseMKS,'enable','on');

set(handles.radiobutton_Scale__HD,'Value',1);
set(handles.radiobutton_ChooseMKS,'Value',1);

T_min = str2double(get(handles.edit_Temp_min,'String'));
T_max = str2double(get(handles.edit_Temp_max,'String'));

jBgn  = find(mks_data.temptr>(T_min-7.5) & mks_data.temptr<(T_min+7.5),1,'first');
jEnd  = find(mks_data.temptr>(T_max-7.5) & mks_data.temptr<(T_max+7.5),1,'first');
jSpan = jBgn:jEnd;

set(handles.edit_time_min,'String',num2str(mks_data.dtList(jBgn),'%5.2f'));
set(handles.edit_time_max,'String',num2str(mks_data.dtList(jEnd),'%5.2f'));

t1min = min(mks_data.dtList);
t1max =     mks_data.dtList(jSpan(1))-50;
set(handles.edit_time1min,'String',num2str(t1min,'%5.2f'));
set(handles.edit_time1max,'String',num2str(t1max,'%5.2f'));

t2min =     mks_data.dtList(jSpan(end))+650;
t2max = max(mks_data.dtList);
set(handles.edit_time2min,'String',num2str(t2min,'%5.2f'));
set(handles.edit_time2max,'String',num2str(t2max,'%5.2f'));

set(handles.pushbutton_Imp_Temp,'enable','off');
set(handles.checkbox_Temp_Data, 'Value',1);
set(handles.pushbutton_TempTime,'enable','on');

if srsFit == 1
    srs_data.temptr = interp1(mks_data.dtList,mks_data.temptr,...
                              srs_data.dtList, 'linear');
end

Tmax = max(mks_data.temptr);
set(handles.edit_Temp_max,'String',num2str(Tmax,'%5.2f'));

function   pushbutton_Fit__SRS_Callback(hObject, eventdata, handles)
global axFit
global axBck
global axFnl
global mks_data
global srs_data
global srsFit
global killFit

srsFit = 1;

set(handles.pushbutton_Fit__SRS,'enable','off');

GaussSRS = get(handles.checkbox_Gauss_SRS,'Value');
switch GaussSRS
    case 1
    filter_ = 'Gaussian';
    case 0
    filter_ = 'none';
end

massPeak.H2peak = str2double(get(handles.edit_H2pk_srs,'String'));
massPeak.HDpeak = str2double(get(handles.edit_HDpk_srs,'String'));
massPeak.Hepeak = str2double(get(handles.edit_Hepk_srs,'String'));
massPeak.D2peak = str2double(get(handles.edit_D2pk_srs,'String'));
massPeak.zeroP_ = str2double(get(handles.edit_srsPresZ,'String'));

filePathSRS = get(handles.edit_Path_SRS,'String');

set(handles.pushbutton_kill_fit,'enable','on');
if get(handles.checkbox_Use_Char_Shape,'Value');
    srs_data = fit_QMS_Data(filePathSRS,filter_,axFit,massPeak,'SRS',0,'CHAR');
else
    srs_data = fit_QMS_Data(filePathSRS,filter_,axFit,massPeak,'SRS',0,'QUAD');
end
set(handles.pushbutton_kill_fit,'enable','off');

if killFit == 1
    return
end

plot_Log10_time(srs_data,'SRS Error',axFit);
plot_Log10_time(srs_data,       'HD',axBck);
plot_Log10_time(srs_data,      'SRS',axFnl);

set(handles.pushbutton_SlctData,  'enable','on');
set(handles.pushbutton_PeaksFit,  'enable','on');
set(handles.pushbutton_FitError,  'enable','on');
set(handles.radiobutton_Scale__D2,'enable','on');
set(handles.radiobutton_Scale__HD,'enable','on');
set(handles.radiobutton_ChooseSRS,'enable','on');

set(handles.radiobutton_Scale__HD,'Value',1)
set(handles.radiobutton_ChooseSRS,'Value',1)

T_min = str2double(get(handles.edit_Temp_min,'String'));
T_max = str2double(get(handles.edit_Temp_max,'String'));

Tspan_ = 20.0;

jBgn = find(mks_data.temptr>(T_min-Tspan_) & mks_data.temptr<(T_min+Tspan_),1,'first');
jEnd = find(mks_data.temptr>(T_max-Tspan_) & mks_data.temptr<(T_max+Tspan_),1,'first');
jSpan = jBgn:jEnd;

% jBgn  = find(mks_data.temptr>(T_min-7.5) & mks_data.temptr<(T_min+7.5),1,'first');
% jEnd  = find(mks_data.temptr>(T_max-7.5) & mks_data.temptr<(T_max+7.5),1,'first');
% jSpan = jBgn:jEnd;

t1min = min(mks_data.dtList);
t1max =     mks_data.dtList(jSpan(1))-50;
set(handles.edit_time1min,'String',num2str(t1min,'%5.2f'));
set(handles.edit_time1max,'String',num2str(t1max,'%5.2f'));

t2min =     mks_data.dtList(jSpan(end))+650;
t2max = max(mks_data.dtList);
set(handles.edit_time2min,'String',num2str(t2min,'%5.2f'));
set(handles.edit_time2max,'String',num2str(t2max,'%5.2f'));

if get(handles.checkbox_Temp_Data,'Value')
    srs_data.temptr = interp1(mks_data.dtList,mks_data.temptr,...
                              srs_data.dtList, 'linear');
end

function radiobutton_ChooseMKS_Callback(hObject, eventdata, handles)
D2flux = get(handles.checkbox_D2fluxMKS,'Value');
HDflux = get(handles.checkbox_HDfluxMKS,'Value');

if     D2flux || HDflux
         set(handles.pushbutton_Tot_D_flx,'enable','off');
elseif D2flux && HDflux
         set(handles.pushbutton_Tot_D_flx,'enable','on');
end
    
function radiobutton_ChooseSRS_Callback(hObject, eventdata, handles)
D2flux = get(handles.checkbox_D2fluxSRS,'Value');
HDflux = get(handles.checkbox_HDfluxSRS,'Value');

if     D2flux || HDflux
         set(handles.pushbutton_Tot_D_flx,'enable','off');
elseif D2flux && HDflux
         set(handles.pushbutton_Tot_D_flx,'enable','on');
end

% B Fitting Peaks/Error ===================================================

function checkbox_Use_Char_Shape_Callback(hObject, eventdata, handles)

function         edit_H2pk_mks_Callback(hObject, eventdata, handles)

function         edit_HDpk_mks_Callback(hObject, eventdata, handles)

function         edit_D2pk_mks_Callback(hObject, eventdata, handles)

function         edit_Hepk_mks_Callback(hObject, eventdata, handles)

function         edit_H2pk_srs_Callback(hObject, eventdata, handles)

function         edit_HDpk_srs_Callback(hObject, eventdata, handles)

function         edit_Hepk_srs_Callback(hObject, eventdata, handles)

function         edit_D2pk_srs_Callback(hObject, eventdata, handles)

function   pushbutton_PeaksFit_Callback(hObject, eventdata, handles)
global axFit
global mks_data
global srs_data

if     get(handles.radiobutton_ChooseMKS,'Value')
       data = mks_data;
       title_ = 'MKS';
elseif get(handles.radiobutton_ChooseSRS,'Value')
       data = srs_data;
       title_ = 'SRS';
end

plot_Log10_time(data,title_,axFit);

function   pushbutton_FitError_Callback(hObject, eventdata, handles)
global axFit
global mks_data
global srs_data

if     get(handles.radiobutton_ChooseMKS,'Value')
       data = mks_data;
       title_ = 'MKS Error';
elseif get(handles.radiobutton_ChooseSRS,'Value')
       data = srs_data;
       title_ = 'SRS Error';
end

plot_Log10_time(data,title_,axFit);

function   pushbutton_kill_fit_Callback(hObject, eventdata, handles)
global killFit

killFit= 1;


% C Choose signal to Scale to H2 ==========================================

function radiobutton_Scale__D2_Callback(hObject, eventdata, handles)

function radiobutton_Scale__HD_Callback(hObject, eventdata, handles)


% D Background Fit ========================================================

function         edit_time1min_Callback(hObject, eventdata, handles)
global mks_data

time_min = str2double(get(handles.edit_time1min,'String'));
time_min = max(time_min,min(mks_data.dtList));
set(handles.edit_time1min,'String',num2str(time_min,'%5.2f'));

function         edit_time1max_Callback(hObject, eventdata, handles)
global mks_data

time_max = str2double(get(handles.edit_time1max,'String'));
time_max = min(time_max,max(mks_data.dtList));
set(handles.edit_time1max,'String',num2str(time_max,'%5.2f'));  

function         edit_time2min_Callback(hObject, eventdata, handles)

function         edit_time2max_Callback(hObject, eventdata, handles)

function   pushbutton_SlctData_Callback(hObject, eventdata, handles)
global axBck
global axFnl
global mks_data
global srs_data

ChooseMKS = get(handles.radiobutton_ChooseMKS,'Value');
ChooseSRS = get(handles.radiobutton_ChooseSRS,'Value');

Scale__D2 = get(handles.radiobutton_Scale__D2,'Value');
Scale__HD = get(handles.radiobutton_Scale__HD,'Value');
Scale__He = get(handles.radiobutton_Scale__He,'Value');

if     ChooseMKS
       data = mks_data;
elseif ChooseSRS
       data = srs_data;
end

t1min = str2double(get(handles.edit_time1min,'String'));
t1max = str2double(get(handles.edit_time1max,'String'));
indx1 = find(data.dtList > t1min & data.dtList < t1max);

t2min = str2double(get(handles.edit_time2min,'String'));
t2max = str2double(get(handles.edit_time2max,'String'));
indx2 = find(data.dtList > t2min & data.dtList < t2max);

indx = [indx1;indx2];

da.dtList = data.dtList(indx);
da.m2Pres = data.m2Pres(indx);
da.m3Pres = data.m3Pres(indx);
da.m4Pres = data.m4Pres(indx);
da.m_Pres = data.m_Pres(indx);

if     get(handles.radiobutton_Scale__HD,'Value')
       plot_Log10_time(da,'HD',axBck);
elseif get(handles.radiobutton_Scale__D2,'Value')
       plot_Log10_time(da,'D2',axBck);
elseif get(handles.radiobutton_Scale__He,'Value')
       plot_Log10_time(da,'He',axBck);
end

set(handles.pushbutton_PerformFit,'enable','on');

function pushbutton_PerformFit_Callback(hObject, eventdata, handles)
global axBck
global axFnl
global mks_data
global srs_data

ChooseMKS = get(handles.radiobutton_ChooseMKS,'Value');
ChooseSRS = get(handles.radiobutton_ChooseSRS,'Value');

Scale__D2 = get(handles.radiobutton_Scale__D2,'Value');
Scale__HD = get(handles.radiobutton_Scale__HD,'Value');
Scale__He = get(handles.radiobutton_Scale__He,'Value');

if     ChooseMKS
       data= mks_data;
elseif ChooseSRS
       data= srs_data;
end

t1min = str2double(get(handles.edit_time1min,'String'));
t1max = str2double(get(handles.edit_time1max,'String'));
indx1 = find(data.dtList >= t1min & data.dtList <= t1max);

t2min = str2double(get(handles.edit_time2min,'String'));
t2max = str2double(get(handles.edit_time2max,'String'));
indx2 = find(data.dtList >= t2min & data.dtList <= t2max);

indx = [indx1;indx2];

xL = 'time [s]';
yL = 'Log_{10}(Partial Pressure) [ T ]';
tHD = 'H2 scaled to HD';
tD2 = 'H2 scaled to D2';
tHe = 'H2 scaled to He';
m3  = 'b*-';
m4  = 'k*-';
m_  = 'g*-';

if     ChooseMKS && Scale__HD
            pOrder1  = str2double(get(handles.edit_mks_HD_p1,'String'));
            pOrder2  = str2double(get(handles.edit_mks_HD_p2,'String'));
            mks_data.m3Back = scale_back_2(data.m2Pres,data.m3Pres,data.m3Wght,indx,pOrder1,pOrder2,axBck);
            mks_data.m3Back = max(mks_data.m3Back,str2double(get(handles.edit_mksPresZ,'String')));
            plot_xx_yy_2(data.dtList,mks_data.m3Back,data.m3Pres,tHD,xL,yL,m3,axFnl,1)
elseif ChooseMKS && Scale__D2
            pOrder1  = str2double(get(handles.edit_mks_D2_p1,'String'));
            pOrder2  = str2double(get(handles.edit_mks_D2_p2,'String'));
            mks_data.m4Back = scale_back_2(data.m2Pres,data.m4Pres,data.m4Wght,indx,pOrder1,pOrder2,axBck);
            mks_data.m4Back = max(mks_data.m4Back,str2double(get(handles.edit_mksPresZ,'String')));
            plot_xx_yy_2(data.dtList,mks_data.m4Back,data.m4Pres,tD2,xL,yL,m4,axFnl,1)
elseif ChooseMKS && Scale__He
            pOrder1  = str2double(get(handles.edit_mks_He_p1,'String'));
            pOrder2  = str2double(get(handles.edit_mks_He_p2,'String'));
            mks_data.m_Back = scale_back_2(data.m2Pres,data.m_Pres,data.m_Wght,indx,pOrder1,pOrder2,axBck);
            mks_data.m_Back = max(mks_data.m_Back,str2double(get(handles.edit_mksPresZ,'String')));
            plot_xx_yy_2(data.dtList,mks_data.m_Back,data.m_Pres,tHe,xL,yL,m_,axFnl,1)
elseif ChooseSRS && Scale__HD
            pOrder1  = str2double(get(handles.edit_srs_HD_p1,'String'));
            pOrder2  = str2double(get(handles.edit_srs_HD_p2,'String'));
            srs_data.m3Back = scale_back_2(data.m2Pres,data.m3Pres,data.m3Wght,indx,pOrder1,pOrder2,axBck);
            srs_data.m3Back = max(srs_data.m3Back,str2double(get(handles.edit_srsPresZ,'String')));
            plot_xx_yy_2(data.dtList,srs_data.m3Back,data.m3Pres,tHD,xL,yL,m3,axFnl,1)
elseif ChooseSRS && Scale__D2
            pOrder1  = str2double(get(handles.edit_srs_D2_p1,'String'));
            pOrder2  = str2double(get(handles.edit_srs_D2_p2,'String'));
            srs_data.m4Back = scale_back_2(data.m2Pres,data.m4Pres,data.m4Wght,indx,pOrder1,pOrder2,axBck);
            srs_data.m4Back = max(srs_data.m4Back,str2double(get(handles.edit_srsPresZ,'String')));
            plot_xx_yy_2(data.dtList,srs_data.m4Back,data.m4Pres,tD2,xL,yL,m4,axFnl,1)
elseif ChooseSRS && Scale__He
            pOrder1  = str2double(get(handles.edit_srs_He_p1,'String'));
            pOrder2  = str2double(get(handles.edit_srs_He_p2,'String'));
            srs_data.m_Back = scale_back_2(data.m2Pres,data.m_Pres,data.m_Wght,indx,pOrder1,pOrder2,axBck);
            srs_data.m_Back = max(srs_data.m_Back,str2double(get(handles.edit_srsPresZ,'String')));
            plot_xx_yy_2(data.dtList,srs_data.m_Back,data.m4Pres,tHe,xL,yL,m_,axFnl,1)
end

set(handles.pushbutton_FluxTime,'enable','on');
set(handles.pushbutton_FluxTemp,'enable','on');

function    checkbox_D2fluxMKS_Callback(hObject, eventdata, handles)

function    checkbox_HDfluxMKS_Callback(hObject, eventdata, handles)

function    checkbox_HefluxMKS_Callback(hObject, eventdata, handles)

function    checkbox_D2fluxSRS_Callback(hObject, eventdata, handles)

function    checkbox_HDfluxSRS_Callback(hObject, eventdata, handles)

function    checkbox_HefluxSRS_Callback(hObject, eventdata, handles)


% E Background ============================================================

function         edit_mks_D2_p1_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_mks_D2_p1,'String'));
if val > 5 || val < 0
    set(handles.edit_mks_D2_p1,'String',num2str(1,'%2d'));  
end

function         edit_mks_D2_p2_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_mks_D2_p2,'String'));
if val > 5 || val < 0
    set(handles.edit_mks_D2_p2,'String',num2str(1,'%2d'));  
end

function         edit_mks_HD_p1_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_mks_HD_p1,'String'));
if val > 5 || val < 0
    set(handles.edit_mks_HD_p1,'String',num2str(1,'%2d'));  
end

function         edit_mks_HD_p2_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_mks_HD_p2,'String'));
if val > 5 || val < 0
    set(handles.edit_mks_HD_p2,'String',num2str(1,'%2d'));  
end

function         edit_mks_He_p1_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_mks_He_p1,'String'));
if val > 5 || val < 0
    set(handles.edit_mks_He_p1,'String',num2str(1,'%2d'));  
end

function         edit_mks_He_p2_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_mks_He_p2,'String'));
if val > 5 || val < 0
    set(handles.edit_mks_He_p2,'String',num2str(1,'%2d'));  
end



function         edit_srs_D2_p1_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_srs_D2_p1,'String'));
if val > 5 || val < 0
    set(handles.edit_srs_D2_p1,'String',num2str(1,'%2d'));  
end

function         edit_srs_D2_p2_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_srs_D2_p2,'String'));
if val > 5 || val < 0
    set(handles.edit_srs_D2_p2,'String',num2str(1,'%2d'));  
end

function         edit_srs_HD_p1_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_srs_HD_p1,'String'));
if val > 5 || val < 0
    set(handles.edit_srs_HD_p1,'String',num2str(1,'%2d'));  
end

function         edit_srs_HD_p2_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_srs_HD_p2,'String'));
if val > 5 || val < 0
    set(handles.edit_srs_HD_p2,'String',num2str(1,'%2d'));  
end

function         edit_srs_He_p1_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_srs_He_p1,'String'));
if val > 5 || val < 0
    set(handles.edit_srs_He_p1,'String',num2str(1,'%2d'));  
end

function         edit_srs_He_p2_Callback(hObject, eventdata, handles)
val = str2double(get(handles.edit_srs_He_p2,'String'));
if val > 5 || val < 0
    set(handles.edit_srs_He_p2,'String',num2str(1,'%2d'));  
end


% F Final Fit =============================================================

function          edit_D2_mult_Callback(hObject, eventdata, handles)

function          edit_HD_mult_Callback(hObject, eventdata, handles)

function   pushbutton_TempTime_Callback(hObject, eventdata, handles)
global axFnl
global mks_data

data = mks_data;

T_min = str2double(get(handles.edit_Temp_min,'String'));
T_max = str2double(get(handles.edit_Temp_max,'String'));

Tspan_ = 20.0;

jBgn = find(data.temptr>(T_min-Tspan_) & data.temptr<(T_min+Tspan_),1,'first');
jEnd = find(data.temptr>(T_max-Tspan_) & data.temptr<(T_max+Tspan_),1,'first');
jSpan = jBgn:jEnd;

[RampRate,yTemp] = fit_TempTime(data.dtList(jSpan),data.temptr(jSpan));

axes(axFnl)
plot(data.dtList, data.temptr,'ok',...
     data.dtList(jSpan),yTemp,'-r',...
     'LineWidth',2.0);
xlabel('time [s]')
ylabel('Temperature [K]')
grid on

set(handles.edit_RampRate,'String',num2str(RampRate,'%4.3f'));

function         edit_RampRate_Callback(hObject, eventdata, handles)

function   pushbutton_FluxTime_Callback(hObject, eventdata, handles)
global axFnl
global mks_data
global srs_data

ChooseMKS = get(handles.radiobutton_ChooseMKS,'Value');
ChooseSRS = get(handles.radiobutton_ChooseSRS,'Value');

Scale__D2 = get(handles.radiobutton_Scale__D2,'Value');
Scale__HD = get(handles.radiobutton_Scale__HD,'Value');
Scale__He = get(handles.radiobutton_Scale__He,'Value');

if     ChooseMKS == 1
       data  = mks_data;
       data.D2presC = str2double(get(handles.edit_mksD2PresC,'String'));
       data.HepresC = str2double(get(handles.edit_mksHePresC,'String'));
       data.presZ = str2double(get(handles.edit_mksPresZ,'String'));
elseif ChooseSRS == 1
       data = srs_data;
       data.D2presC = str2double(get(handles.edit_srsD2PresC,'String'));
       data.HepresC = str2double(get(handles.edit_srsHePresC,'String'));
       data.presZ = str2double(get(handles.edit_srsPresZ,'String'));
end

avog = 6.022e23;

data.D2leak  = str2double(get(handles.edit_D2LeakRate,'String'));
data.Heleak  = str2double(get(handles.edit_HeLeakRate,'String'));
data.area    = str2double(get(handles.edit_SampleArea,'String'));
data.cal_D2  = avog*data.D2leak/((data.D2presC-data.presZ)*data.area);
data.cal_He  = avog*data.D2leak/((data.HepresC-data.presZ)*data.area);

xL  = 'Time [s]';
yL  = 'Flux [ions/m^2/s]';
tHD = 'HD Flux';
tD2 = 'D2 Flux';
tHe = 'He Flux';

if     ChooseMKS && Scale__HD      
            set(handles.checkbox_HDfluxMKS,'Value',1);  
            data.HDflux = (data.m3Pres-data.m3Back)*data.cal_D2;
            yy = data.HDflux;
            tL = tHD;
elseif ChooseMKS && Scale__D2            
            set(handles.checkbox_D2fluxMKS,'Value',1);
            data.D2flux = (data.m4Pres-data.m4Back)*data.cal_D2;
            yy = data.D2flux;
            tL = tD2;
elseif ChooseMKS && Scale__He            
            set(handles.checkbox_HefluxMKS,'Value',1);
            data.Heflux = (data.m_Pres-data.m_Back)*data.cal_He;
            yy = data.Heflux;
            tL = tHe;            
elseif ChooseSRS && Scale__HD
            set(handles.checkbox_HDfluxSRS,'Value',1);
            data.HDflux = (data.m3Pres-data.m3Back)*data.cal_D2;
            yy = data.HDflux;
            tL = tHD;
elseif ChooseSRS && Scale__D2
            set(handles.checkbox_D2fluxSRS,'Value',1);
            data.D2flux = (data.m4Pres-data.m4Back)*data.cal_D2;
            yy = data.D2flux;
            tL = tD2;
elseif ChooseSRS && Scale__He
            set(handles.checkbox_HefluxSRS,'Value',1);
            data.Heflux = (data.m_Pres-data.m_Back)*data.cal_He;
            yy = data.Heflux;
            tL = tHe;            
end

LogPlot = get(handles.radiobutton__Log__Plot,'Value');
plot_xx_yy_1(data.dtList,yy,tL,xL,yL,axFnl,LogPlot);


function         edit_Temp_min_Callback(hObject, eventdata, handles)
global mks_data

Temp_min = str2double(get(handles.edit_Temp_min,'String'));
Temp_min = max(Temp_min,min(mks_data.temptr)+5);
set(handles.edit_Temp_min,'String',num2str(Temp_min,'%5.2f'));

function         edit_Temp_max_Callback(hObject, eventdata, handles)
global mks_data

Temp_max = str2double(get(handles.edit_Temp_max,'String'));
Temp_max = min(Temp_max,max(mks_data.temptr)-5);
set(handles.edit_Temp_max,'String',num2str(Temp_max,'%5.2f'));  

function   pushbutton_FluxTemp_Callback(hObject, eventdata, handles)
global axFnl
global mks_data
global srs_data

ChooseMKS = get(handles.radiobutton_ChooseMKS,'Value');
ChooseSRS = get(handles.radiobutton_ChooseSRS,'Value');

Scale__D2 = get(handles.radiobutton_Scale__D2,'Value');
Scale__HD = get(handles.radiobutton_Scale__HD,'Value');
Scale__He = get(handles.radiobutton_Scale__He,'Value');

if     ChooseMKS == 1
       data  = mks_data;
       data.D2presC = str2double(get(handles.edit_mksD2PresC,'String'));
       data.HepresC = str2double(get(handles.edit_mksHePresC,'String'));
       data.presZ = str2double(get(handles.edit_mksPresZ,'String'));
elseif ChooseSRS == 1
       data = srs_data;
       data.D2presC = str2double(get(handles.edit_srsD2PresC,'String'));
       data.HepresC = str2double(get(handles.edit_srsHePresC,'String'));
       data.presZ = str2double(get(handles.edit_srsPresZ,'String'));
end

avog = 6.022e23;

data.D2leak = str2double(get(handles.edit_D2LeakRate,'String'));
data.Heleak = str2double(get(handles.edit_HeLeakRate,'String'));
data.area   = str2double(get(handles.edit_SampleArea,'String'));
data.cal_D2 = avog*data.D2leak/((data.D2presC-data.presZ)*data.area);
data.cal_He = avog*data.D2leak/((data.HepresC-data.presZ)*data.area);

T_min = str2double(get(handles.edit_Temp_min,'String'));
T_max = str2double(get(handles.edit_Temp_max,'String'));

jBgn  = find(data.temptr>(T_min-7.5) & data.temptr<(T_min+7.5),1,'first');
jEnd  = find(data.temptr>(T_max-7.5) & data.temptr<(T_max+7.5),1,'first');
jSpan = jBgn:jEnd;

[RampRate,~] = fit_TempTime(data.dtList(jSpan),data.temptr(jSpan));
set(handles.edit_RampRate,'String',num2str(RampRate,'%4.3f'));

xL  = 'Temp [K]';
yL  = 'Flux [ions/m^2/s]';
tHD = 'HD Flux';
tD2 = 'D2 Flux';
tHe = 'He Flux';

if     ChooseMKS && Scale__HD      
            set(handles.checkbox_HDfluxMKS,'Value',1);  
            data.HDflux = (data.m3Pres-data.m3Back)*data.cal_D2;
            yy = data.HDflux;
            tL = tHD;
elseif ChooseMKS && Scale__D2            
            set(handles.checkbox_D2fluxMKS,'Value',1);
            data.D2flux = (data.m4Pres-data.m4Back)*data.cal_D2;
            yy = data.D2flux;
            tL = tD2;
elseif ChooseMKS && Scale__He            
            set(handles.checkbox_HefluxMKS,'Value',1);
            data.Heflux = (data.m_Pres-data.m_Back)*data.cal_He;
            nanSpan = ~isnan(data.Heflux(jSpan));
            data.Hereten = trapz(data.dtList(jSpan(nanSpan)),data.Heflux(jSpan(nanSpan)));
            yy = data.Heflux;
            tHe= [tHe '(' num2str(data.Hereten,'%5.2e')  ')'];
            tL = tHe;
elseif ChooseSRS && Scale__HD
            set(handles.checkbox_HDfluxSRS,'Value',1);
            data.HDflux = (data.m3Pres-data.m3Back)*data.cal_D2;
            yy = data.HDflux;
            tL = tHD;
elseif ChooseSRS && Scale__D2
            set(handles.checkbox_D2fluxSRS,'Value',1);
            data.D2flux = (data.m4Pres-data.m4Back)*data.cal_D2;
            yy = data.D2flux;
            tL = tD2;
elseif ChooseSRS && Scale__He
            set(handles.checkbox_HefluxSRS,'Value',1);
            data.Heflux = (data.m_Pres-data.m_Back)*data.cal_He;
            nanSpan = ~isnan(data.Heflux(jSpan));
            data.Hereten = trapz(data.dtList(jSpan(nanSpan)),data.Heflux(jSpan(nanSpan)));
            yy = data.Heflux;
            tHe= [tHe '(' num2str(data.Hereten,'%5.2e')  ')'];
            tL = tHe;
end

LogPlot = get(handles.radiobutton__Log__Plot,'Value');
plot_xx_yy_1(data.temptr(jSpan),yy(jSpan),tL,xL,yL,axFnl,LogPlot);

D2fluxMKS = get(handles.checkbox_D2fluxMKS,'Value');
HDfluxMKS = get(handles.checkbox_HDfluxMKS,'Value');
D2fluxSRS = get(handles.checkbox_D2fluxSRS,'Value');
HDfluxSRS = get(handles.checkbox_HDfluxSRS,'Value');

% Check that the chosen QMS has both D2 and HD stored
if  D2fluxMKS && HDfluxMKS && ChooseMKS
         set(handles.pushbutton_Tot_D_flx,'enable','on');
end
if  D2fluxSRS && HDfluxSRS && ChooseSRS
         set(handles.pushbutton_Tot_D_flx,'enable','on');
end

if     ChooseMKS
       mks_data = data;
elseif ChooseSRS
       srs_data = data;
end
       
function  pushbutton_Tot_D_flx_Callback(hObject, eventdata, handles)
global axFnl
global mks_data
global srs_data

ChooseMKS = get(handles.radiobutton_ChooseMKS,'Value');
ChooseSRS = get(handles.radiobutton_ChooseSRS,'Value');

if     ChooseMKS
       data = mks_data;
elseif ChooseSRS
       data = srs_data;
end


data.D2mult  = str2double(get(handles.edit_D2_mult,'String'));
data.HDmult  = str2double(get(handles.edit_HD_mult,'String'));

% multiply by correct factor and remove values below 0
% data.D_flux = max(0,data.HDflux*data.HDmult) + max(0,data.D2flux*data.D2mult);
data.D_flux = data.HDflux*data.HDmult + data.D2flux*data.D2mult;

T_min = str2double(get(handles.edit_Temp_min,'String'));
T_max = str2double(get(handles.edit_Temp_max,'String'));

jBgn = find(data.temptr>(T_min-7.5) & data.temptr<(T_min+7.5),1,'first');
jEnd = find(data.temptr>(T_max-7.5) & data.temptr<(T_max+7.5),1,'first');
jSpan = jBgn:jEnd;

[RampRate,~] = fit_TempTime(data.dtList(jSpan),data.temptr(jSpan));
set(handles.edit_RampRate,'String',num2str(RampRate,'%4.3f'));

data.jSpan  = jSpan;
% data.Dreten = sum(data.D_flux(jSpan).*(data.dtList(jSpan)-data.dtList(jSpan-1)));
nanSpan = ~isnan(data.D_flux(jSpan));
data.Dreten = trapz(data.dtList(jSpan(nanSpan)),data.D_flux(jSpan(nanSpan)));

xL  = 'Temp [K]';
yL  = 'Flux [ions/m^2/s]';
tL = ['Total D Retention = ' num2str(data.Dreten,'%9.3e') ' [D/m^2]'];

LogPlot = get(handles.radiobutton__Log__Plot,'Value');
xx_  = data.temptr(jSpan);
yy1_ = data.D_flux(jSpan);
yy2_ = data.HDflux(jSpan)*data.HDmult;
yy3_ = data.D2flux(jSpan)*data.D2mult;

plot_xx_yy_3(xx_,yy1_,yy2_,yy3_,tL,xL,yL,axFnl,LogPlot);


if     ChooseMKS
       mks_data = data;
       set(handles.pushbutton_WkspcMKS,'enable','on');
       set(handles.pushbutton_TxtF_MKS,'enable','on');
       set(handles.edit_mks_Dtot,'String',num2str(data.Dreten,'%6.3e'))
elseif ChooseSRS
       srs_data = data;
       set(handles.pushbutton_WkspcSRS,'enable','on');
       set(handles.pushbutton_TxtF_SRS,'enable','on');
       set(handles.edit_srs_Dtot,'String',num2str(data.Dreten,'%6.3e'))
end

function         edit_time_min_Callback(hObject, eventdata, handles)
global mks_data
global srs_data

function         edit_time_max_Callback(hObject, eventdata, handles)
global mks_data
global srs_data

function         edit_mks_Dtot_Callback(hObject, eventdata, handles)

function         edit_srs_Dtot_Callback(hObject, eventdata, handles)


% G Store =================================================================

function         edit_Var__MKS_Callback(hObject, eventdata, handles)
variableMKS = get(handles.edit_Var__MKS,'String');

function         edit_Var__SRS_Callback(hObject, eventdata, handles)
variableSRS = get(handles.edit_Var__SRS,'String');

function   pushbutton_WkspcMKS_Callback(hObject, eventdata, handles)
global mks_data

Var__MKS = get(handles.edit_Var__MKS,'String');
assignin('base',Var__MKS,mks_data);

function   pushbutton_WkspcSRS_Callback(hObject, eventdata, handles)
global srs_data

Var__SRS = get(handles.edit_Var__SRS,'String');
assignin('base',Var__SRS,srs_data);

function   pushbutton_TxtF_MKS_Callback(hObject, eventdata, handles)
global mks_data

data  = mks_data;
jSpan = data.jSpan;

Header1 = ['Temperatures Spanned = ' num2str(data.temptr(min(data.jSpan)),'%7.3f')...
                              ' to ' num2str(data.temptr(max(data.jSpan)),'%7.3f') ' [K]'];
Header2 = ['D  Retention = ' num2str(data.Dreten, '%8.4e') ' [ D/m^2]' ...
           ' where D = ' num2str(data.D2mult,'%2g') ' x D2 + ' num2str(data.HDmult,'%2g') ' x HD'];
Header3 = ['He Retention = ' num2str(data.Hereten,'%8.4e') ' [He/m^2]' ];

Header4 = 'Time[s]     Temp[K]     [D/m^2/s]   [HD/m^2/s]  [D2/m^2/s]  [He/m^2/s]';
Values  = [data.dtList(jSpan),data.temptr(jSpan),data.D_flux(jSpan),...
           data.HDflux(jSpan),data.D2flux(jSpan),data.Heflux(jSpan)];

Var__MKS = get(handles.edit_Var__MKS,'String');
fileName = [Var__MKS '.txt'];

fid = fopen(fileName,'wt');
fprintf(fid,[Header1 '\n']);
fprintf(fid,[Header2 '\n']);
fprintf(fid,[Header3 '\n']);
fprintf(fid,[Header4 '\n']);
fclose(fid);
dlmwrite(fileName,Values, '-append','delimiter','\t','precision','%8.4e');

function   pushbutton_TxtF_SRS_Callback(hObject, eventdata, handles)
global srs_data

data  = srs_data;
jSpan = data.jSpan;

Header1 = ['Temperatures Spanned = ' num2str(data.temptr(min(data.jSpan)),'%7.3f')...
                              ' to ' num2str(data.temptr(max(data.jSpan)),'%7.3f') ' [K]'];
Header2 = ['D  Retention = ' num2str(data.Dreten, '%8.4e') ' [ D/m^2]' ...
           ' where D = ' num2str(data.D2mult,'%2g') ' x D2 + ' num2str(data.HDmult,'%2g') ' x HD'];
Header3 = ['He Retention = ' num2str(data.Hereten,'%8.4e') ' [He/m^2]' ];

Header4 = 'Time[s]     Temp[K]     [D/m^2/s]   [HD/m^2/s]  [D2/m^2/s]  [He/m^2/s]';
Values  = [data.dtList(jSpan),data.temptr(jSpan),data.D_flux(jSpan),...
           data.HDflux(jSpan),data.D2flux(jSpan),data.Heflux(jSpan)];

Var__SRS = get(handles.edit_Var__SRS,'String');
fileName = [Var__SRS '.txt'];

fid = fopen(fileName,'wt');
fprintf(fid,[Header1 '\n']);
fprintf(fid,[Header2 '\n']);
fprintf(fid,[Header3 '\n']);
fprintf(fid,[Header4 '\n']);
fclose(fid);
dlmwrite(fileName,Values, '-append','delimiter','\t','precision','%8.4e');



%% ========================= END GUI Functions ============================ 





%% ========================================================================
%  ========================= Data Manipulation ============================
%  ========================================================================

function [ mks ] = read_MKS_data_A(fileName)
%% UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%%

%% Initialize variables.
% fileName = 'C:\Users\Michael\Desktop\GetTDS\WdimeC13_mks.txt';
delimiter = '\t';
% formatSpec = '%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
% formatSpec = '%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(fileName,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.

Header1 = fgets(fileID);
Header1 = fgets(fileID);
Header1 = fgets(fileID);
Header1 = strsplit(Header1,'"\t"');
hLength = length(Header1);
formatSpec = '%s';
for jj = 2:hLength
    formatSpec = [formatSpec '%f'];
end
formatSpec = [formatSpec '%[^\n\r]'];

dataArray = textscan(fileID, formatSpec,...
                     'Delimiter', delimiter,...
                     'TreatAsEmpty','Skipped',...
                     'EmptyValue' ,NaN,...
                     'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% 
mLength = length(dataArray)-4;      
masses1 = Header1(3:mLength+2);
mks.massNumb = zeros(mLength,1);
for ii = 1:mLength
    mks.massNumb(ii) = str2double(masses1{ii}(6:end));
end

dateTime = dataArray{:, 1};
dateTime = datenum(dateTime);
mks.dateTime = (dateTime - dateTime(1))*86400;  % 24*60*60 = 86400 seconds/day
mks.scanNumb = dataArray{:, 2};
mks.partPres = cell2mat(dataArray(:,3:mLength+2));
mks.temper_K = dataArray{:,end-1}+273.15;       % Ignore last column (MKS saves a blank column)

function [ mks ] = read_MKS_data_B(fileName)
%% UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%%

%% Initialize variables.
% fileName = 'C:\Users\Michael\Desktop\GetTDS\WdimeC13_mks.txt';
delimiter = '\t';
% formatSpec = '%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
% formatSpec = '%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(fileName,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.

Header1 = fgets(fileID);
Header1 = fgets(fileID);
Header1 = fgets(fileID);
Header1 = strsplit(Header1,'"\t"');
hLength = length(Header1);
formatSpec = '%s';
for jj = 2:hLength
    formatSpec = [formatSpec '%f'];
end
formatSpec = [formatSpec '%[^\n\r]'];

dataArray = textscan(fileID, formatSpec,...
                     'Delimiter', delimiter,...
                     'TreatAsEmpty','Skipped',...
                     'EmptyValue' ,NaN,...
                     'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% 
% mLength = length(dataArray)-4;      
% masses1 = Header1(3:mLength+1);     % was mLength+2
mks.massNumb = zeros(length(Header1),1);
for ii = 1:length(Header1)
   if strcmp(Header1{1,ii}(1:4),'Mass')
      mks.massNumb(ii) = str2double(Header1{1,ii}(6:end));
   elseif strcmp(Header1{1,ii},'Temperature 1')
       iTemp1 = ii;
       iTemp2 = ii+1;
%    elseif strcmp(Header1{1,ii},'Temperature 2"	')            % Not sure why there is a quote on end...
%        iTemp2 = ii;
   end       
end

iNumb = find(mks.massNumb);
mks.massNumb = mks.massNumb(iNumb);

% for ii = 1:mLength
%     mks.massNumb(ii) = str2double(masses1{ii}(6:end));
% end

dateTime = dataArray{:, 1};
dateTime = datenum(dateTime);
mks.dateTime = (dateTime - dateTime(1))*86400;  % 24*60*60 = 86400 seconds/day
mks.scanNumb = dataArray{:, 2};
mks.partPres = cell2mat(dataArray(:,iNumb));


temperature1 = dataArray{:,iTemp1}+273.15;
temperature2 = dataArray{:,iTemp2}+273.15;

% if max(temperature1) > max(temperature2)
%     mks.temper_K = temperature1;
% else
%     mks.temper_K = temperature2;
% end

mks.temper_K = temperature1;  %Adhoc fix (plug is disconnected fro temperature2)

function [ srs ] = read_SRS_data(folderName)
%% read_SRS_data
%   Extract SRS data and store in SRS structure
%%

%%
fileList = dir([folderName '*.txt']);
fileList = {fileList.name};
nFiles = length(fileList);

srs = read_SRS_file([folderName char(fileList(1))]);
mLength = length(srs.massNumb);
srs.partPres = zeros(nFiles,mLength);
srs.dateTime = zeros(nFiles,1);

for ii = 1:nFiles
    dataA = read_SRS_file([folderName char(fileList(ii))]);
    srs.partPres(ii,:) =  dataA.partPres(:);
    srs.dateTime(ii)   =  dataA.dateTime;
end

[srs.dateTime,jj] = sort(srs.dateTime);
 srs.dateTime = (srs.dateTime - srs.dateTime(1))*86400;  % 24*60*60 = 86400 seconds/day
 srs.partPres = srs.partPres(jj,:);

function [ SRS ] = read_SRS_file(fileName)
%% read_SRS_file
%   Extract SRS data and store in SRS structure

%%
startRow = 19;
delimiter = ',';
formatSpec = '%f%f%*s%[^\n\r]';

%% Open the text file.
fileID = fopen(fileName,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dateTime = fgets(fileID);
SRS.dateTime = datenum(dateTime);
textscan(fileID, '%[^\n\r]', startRow-2, 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Allocate imported array to column variable names
SRS.massNumb = dataArray{:, 1};
SRS.partPres = dataArray{:, 2};

function [p1,p2,p3] = scale_back(xx,yy,ww,ind,pOrder,axPlot)
% xx is H2
% yy is HD or D2

xx = xx(ind);
yy = yy(ind);
% ww = 1./ww(ind);

xMax = max(xx); 
xx   = xx/xMax; 

[xData, yData] = prepareCurveData( xx, yy );

% Set up fittype and options.
if     pOrder == 1
        ft = fittype( 'poly1' );
elseif pOrder == 2
        ft = fittype( 'poly2' );
end
opts = fitoptions( 'Method', 'LinearLeastSquares');
opts.Robust = 'Bisquare';
% opts.Weights = ww.*ww;

% Fit model to data.
[fitScale, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
xLb = 'H2 Partial Pressure [ T ]';
yLb = 'Partial Pressure [T]';
tLb = ['r^2 = ' num2str(gof.rsquare,'%4.3f') ...
       ' : r^2_{adj} = ' num2str(gof.adjrsquare,'%4.3f')];

plot_xx_yy_2(xData*xMax,yData,fitScale(xData),tLb,xLb,yLb,'k*',axPlot,0)
   
if     pOrder == 1
        p1 = 0;
        p2 = fitScale.p1/xMax;
        p3 = fitScale.p2;
elseif pOrder == 2
        p1 = fitScale.p1/xMax/xMax;
        p2 = fitScale.p2/xMax;
        p3 = fitScale.p3;
end

function [backGrnd] = scale_back_2(xx,yy,ww,ind,pOrder1,pOrder2,axPlot)
% xx is H2
% yy is HD or D2

xData = xx(ind);
yData = yy(ind);
% ww = 1./ww(ind);

[~,iEnd] = max(ind(2:end)-ind(1:end-1));

indxnan = isnan(xData);
indynan = isnan(yData);
ind_nan = indxnan+indynan;
ind = ind(~ind_nan);
xData = xx(ind);
yData = yy(ind);

xMax = max(xData); 
xData   = xData/xMax; 

[xData, yData] = prepareCurveData( xData, yData );


opts = fitoptions( 'Method', 'LinearLeastSquares');
opts.Robust = 'Bisquare';
opts1 = opts;
opts2 = opts;
if pOrder1 == 0
    pOrder1 = 1;
    opts1.Lower = [0 -1e5];
    opts1.Upper = [0  1e5];
end
if pOrder2 == 0
    pOrder2 = 1;
    opts2.Lower = [0 -1e5];
    opts2.Upper = [0  1e5];
end
ft1 = fittype( ['poly' num2str(pOrder1,'%1d')] );
ft2 = fittype( ['poly' num2str(pOrder2,'%1d')] );
% opts.Weights = ww.*ww;

% Fit model to data.
[fitScale1, gof1] = fit( xData(1:iEnd),     yData(1:iEnd),     ft1, opts);
[fitScale2, gof2] = fit( xData(iEnd+1:end), yData(iEnd+1:end), ft2, opts);

xData = xData*xMax;

% timeFun = @(A_p,x) (1-A_p*ind(x)/ind(end))*(fit_1.p2*a1+fit_1.p3)+A_p*ind(x)/ind(end)*(fit_2.p2*a2+fit_2.p3);
% timeFun = @(A_p,x) (1-A_p(1)*ind/ind(end)).*(fit_1.p2*a1+fit_1.p3)+A_p(2)*ind/ind(end).*(fit_2.p2*a2+fit_2.p3);
% timeFun = @(A_p,x) (1-A_p(1)*ind/ind(end)).*fitScale1(a1/xMax)+A_p(1)*ind/ind(end).*fitScale2(a2/xMax);
timeFun = @(A_p,x) (1-A_p(1)*ind/ind(end)).*fitScale1(xData/xMax)+A_p(1)*ind/ind(end).*fitScale2(xData/xMax);

x0 = [0.9];
lb = [0.0];
ub = [1.0001];

fitOptions = optimoptions('lsqcurvefit',...
                          'TolFun',       1e-18,...
                          'TolX',         1e-18,...
                          'MaxFunEvals',  1e8,...
                          'MaxIter',      1e8,...
                          'DiffMaxChange',1e1,...
                          'Display','off');

[FitA_p,resNorm] = lsqcurvefit(timeFun,x0,ind,yData,...
                                lb,ub,fitOptions);

% Plot fit with data.
xLb = 'H2 Partial Pressure [ T ]';
yLb = 'Partial Pressure [T]';
tLb = [ 'r_1^2 = ' num2str(gof1.rsquare,'%4.3f') ...
       ' : r_2^2 = ' num2str(gof2.rsquare,'%4.3f') ...
       ' : resnorm = ' num2str(resNorm,'%4.3e')];
   
ind2 = 1:length(xx);
timeFun2 = @(A_p,x) (1-A_p(1)*ind2'/ind2(end)).*fitScale1(xx/xMax)+A_p(1)*ind2'/ind2(end).*fitScale2(xx/xMax);

backGrnd = timeFun2(FitA_p,0);

% backGrnd = max(backGrnd,0);

axes(axPlot)

yMax = max([max(yData) max(timeFun(FitA_p,0))]);
n10y = floor(log10(yMax));
n10x = floor(log10(max(xData)));

plot(xData*10^(-n10x),                yData*10^(-n10y),'ko',...
     xData*10^(-n10x),fitScale1(xData/xMax)*10^(-n10y),'g.',...
     xData*10^(-n10x),fitScale2(xData/xMax)*10^(-n10y),'c.',...
     xData*10^(-n10x),    timeFun(FitA_p,0)*10^(-n10y),'rx',...
     'MarkerSize',10)
 
xlim([min(xData) max(xData)]*10^(-n10x))
title( tLb)
xlabel([xLb ' \times 10^{' num2str(n10x,'%3d')  '}'])
ylabel([yLb ' \times 10^{' num2str(n10y,'%3d')  '}'])
box on
grid on

function [ramp, yFit] = fit_TempTime(xx,yy)

xMax = max(xx); 
xx   = xx/xMax; 

[xData, yData] = prepareCurveData( xx, yy );

ft = fittype( 'poly1' );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Robust = 'Bisquare';

% Fit model to data.
[fitTemp, ~] = fit( xData, yData, ft, opts );

ramp = fitTemp.p1/xMax;
yFit = fitTemp(xData);

function [plotPres,peakPres,wghtPres] = fit_quad_to_mass(pPrs,massShifted,f_idx,min1)

%% Define fitting parameters
minPres = 1e-9;   % Arbitrary threshold to not need to take the mean of the partial pressure

pPrsMax  =  max(pPrs);
fitQ =  polyfit(massShifted,pPrs/pPrsMax,2);
plotPres =  polyval(fitQ,massShifted)*pPrsMax;
peakPres=  max(polyval(fitQ,massShifted))*pPrsMax;
wghtPres =  std(plotPres-pPrs)/peakPres;   
   
maxMassVal = -fitQ(2)/(2*fitQ(1));      % find the mass value corresponding to peak of fitQ
% If concave up or if the peak mass value is outside of mass range then use mean pressure value
if fitQ(1) >= 0  
    peakPres =  mean(pPrs);
    wghtPres =  std(pPrs-peakPres)/peakPres;
    plotPres =  ones(length(f_idx),1)*peakPres;
elseif maxMassVal >= massShifted(end) || maxMassVal <= massShifted(1) && peakPres < minPres
    peakPres =  mean(pPrs);
    wghtPres =  std(pPrs-peakPres)/peakPres;
    plotPres =  ones(length(f_idx),1)*peakPres;
end  

function [ QMS ] =  fit_QMS_Data(fLocation,filter,axPlot,massPk,MKSorSRS,TDS_AorB,CHARorQUAD)
% Determine QMS peak values
%   Grab data for either MKS or SRS
%   Organize and scale data
%   Perform fit with either Quad or Characteristic Shape
%

global killFit

warning('off','all')

plotYorN = 'PlotYes';
% plotYorN = 'PlotNo';

% Pressure bounds
maxPrs0 = 1e-5;
zeroPres = massPk.zeroP_;

% Quad fit paramters
if strcmp(MKSorSRS,'MKS')
    minPres = max([1.0e-18,zeroPres]);
    minWght = 0.999;
elseif strcmp(MKSorSRS,'SRS')
    minPres = max([1.0e-15,zeroPres]);
    minWght = 0.800;
end



% Define Peaks and Ranges for each mass
m2Pk  = massPk.H2peak;
m3Pk  = massPk.HDpeak;
m4Pk  = massPk.D2peak;
m_Pk  = massPk.Hepeak;

delPk = 0.2;                    % delta mass to separate masses near each peak

% Get data for either MKS or SRS
if strcmp(MKSorSRS,'MKS')
    if     strcmp(TDS_AorB,'TDS_A')
        data = read_MKS_data_A(fLocation);
    elseif strcmp(TDS_AorB,'TDS_B')
        data = read_MKS_data_B(fLocation);
    end
elseif strcmp(MKSorSRS,'SRS')
        data = read_SRS_data(fLocation);
end


%% Define TDS storage vector
nLength = length(data.dateTime);

QMS.m2Pres = zeros(nLength,1);               % mass 2 peak pressure
QMS.m3Pres = zeros(nLength,1);
QMS.m4Pres = zeros(nLength,1);
QMS.m_Pres = zeros(nLength,1);
QMS.m2Wght = zeros(nLength,1);               % mass 2 rms error in fit
QMS.m3Wght = zeros(nLength,1);
QMS.m4Wght = zeros(nLength,1);
QMS.m_Wght = zeros(nLength,1);
QMS.dtList = data.dateTime;                  % date/time vector
if strcmp(MKSorSRS,'MKS')
    QMS.temptr = data.temper_K;              % temperature vector
    data.massNumb = data.massNumb/50;        % brings mass to 2,3, and 4
end

data.partPres = max(0,data.partPres');       % remove negative data;


%% Define mass range near each peak
massN = data.massNumb;
delM  = massN(2)-massN(1);

% nn is the number of points that span the peak
if strcmp(MKSorSRS,'MKS')
        nn = 6;                     % flattop span = 2*nn + 1 
elseif strcmp(MKSorSRS,'SRS')
    if delM > 0.5		
        nn = 4;                     % flattop span = 2*nn + 1	
    else
        nn = 3;		
    end
end

nSpan = -nn:nn;

if strcmp(MKSorSRS,'MKS')
    [massN,i0] = sort(massN);       % Ordering according to mass with i0 as the indices
    pPrs = data.partPres(i0,:);     % Reorders the partial press to match the mass order
    mass0 = massN;

    i_2 = find(massN<(2+delPk) & massN>(2-delPk));
    i_3 = find(massN<(3+delPk) & massN>(3-delPk));
    i_4 = find(massN<(4+delPk) & massN>(4-delPk));

    % Stretch mass axis to completely zoom in and expand all masses to range from 1.5 to 4.5
    mass0(i_2) = 1.5 + 1/length(i_2)*(1:length(i_2));   % Span from 1.5 to 2.5
    mass0(i_3) = 2.5 + 1/length(i_3)*(1:length(i_3));   % Span from 2.5 to 3.5
    mass0(i_4) = 3.5 + 1/length(i_4)*(1:length(i_4));   % Span from 3.5 to 4.5
elseif strcmp(MKSorSRS,'SRS')
    % Define zoom values		
    zoomBgn = 0.5;
    zoomEnd = 4.5;
    total_N = floor(max(massN));	
    jBgn = 1 + round(zoomBgn*length(massN)/total_N);		
    jEnd = 1 + round(zoomEnd*length(massN)/total_N);		
    pPrs  = zeros(jEnd-jBgn+1,nLength);		
    mass0 = massN(jBgn:jEnd);		
    m2slope = 2.440;                        % Choose value closest to m2slope
    [~,j2slope] = min(abs(massN-m2slope)); 
    
    mTspan = find(massN > 2.00 & massN < 3.00);	
    % Centers the plot (removes "wiggle")		
    for ii = 1:nLength		
        pPrsT = data.partPres(mTspan,ii);		
        del_T = log10(pPrsT(2:end))-log10(pPrsT(1:end-1));		
        [~,iT]= max(abs(del_T));		
        del_f = j2slope-(mTspan(1)+iT);		
        pPrs(:,ii) = data.partPres(jBgn-del_f:jEnd-del_f,ii);		
%       Adhoc fix to bad data    		
%       del_f = -1;		
%       pPrs(:,ii) = data.partPres(jBgn-del_f:jEnd-del_f,ii);		
    		
%       ii		
%       clf		
%       semilogy(mass0,pPrs(:,ii))		
%       ylim([1e-13,1e-6])		
%       xlim([1.75,3.75])		
%       title(num2str(del_f))		
%       pause(0.04)		
    end
end

[~,f2] = min(abs(mass0-m2Pk));                      % find index that is closest to m2Pk
[~,f3] = min(abs(mass0-m3Pk));
[~,f4] = min(abs(mass0-m4Pk));
[~,f_] = min(abs(mass0-m_Pk));

f2_0 = f2;
f3_0 = f3;
f4_0 = f4;
f__0 = f_;

f2 = f2+nSpan;                                   % Add 2*nn index values around m2Pk
f3 = f3+nSpan;
f_ = f_+nSpan;
f4 = f4+nSpan;

if strcmp(MKSorSRS,'MKS')
    f2 = f2( f2<=i_2(end) & f2>=i_2(1) );       % Cutout index values that do not lie in mass2 window  
    f3 = f3( f3<=i_3(end) & f3>=i_3(1) );
    f_ = f_( f_<=i_4(end) & f_>=i_4(1) );
    f4 = f4( f4<=i_4(end) & f4>=i_4(1) ); 
end

mass2 = mass0(f2);           % mass2 is zoomed in near the peak (may not be 2nn+1 length)
mass3 = mass0(f3);
mass4 = mass0(f4);
mass_ = mass0(f_);


% Use characteristic shape of each peak
if strcmp(CHARorQUAD,'CHAR')
    load('Char_Shape3.mat')     % peaks centered at i_c = 100;
    if strcmp(MKSorSRS,'MKS')
        qms_m2Shape2 = mks_m2Shape2;
        qms_m3Shape2 = mks_m3Shape2;
        qms_m4Shape2 = mks_m4Shape2;
        qms_m_Shape2 = mks_m_Shape2;
        charM2 = mks_charM2;
        charM3 = mks_charM3;
        charM4 = mks_charM4;
        charM_ = mks_charM_;
    elseif strcmp(MKSorSRS,'SRS')
        qms_m2Shape2 = srs_m2Shape2;
        qms_m3Shape2 = srs_m3Shape2;
        qms_m4Shape2 = srs_m4Shape2;
        qms_m_Shape2 = srs_m_Shape2;
        charM2 = srs_charM;    % char shape determined with 25 points per AMU (0.04) 	
        charM3 = srs_charM;
        charM4 = srs_charM;
        charM_ = srs_charM;
    end

    % Determine largest peak partial pressures and center char shape on each
    % m2temp = mean(pPrs(f2,:));
    % m3temp = mean(pPrs(f3,:));
    % m4temp = mean(pPrs(f4,:));
    % m_temp = mean(pPrs(f_,:));
    % [~,i2temp] = max(m2temp-m3temp);    % fit to largest m2 signal vs. m3 signal
    % [~,i3temp] = max(m3temp-m4temp);
    % [~,i4temp] = max(m4temp);
    % [~,i_temp] = max(m_temp);

    % Adjust size of char shape to TDS data mass (i.e. points per AMU)
    delM2 = mass2(2)-mass2(1);
    delM3 = mass2(2)-mass2(1);
    delM4 = mass2(2)-mass2(1);
    delM_ = mass2(2)-mass2(1);
    qms_m2Shape_ = interp1((-99:100)*charM2,qms_m2Shape2,(-99:100)*delM2);
    qms_m3Shape_ = interp1((-99:100)*charM3,qms_m3Shape2,(-99:100)*delM3);
    qms_m4Shape_ = interp1((-99:100)*charM4,qms_m4Shape2,(-99:100)*delM4);
    qms_m_Shape_ = interp1((-99:100)*charM_,qms_m_Shape2,(-99:100)*delM_);
    qms_m2Shape_(isnan(qms_m2Shape_)) = 0;
    qms_m3Shape_(isnan(qms_m3Shape_)) = 0;
    qms_m4Shape_(isnan(qms_m4Shape_)) = 0;
    qms_m_Shape_(isnan(qms_m_Shape_)) = 0;

    % Determine the center for each peak  

    % fitOptions = optimoptions('lsqcurvefit',...
    %                           'TolFun',       1e-18,...
    %                           'TolX',         1e-18,...
    %                           'MaxFunEvals',  1e8,...
    %                           'MaxIter',      1e8,...
    %                           'DiffMaxChange',1e1,...
    %                           'Display','off');
    %
    % pPres_2 = mean(pPrs(:,i2temp+(-5:5)),2)/maxPrs0;
    % pPres_3 = mean(pPrs(:,i3temp+(-5:5)),2)/maxPrs0;
    % pPres_4 = mean(pPrs(:,i4temp+(-5:5)),2)/maxPrs0;
    % pPres__ = mean(pPrs(:,i_temp+(-5:5)),2)/maxPrs0;
    %
    % x0_2 = [pPres_2(f2_0),m2Pk];
    % x0_3 = [pPres_3(f3_0),m3Pk,pPres_3(f2_0)];
    % x0_4 = [pPres_4(f4_0),m4Pk,pPres_4(f2_0),pPres_4(f3_0)];
    % 
    % lb2 = [ 0,m2Pk*(0.9)];
    % ub2 = [10,m2Pk*(1.1)];
    % lb3 = [ 0,m3Pk*(0.9), 0];
    % ub3 = [10,m3Pk*(1.1),10];
    % lb4 = [ 0,m4Pk*(0.9), 0, 0];
    % ub4 = [10,m4Pk*(1.1),10,10];
    % 
    % pkFun2 = @(Apk,x) Apk(1)*interp1((-99:100)*delM+Apk(2),qms_m2Shape_,mass0);
    % Fit_Apk2 = lsqcurvefit(pkFun2,x0_2,mass0,pPres_2,lb2,ub2,fitOptions);
    % m2S = interp1((-99:100)*delM+Fit_Apk2(2),qms_m2Shape_,mass0);
    % 
    % pkFun3 = @(Apk,x) Apk(1)*interp1((-99:100)*delM+Apk(2),qms_m3Shape_,mass0) + Apk(3)*m2S;
    % Fit_Apk3 = lsqcurvefit(pkFun3,x0_3,mass0,pPres_3,lb3,ub3,fitOptions);
    % m3S = interp1((-99:100)*delM+Fit_Apk3(2),qms_m3Shape_,mass0);
    % 
    % pkFun4 = @(Apk,x) Apk(1)*interp1((-99:100)*delM+Apk(2),qms_m4Shape_,mass0) + Apk(3)*m2S + Apk(4)*m3S;
    % Fit_Apk4 = lsqcurvefit(pkFun4,x0_4,mass0,pPres_4,lb4,ub4,fitOptions);
    % m4S = interp1((-99:100)*delM+Fit_Apk4(2),qms_m4Shape_,mass0);

    m2S = interp1((-99:100)*delM2+m2Pk,qms_m2Shape_,mass0);
    m3S = interp1((-99:100)*delM3+m3Pk,qms_m3Shape_,mass0);
    m4S = interp1((-99:100)*delM4+m4Pk,qms_m4Shape_,mass0);
    m_S = interp1((-99:100)*delM_+m_Pk,qms_m_Shape_,mass0);
    m2S(isnan(m2S)) = 0;
    m3S(isnan(m3S)) = 0;
    m4S(isnan(m4S)) = 0;
    m_S(isnan(m_S)) = 0;

    ii = 1:length(mass0);

    if strcmp(MKSorSRS,'MKS')
        m2S( ii > i_2(end) | ii < i_2(1) ) = 0;       % Cutout index values that do not lie in mass2 window  
        m3S( ii > i_3(end) | ii < i_3(1) ) = 0;       % Cutout index values that do not lie in mass2 window  
        m4S( ii > i_4(end) | ii < i_4(1) ) = 0;       % Cutout index values that do not lie in mass2 window  
        m_S( ii > i_4(end) | ii < i_4(1) ) = 0;       % Cutout index values that do not lie in mass2 window  
    end


    pkFun = @(Apk,x) zeroPres/maxPrs0 + Apk(1)*m2S + Apk(2)*m3S + Apk(3)*m4S + Apk(4)*m_S;

    % Define weighting function
    wid2 = 0.25^2; 
    massWght = (exp(-(mass0-m2Pk).^2/(wid2))+...
                exp(-(mass0-m3Pk).^2/(wid2))+...
                exp(-(mass0-m4Pk).^2/(wid2))).*(mass0).^4;

    % Determine first step to estimate x0
    ii = 4;
    if strcmp(filter,'Gaussian')
            pPrs_3 = pPrs(:,ii-3);
            pPrs_2 = pPrs(:,ii-2);
            pPrs_1 = pPrs(:,ii-1);
            pPrs00 = pPrs(:,ii  );
            pPrs01 = pPrs(:,ii+1);
            pPrs02 = pPrs(:,ii+2);
            pPrs03 = pPrs(:,ii+3);
    
            pPrs0  = (pPrs_3+pPrs03)*0.006 + (pPrs_2+pPrs02)*0.061 + ...
                     (pPrs_1+pPrs01)*0.242 +        pPrs00  *0.383;
    else
            pPrs0  = pPrs(:,ii  );
    end

    %% Find mass nearest each peak and find height of peak
    pPrs2_0 = mean(pPrs0(f2));
    pPrs3_0 = mean(pPrs0(f3));
    pPrs4_0 = mean(pPrs0(f4));
    pPrs__0 = mean(pPrs0(f_));

    x0 = [pPrs2_0 pPrs3_0 pPrs4_0 pPrs__0]/maxPrs0;
%     lb = [1 1 1 1]*1e-15;
%     ub = [1 1 1 1]*1e2;

end
%% Setup the correct plotting axes 
axes(axPlot);
killFit = 0;                                    % killFit used to exit the fitting for loop

% mass_A = massN*0;
% mass_B = massN*0;
% mass_C = massN*0;

for ii = 4:nLength-3
    
    if killFit == 1
        break
    end
    
    if strcmp(filter,'Gaussian')
        pPrs_3 = pPrs(:,ii-3);
        pPrs_2 = pPrs(:,ii-2);
        pPrs_1 = pPrs(:,ii-1);
        pPrs00 = pPrs(:,ii  );
        pPrs01 = pPrs(:,ii+1);
        pPrs02 = pPrs(:,ii+2);
        pPrs03 = pPrs(:,ii+3);
    
        pPrs0  = (pPrs_3+pPrs03)*0.006 + (pPrs_2+pPrs02)*0.061 + ...
                 (pPrs_1+pPrs01)*0.242 +        pPrs00  *0.383;
    else
        pPrs0  = pPrs(:,ii  );
    end
    %% Find mass nearest each peak and find height of peak    
    pPrs2 = pPrs0(f2);
    pPrs3 = pPrs0(f3);
    pPrs4 = pPrs0(f4);
    pPrs_ = pPrs0(f_);
    
    % Fit Mass Peaks
    if strcmp(CHARorQUAD,'QUAD')
        [plotPres2,peakPres2,wghtPres2] = fit_quad_to_mass(pPrs2,mass2-m2Pk,f2,[minPres,minWght]);
        [plotPres3,peakPres3,wghtPres3] = fit_quad_to_mass(pPrs3,mass3-m3Pk,f3,[minPres,minWght]);
        [plotPres4,peakPres4,wghtPres4] = fit_quad_to_mass(pPrs4,mass4-m4Pk,f4,[minPres,minWght]);
        [plotPres_,peakPres_,wghtPres_] = fit_quad_to_mass(pPrs_,mass_-m_Pk,f_,[minPres,minWght]);
        fit_Pres0 = 0*mass0+1e-100;            % Placeholder for plotting (not real data)      
    else
        Fit_Apk = nlinfit(mass0,pPrs0/maxPrs0,pkFun,x0,'Weights',massWght);
    
        x0 = Fit_Apk;                        
                            
        fit_Pres0 = pkFun( Fit_Apk,          0)*maxPrs0;
        plotPres2 = pkFun([Fit_Apk(1) 0 0 0],0)*maxPrs0;
        plotPres3 = pkFun([0 Fit_Apk(2) 0 0],0)*maxPrs0;
        plotPres4 = pkFun([0 0 Fit_Apk(3) 0],0)*maxPrs0;
        plotPres_ = pkFun([0 0 0 Fit_Apk(4)],0)*maxPrs0;
        
        plotPres2 = plotPres2(f2);
        plotPres3 = plotPres3(f3);
        plotPres4 = plotPres4(f4);
        plotPres_ = plotPres_(f_);

        peakPres2 = fit_Pres0(f2_0);
        peakPres3 = fit_Pres0(f3_0);
        peakPres4 = fit_Pres0(f4_0);    
        peakPres_ = fit_Pres0(f__0);    
    
        wghtPres2 = std(fit_Pres0(f2)-pPrs2)/peakPres2;
        wghtPres3 = std(fit_Pres0(f3)-pPrs3)/peakPres3;
        wghtPres4 = std(fit_Pres0(f4)-pPrs4)/peakPres4;
        wghtPres_ = std(fit_Pres0(f_)-pPrs_)/peakPres_;
    end
    
    QMS.m2Pres(ii) = peakPres2-zeroPres;
    QMS.m3Pres(ii) = peakPres3-zeroPres;
    QMS.m4Pres(ii) = peakPres4-zeroPres;
    QMS.m_Pres(ii) = peakPres_-zeroPres;
    QMS.m2Wght(ii) = wghtPres2;
    QMS.m3Wght(ii) = wghtPres3;
    QMS.m4Wght(ii) = wghtPres4;
    QMS.m_Wght(ii) = wghtPres_;
   
    %% Plot for debugging
    minValue = 1e-20;
    
    if strcmp(plotYorN,'PlotYes')
        loglin = 1;

        aa = pPrs0;
        bb = plotPres2;
        cc = plotPres3;
        dd = plotPres4;
        ee = plotPres_;
        ff = fit_Pres0;
    
        if loglin == 1
            aa = log10(aa);
            bb = log10(max(bb,minValue));
            cc = log10(max(cc,minValue));
            dd = log10(max(dd,minValue));
            ee = log10(max(ee,minValue));
            ff = log10(max(ff,minValue));
        end
        
        plot(mass0 ,aa,  'mo',...
             mass0 ,ff,  'cx',...
             mass2 ,bb, 'r*-',...
             mass3 ,cc, 'b*-',...
             mass4 ,dd, 'k*-',...
             mass_ ,ee, 'g*-',...
             'LineWidth',2.0);       
        n_step = num2str(          ii-3,'%6.0f');
        N_step = num2str(     nLength-6,'%6.0f');
        timeS  = num2str(QMS.dtList(ii),'%8.2f');
%         mass_2 = num2str(       pkMass2,'%5.3f');
        title(['n_{step} = ' n_step ' of ' N_step ...
               ' : time = '  timeS ' [s] '])        
%         title(['n_{step} = ' n_step ' of ' N_step ...
%                ' : time = '  timeS ' [s] '...
%                ' : mass_2 = ' mass_2 ])
        xlim([ 1.5, 4.5])	
        if strcmp(MKSorSRS,'MKS')
        	ylim([-15.0,-6.5])
        elseif strcmp(MKSorSRS,'SRS')
            ylim([-13.0,-6.0])
        end
        xlabel('Mass / Charge')
        ylabel('Log_{10}(Partial Pressure) [ T ]')
        box on
        grid on
        pause(0.01)
%         mass_A( 1:48 ) = mass_A( 1:48 ) + pPrs0( 1:48 )/max(pPrs0( 1:48 ));
%         mass_B(49:80 ) = mass_B(49:80 ) + pPrs0(49:80 )/max(pPrs0(49:80 ));
%         mass_C(81:144) = mass_C(81:144) + pPrs0(81:144)/max(pPrs0(81:144));
    end
    % end debugging
    
end

for ii = 1:3
    QMS.m2Pres(ii) = QMS.m2Pres(4);
    QMS.m3Pres(ii) = QMS.m3Pres(4);
    QMS.m4Pres(ii) = QMS.m4Pres(4);
    QMS.m_Pres(ii) = QMS.m_Pres(4);
    QMS.m2Wght(ii) = QMS.m2Wght(4);
    QMS.m3Wght(ii) = QMS.m3Wght(4);
    QMS.m4Wght(ii) = QMS.m4Wght(4);
    QMS.m_Wght(ii) = QMS.m_Wght(4);
end

for ii = nLength-2:nLength
    QMS.m2Pres(ii) = QMS.m2Pres(nLength-3);
    QMS.m3Pres(ii) = QMS.m3Pres(nLength-3);
    QMS.m4Pres(ii) = QMS.m4Pres(nLength-3);
    QMS.m_Pres(ii) = QMS.m_Pres(nLength-3);
    QMS.m2Wght(ii) = QMS.m2Wght(nLength-3);
    QMS.m3Wght(ii) = QMS.m3Wght(nLength-3);
    QMS.m4Wght(ii) = QMS.m4Wght(nLength-3);
    QMS.m_Wght(ii) = QMS.m_Wght(nLength-3);
end

%% ========================================================================
%  ======================== Plotting Subroutines ==========================
%  ========================================================================

function plot_Log10_time(data,titlePlot,axPlot)
axes(axPlot)
if     strcmp(titlePlot,'MKS')
         plot(data.dtList,log10(data.m2Pres),'r*',...
              data.dtList,log10(data.m3Pres),'b*',...
              data.dtList,log10(data.m4Pres),'k*',...
              data.dtList,log10(data.m_Pres),'g*',...         
              'LineWidth',2.0);
elseif strcmp(titlePlot,'SRS')
         plot(data.dtList,log10(data.m2Pres),'r*',...
              data.dtList,log10(data.m3Pres),'b*',...
              data.dtList,log10(data.m4Pres),'k*',...
              'LineWidth',2.0);
elseif strcmp(titlePlot,'D2')
         plot(data.dtList,log10(data.m2Pres),'r*',...
              data.dtList,log10(data.m4Pres),'k*',...
              'LineWidth',2.0);
elseif strcmp(titlePlot,'HD')
         plot(data.dtList,log10(data.m2Pres),'r*',...
              data.dtList,log10(data.m3Pres),'b*',...
              'LineWidth',2.0);
elseif strcmp(titlePlot,'He')
         plot(data.dtList,log10(data.m2Pres),'r*',...
              data.dtList,log10(data.m_Pres),'g*',...
              'LineWidth',2.0);
elseif strcmp(titlePlot,'MKS Error')
         plot(data.dtList,log10(data.m2Wght),'r*',...
              data.dtList,log10(data.m3Wght),'b*',...
              data.dtList,log10(data.m4Wght),'k*',...
              data.dtList,log10(data.m_Wght),'g*',...         
              'LineWidth',2.0);
elseif strcmp(titlePlot,'SRS Error')
         plot(data.dtList,log10(data.m2Wght),'r*',...
              data.dtList,log10(data.m3Wght),'b*',...
              data.dtList,log10(data.m4Wght),'k*',...
              'LineWidth',2.0);
end
title(titlePlot)
xlabel('time [s]')
xlim([min(data.dtList) max(data.dtList)])
if strcmp(titlePlot,'MKS Error')||strcmp(titlePlot,'SRS Error')
   ylabel('Log_{10}(std/peak)')
else
   ylabel('Log_{10}(Partial Pressure) [ T ]')
end
box on

function plot_xx_yy_1(xx,yy1,tL,xL,yL,axPlot,Log)

yMax = max(yy1);
n10  = floor(log10(yMax));

if Log == 1
    yy1 = log10(yy1);
else
    yy1 = yy1*10^(-n10);
    yL = [yL ' \times 10^{' num2str(n10,'%3d')  '}'];
end

axes(axPlot)
plot( xx, yy1, 'r*-',...
     'LineWidth',2.0);
xlim([min(xx) max(xx)])
title( tL)
xlabel(xL)
ylabel(yL)
box on

function plot_xx_yy_2(xx,yy1,yy2,tL,xL,yL,cL,axPlot,Log)

yMax = max([max(yy1) max(yy2)]);
n10  = floor(log10(yMax));

yy0 = -min(0,yy1);
yy1 =  max(0,yy1);

if Log == 1
    yy1 =  log10(yy1);
    yy2 =  log10(yy2);
    yy0 =  log10(yy0);
else
    yy1 = yy1*10^(-n10);
    yy2 = yy2*10^(-n10);
    yy0 = yy0*10^(-n10);
    yL = [yL ' \times 10^{' num2str(n10,'%3d')  '}'];
end

axes(axPlot)
plot( xx, yy1, 'r*',...
      xx, yy2,  cL,...
      xx, yy0,  'mx',...
     'LineWidth',2.0);
xlim([min(xx) max(xx)])
title( tL)
xlabel(xL)
ylabel(yL)
box on
grid on

function plot_xx_yy_3(xx,yy1,yy2,yy3,tL,xL,yL,axPlot,Log)


yMin = min([min(yy1) min(yy2) min(yy3)]);
yMax = max([max(yy1) max(yy2) max(yy3)]);
n10  = floor(log10(yMax));

% dely = yMax-yMin;

if Log == 1
    yy1 = log10(yy1);
    yy2 = log10(yy2);
    yy3 = log10(yy3);
    yLimits = log10([floor(yMin) ceil(yMax)]);
else
    yy1 = yy1*10^(-n10);
    yy2 = yy2*10^(-n10);
    yy3 = yy3*10^(-n10);
    yL = [yL ' \times 10^{' num2str(n10,'%3d')  '}'];
    yLimits = [floor(yMin) ceil(yMax)]*10^(-n10);
end

axes(axPlot)
plot(xx,yy1,'ro-',...
     xx,yy2,'b*-',...
     xx,yy3,'k*-',...
     'LineWidth',2.0);
xlim([min(xx) max(xx)])
ylim(yLimits)
title( tL)
xlabel(xL)
ylabel(yL)
box on


%% END of TDS GUI Subroutines =============================================










