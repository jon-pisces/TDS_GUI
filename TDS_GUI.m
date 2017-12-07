function varargout = TDS_GUI(varargin)
% TDS_GUI MATLAB code for TDS_GUI.fig
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

set(handles.edit_mks_D2_a,'enable','off');
set(handles.edit_mks_D2_b,'enable','off');
set(handles.edit_mks_D2_c,'enable','off');
set(handles.edit_mks_HD_a,'enable','off');
set(handles.edit_mks_HD_b,'enable','off');
set(handles.edit_mks_HD_c,'enable','off');
set(handles.edit_srs_D2_a,'enable','off');
set(handles.edit_srs_D2_b,'enable','off');
set(handles.edit_srs_D2_c,'enable','off');
set(handles.edit_srs_HD_a,'enable','off');
set(handles.edit_srs_HD_b,'enable','off');
set(handles.edit_srs_HD_c,'enable','off');
set(handles.edit_RampRate,'enable','off');

set(handles.pushbutton_Imp_Temp,'enable','off');
set(handles.pushbutton_Fit__MKS,'enable','off');
set(handles.pushbutton_Fit__SRS,'enable','off');
set(handles.pushbutton_PeaksFit,'enable','off');
set(handles.pushbutton_FitError,'enable','off');
set(handles.pushbutton_SlctData,'enable','off');
set(handles.pushbutton_Use_Back,'enable','off');
set(handles.pushbutton_LinrBack,'enable','off');
set(handles.pushbutton_QuadBack,'enable','off');
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
set(handles.checkbox_D2fluxSRS,'enable','off');
set(handles.checkbox_HDfluxSRS,'enable','off');



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
function edit_mksPresC_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mksPresZ_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srsPresC_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srsPresZ_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_Diameter_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_LeakRate_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mks_D2_a_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mks_D2_b_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mks_D2_c_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mks_HD_a_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mks_HD_b_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_mks_HD_c_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srs_HD_a_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srs_HD_b_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srs_HD_c_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srs_D2_a_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srs_D2_b_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_srs_D2_c_CreateFcn(hObject, eventdata, handles)
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
%       Click on Linear or Quad Fit to perform scaling
%               Scaling factors are displayed in MKS or SRS Background
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

function         edit_mksPresC_Callback(hObject, eventdata, handles)

function         edit_mksPresZ_Callback(hObject, eventdata, handles)

function         edit_srsPresC_Callback(hObject, eventdata, handles)

function         edit_srsPresZ_Callback(hObject, eventdata, handles)

function         edit_Diameter_Callback(hObject, eventdata, handles)

function         edit_LeakRate_Callback(hObject, eventdata, handles)


% A Select File/Directory =================================================

function radiobutton_TDS_A_Callback(hObject, eventdata, handles)
 set(handles.radiobutton_TDS_B,'Value',0)

function radiobutton_TDS_B_Callback(hObject, eventdata, handles)
 set(handles.radiobutton_TDS_A,'Value',0)

function         edit_Path_MKS_Callback(hObject, eventdata, handles)
set(handles.pushbutton_Imp_Temp,'enable','on');
set(handles.pushbutton_Fit__MKS,'enable','on');

function         edit_Path_SRS_Callback(hObject, eventdata, handles)
set(handles.pushbutton_Fit__SRS,'enable','on');

function   pushbutton_Find_MKS_Callback(hObject, eventdata, handles)
[fileNameMKS,pathNameMKS] = uigetfile('E:\Data\MKS\Data\*.txt','Select the MKS file');
filePathMKS = [pathNameMKS fileNameMKS];
set(handles.edit_Path_MKS,'String',filePathMKS);
set(handles.pushbutton_Imp_Temp,'enable','on');
set(handles.pushbutton_Fit__MKS,'enable','on');

function   pushbutton_Find_SRS_Callback(hObject, eventdata, handles)
filePathSRS = [uigetdir('E:\Data\SRS\') '\'];
set(handles.edit_Path_SRS,'String',filePathSRS);
set(handles.pushbutton_Fit__SRS,'enable','on');

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

filePathMKS = get(handles.edit_Path_MKS,'String');

if     get(handles.radiobutton_TDS_A,'Value')
       TDS_AorB = 'TDS_A';
elseif get(handles.radiobutton_TDS_B,'Value')
       TDS_AorB = 'TDS_B';
end

mks_data = fit_MKS_data(filePathMKS,filter_,axFit,massPeak,TDS_AorB);

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
set(handles.radiobutton_Scale__D2,'enable','on');
set(handles.radiobutton_Scale__HD,'enable','on');
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
massPeak.D2peak = str2double(get(handles.edit_D2pk_srs,'String'));

filePathSRS = get(handles.edit_Path_SRS,'String');
srs_data = fit_SRS_data(filePathSRS,filter_,axFit,massPeak);

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

jBgn  = find(mks_data.temptr>(T_min-7.5) & mks_data.temptr<(T_min+7.5),1,'first');
jEnd  = find(mks_data.temptr>(T_max-7.5) & mks_data.temptr<(T_max+7.5),1,'first');
jSpan = jBgn:jEnd;

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

function         edit_H2pk_mks_Callback(hObject, eventdata, handles)

function         edit_HDpk_mks_Callback(hObject, eventdata, handles)

function         edit_D2pk_mks_Callback(hObject, eventdata, handles)

function         edit_Hepk_mks_Callback(hObject, eventdata, handles)

function         edit_H2pk_srs_Callback(hObject, eventdata, handles)

function         edit_HDpk_srs_Callback(hObject, eventdata, handles)

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

if     get(handles.radiobutton_Scale__HD,'Value')
       plot_Log10_time(da,'HD',axBck);
elseif get(handles.radiobutton_Scale__D2,'Value')
       plot_Log10_time(da,'D2',axBck);
end

set(handles.pushbutton_Use_Back,'enable','on');
set(handles.pushbutton_LinrBack,'enable','on');
set(handles.pushbutton_QuadBack,'enable','on');

function   pushbutton_Use_Back_Callback(hObject, eventdata, handles)
global axBck
global axFnl
global mks_data
global srs_data

ChooseMKS = get(handles.radiobutton_ChooseMKS,'Value');
ChooseSRS = get(handles.radiobutton_ChooseSRS,'Value');

Scale__D2 = get(handles.radiobutton_Scale__D2,'Value');
Scale__HD = get(handles.radiobutton_Scale__HD,'Value');

if     ChooseMKS
       data= mks_data;
elseif ChooseSRS
       data= srs_data;
end

t1min = str2double(get(handles.edit_time1min,'String'));
t1max = str2double(get(handles.edit_time1max,'String'));
indx1 = find(data.dtList > t1min & data.dtList < t1max);

t2min = str2double(get(handles.edit_time2min,'String'));
t2max = str2double(get(handles.edit_time2max,'String'));
indx2 = find(data.dtList > t2min & data.dtList < t2max);

indx = [indx1;indx2];

xL  = 'time [s]';
yL  = 'Log_{10}(Partial Pressure) [ T ]';
tHD = 'H2 scaled to HD';
tD2 = 'H2 scaled to D2';
m3  = 'b*-';
m4  = 'k*-';

xLb = 'H2 Partial Pressure [ T ]';
yLb = 'Partial Pressure [T]';
tLb = 'User Input a,b,c values';

H2P = data.m2Pres(indx);

if     ChooseMKS && Scale__HD
            aa = str2double(get(handles.edit_mks_HD_a,'String'));
            bb = str2double(get(handles.edit_mks_HD_b,'String'));
            cc = str2double(get(handles.edit_mks_HD_c,'String'));  
            mks_data.m3Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            plot_xx_yy_2(H2P,data.m3Pres(indx),H2P,mks_data.m3Back(indx),tLb,xLb,yLb,axBck)
            plot_xx_Lyy_2(data.dtList,mks_data.m3Back,data.m3Pres,tHD,xL,yL,m3,axFnl)
elseif ChooseMKS && Scale__D2
            aa = str2double(get(handles.edit_mks_D2_a,'String'));
            bb = str2double(get(handles.edit_mks_D2_b,'String'));
            cc = str2double(get(handles.edit_mks_D2_c,'String'));
            mks_data.m4Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            plot_xx_yy_2(H2P,data.m4Pres(indx),H2P,mks_data.m4Back(indx),tLb,xLb,yLb,axBck)
            plot_xx_Lyy_2(data.dtList,mks_data.m4Back,data.m4Pres,tD2,xL,yL,m4,axFnl)
elseif ChooseSRS && Scale__HD
            aa = str2double(get(handles.edit_srs_HD_a,'String'));
            bb = str2double(get(handles.edit_srs_HD_b,'String'));
            cc = str2double(get(handles.edit_srs_HD_c,'String'));    
            srs_data.m3Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            plot_xx_yy_2(H2P,data.m3Pres(indx),H2P,srs_data.m3Back(indx),tLb,xLb,yLb,axBck)
            plot_xx_Lyy_2(data.dtList,srs_data.m3Back,data.m3Pres,tHD,xL,yL,m3,axFnl)
elseif ChooseSRS && Scale__D2
            aa = str2double(get(handles.edit_srs_D2_a,'String'));
            bb = str2double(get(handles.edit_srs_D2_b,'String'));
            cc = str2double(get(handles.edit_srs_D2_c,'String'));
            srs_data.m4Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            plot_xx_yy_2(H2P,data.m4Pres(indx),H2P,srs_data.m4Back(indx),tLb,xLb,yLb,axBck) 
            plot_xx_Lyy_2(data.dtList,srs_data.m4Back,data.m4Pres,tD2,xL,yL,m4,axFnl)
end

set(handles.pushbutton_FluxTime,'enable','on');
set(handles.pushbutton_FluxTemp,'enable','on');

function   pushbutton_LinrBack_Callback(hObject, eventdata, handles)
global axBck
global axFnl
global mks_data
global srs_data

ChooseMKS = get(handles.radiobutton_ChooseMKS,'Value');
ChooseSRS = get(handles.radiobutton_ChooseSRS,'Value');

Scale__D2 = get(handles.radiobutton_Scale__D2,'Value');
Scale__HD = get(handles.radiobutton_Scale__HD,'Value');

if     ChooseMKS
       data= mks_data;
elseif ChooseSRS
       data= srs_data;
end

t1min = str2double(get(handles.edit_time1min,'String'));
t1max = str2double(get(handles.edit_time1max,'String'));
indx1 = find(data.dtList > t1min & data.dtList < t1max);

t2min = str2double(get(handles.edit_time2min,'String'));
t2max = str2double(get(handles.edit_time2max,'String'));
indx2 = find(data.dtList > t2min & data.dtList < t2max);

indx = [indx1;indx2];

xL  = 'time [s]';
yL  = 'Log_{10}(Partial Pressure) [ T ]';
tHD = 'H2 scaled to HD';
tD2 = 'H2 scaled to D2';
m3  = 'b*-';
m4  = 'k*-';

if     ChooseMKS && Scale__HD
            [aa,bb,cc] = scale_back(data.m2Pres,data.m3Pres,data.m3Wght,indx,1,axBck);
            set(handles.edit_mks_HD_a,'String',num2str(aa,'%8.4e'),'enable','on');
            set(handles.edit_mks_HD_b,'String',num2str(bb,'%8.4e'),'enable','on');
            set(handles.edit_mks_HD_c,'String',num2str(cc,'%8.4e'),'enable','on');
            mks_data.m3Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            plot_xx_Lyy_2(data.dtList,mks_data.m3Back,data.m3Pres,tHD,xL,yL,m3,axFnl);
elseif ChooseMKS && Scale__D2
            [aa,bb,cc] = scale_back(data.m2Pres,data.m4Pres,data.m4Wght,indx,1,axBck);
            set(handles.edit_mks_D2_a,'String',num2str(aa,'%8.4e'),'enable','on');
            set(handles.edit_mks_D2_b,'String',num2str(bb,'%8.4e'),'enable','on');
            set(handles.edit_mks_D2_c,'String',num2str(cc,'%8.4e'),'enable','on');
            mks_data.m4Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            plot_xx_Lyy_2(data.dtList,mks_data.m4Back,data.m4Pres,tD2,xL,yL,m4,axFnl);
elseif ChooseSRS && Scale__HD
            [aa,bb,cc] = scale_back(data.m2Pres,data.m3Pres,data.m3Wght,indx,1,axBck);
            set(handles.edit_srs_HD_a,'String',num2str(aa,'%8.4e'),'enable','on');
            set(handles.edit_srs_HD_b,'String',num2str(bb,'%8.4e'),'enable','on');
            set(handles.edit_srs_HD_c,'String',num2str(cc,'%8.4e'),'enable','on');
            srs_data.m3Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            plot_xx_Lyy_2(data.dtList,srs_data.m3Back,data.m3Pres,tHD,xL,yL,m3,axFnl);
elseif ChooseSRS && Scale__D2
            [aa,bb,cc] = scale_back(data.m2Pres,data.m4Pres,data.m4Wght,indx,1,axBck);
            set(handles.edit_srs_D2_a,'String',num2str(aa,'%8.4e'),'enable','on');
            set(handles.edit_srs_D2_b,'String',num2str(bb,'%8.4e'),'enable','on');
            set(handles.edit_srs_D2_c,'String',num2str(cc,'%8.4e'),'enable','on');
            srs_data.m4Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            plot_xx_Lyy_2(data.dtList,srs_data.m4Back,data.m4Pres,tD2,xL,yL,m4,axFnl);
end

set(handles.pushbutton_FluxTime,'enable','on');
set(handles.pushbutton_FluxTemp,'enable','on');

function   pushbutton_QuadBack_Callback(hObject, eventdata, handles)
global axBck
global axFnl
global mks_data
global srs_data

ChooseMKS = get(handles.radiobutton_ChooseMKS,'Value');
ChooseSRS = get(handles.radiobutton_ChooseSRS,'Value');

Scale__D2 = get(handles.radiobutton_Scale__D2,'Value');
Scale__HD = get(handles.radiobutton_Scale__HD,'Value');

if     ChooseMKS
       data= mks_data;
elseif ChooseSRS
       data= srs_data;
end

t1min = str2double(get(handles.edit_time1min,'String'));
t1max = str2double(get(handles.edit_time1max,'String'));
indx1 = find(data.dtList > t1min & data.dtList < t1max);

t2min = str2double(get(handles.edit_time2min,'String'));
t2max = str2double(get(handles.edit_time2max,'String'));
indx2 = find(data.dtList > t2min & data.dtList < t2max);

indx = [indx1;indx2];

xL = 'time [s]';
yL = 'Log_{10}(Partial Pressure) [ T ]';
tHD = 'H2 scaled to HD';
tD2 = 'H2 scaled to D2';
m3  = 'b*-';
m4  = 'k*-';

if     ChooseMKS && Scale__HD
            [aa,bb,cc] = scale_back(data.m2Pres,data.m3Pres,data.m3Wght,indx,2,axBck);
            set(handles.edit_mks_HD_a,'String',num2str(aa,'%8.4e'),'enable','on');
            set(handles.edit_mks_HD_b,'String',num2str(bb,'%8.4e'),'enable','on');
            set(handles.edit_mks_HD_c,'String',num2str(cc,'%8.4e'),'enable','on');
            mks_data.m3Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            plot_xx_Lyy_2(data.dtList,mks_data.m3Back,data.m3Pres,tHD,xL,yL,m3,axFnl)
elseif ChooseMKS && Scale__D2
            [aa,bb,cc] = scale_back(data.m2Pres,data.m4Pres,data.m4Wght,indx,2,axBck);
            set(handles.edit_mks_D2_a,'String',num2str(aa,'%8.4e'),'enable','on');
            set(handles.edit_mks_D2_b,'String',num2str(bb,'%8.4e'),'enable','on');
            set(handles.edit_mks_D2_c,'String',num2str(cc,'%8.4e'),'enable','on');
            mks_data.m4Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            plot_xx_Lyy_2(data.dtList,mks_data.m4Back,data.m4Pres,tD2,xL,yL,m4,axFnl)
elseif ChooseSRS && Scale__HD
            [aa,bb,cc] = scale_back(data.m2Pres,data.m3Pres,data.m3Wght,indx,2,axBck);
            set(handles.edit_srs_HD_a,'String',num2str(aa,'%8.4e'),'enable','on');
            set(handles.edit_srs_HD_b,'String',num2str(bb,'%8.4e'),'enable','on');
            set(handles.edit_srs_HD_c,'String',num2str(cc,'%8.4e'),'enable','on');
            srs_data.m3Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            plot_xx_Lyy_2(data.dtList,srs_data.m3Back,data.m3Pres,tHD,xL,yL,m3,axFnl)
elseif ChooseSRS && Scale__D2
            [aa,bb,cc] = scale_back(data.m2Pres,data.m4Pres,data.m4Wght,indx,2,axBck);
            set(handles.edit_srs_D2_a,'String',num2str(aa,'%8.4e'),'enable','on');
            set(handles.edit_srs_D2_b,'String',num2str(bb,'%8.4e'),'enable','on');
            set(handles.edit_srs_D2_c,'String',num2str(cc,'%8.4e'),'enable','on');
            srs_data.m4Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            plot_xx_Lyy_2(data.dtList,srs_data.m4Back,data.m4Pres,tD2,xL,yL,m4,axFnl)
end

set(handles.pushbutton_FluxTime,'enable','on');
set(handles.pushbutton_FluxTemp,'enable','on');

function    checkbox_D2fluxMKS_Callback(hObject, eventdata, handles)

function    checkbox_HDfluxMKS_Callback(hObject, eventdata, handles)

function    checkbox_D2fluxSRS_Callback(hObject, eventdata, handles)

function    checkbox_HDfluxSRS_Callback(hObject, eventdata, handles)

% E Background ============================================================

function         edit_mks_D2_a_Callback(hObject, eventdata, handles)

function         edit_mks_D2_b_Callback(hObject, eventdata, handles)

function         edit_mks_D2_c_Callback(hObject, eventdata, handles)

function         edit_mks_HD_a_Callback(hObject, eventdata, handles)

function         edit_mks_HD_b_Callback(hObject, eventdata, handles)

function         edit_mks_HD_c_Callback(hObject, eventdata, handles)

function         edit_srs_HD_a_Callback(hObject, eventdata, handles)

function         edit_srs_HD_b_Callback(hObject, eventdata, handles)

function         edit_srs_HD_c_Callback(hObject, eventdata, handles)

function         edit_srs_D2_a_Callback(hObject, eventdata, handles)

function         edit_srs_D2_b_Callback(hObject, eventdata, handles)

function         edit_srs_D2_c_Callback(hObject, eventdata, handles)


% F Final Fit =============================================================

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

if     ChooseMKS == 1
       data  = mks_data;
       data.presC = str2double(get(handles.edit_mksPresC,'String'));
       data.presZ = str2double(get(handles.edit_mksPresZ,'String'));
elseif ChooseSRS == 1
       data = srs_data;
       data.presC = str2double(get(handles.edit_srsPresC,'String'));
       data.presZ = str2double(get(handles.edit_srsPresZ,'String'));
end

avog = 6.022e23;
pi   = 3.141593;

data.leak  = str2double(get(handles.edit_LeakRate,'String'));
data.diam  = str2double(get(handles.edit_Diameter,'String'));
data.cal_m = avog*data.leak/((data.presC-data.presZ)*pi*(data.diam/2)^2);

xL  = 'Time [s]';
yL  = 'Flux [ions/m^2/s]';
tHD = 'HD Flux';
tD2 = 'D2 Flux';

if     ChooseMKS && Scale__HD
            aa = str2double(get(handles.edit_mks_HD_a,'String'));
            bb = str2double(get(handles.edit_mks_HD_b,'String'));
            cc = str2double(get(handles.edit_mks_HD_c,'String'));            
            data.m3Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            set(handles.checkbox_HDfluxMKS,'Value',1);  
            data.HDflux = (data.m3Pres-data.m3Back)*data.cal_m;
            plot_xx_yy_1(data.dtList,data.HDflux,tHD,xL,yL,axFnl);           
elseif ChooseMKS && Scale__D2            
            aa = str2double(get(handles.edit_mks_D2_a,'String'));
            bb = str2double(get(handles.edit_mks_D2_b,'String'));
            cc = str2double(get(handles.edit_mks_D2_c,'String'));            
            data.m4Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            set(handles.checkbox_D2fluxMKS,'Value',1);
            data.D2flux = (data.m4Pres-data.m4Back)*data.cal_m;
            plot_xx_yy_1(data.dtList,data.D2flux,tD2,xL,yL,axFnl);
            data.D2_abc = [aa,bb,cc];
elseif ChooseSRS && Scale__HD
            aa = str2double(get(handles.edit_srs_HD_a,'String'));
            bb = str2double(get(handles.edit_srs_HD_b,'String'));
            cc = str2double(get(handles.edit_srs_HD_c,'String'));            
            data.m3Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            set(handles.checkbox_HDfluxSRS,'Value',1);
            data.HDflux = (data.m3Pres-data.m3Back)*data.cal_m;
            plot_xx_yy_1(data.dtList,data.HDflux,tHD,xL,yL,axFnl);
            data.HD_abc = [aa,bb,cc];
elseif ChooseSRS && Scale__D2
            aa = str2double(get(handles.edit_srs_D2_a,'String'));
            bb = str2double(get(handles.edit_srs_D2_b,'String'));
            cc = str2double(get(handles.edit_srs_D2_c,'String'));            
            data.m4Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            set(handles.checkbox_D2fluxSRS,'Value',1);
            data.D2flux = (data.m4Pres-data.m4Back)*data.cal_m;
            plot_xx_yy_1(data.dtList,data.D2flux,tD2,xL,yL,axFnl);
            data.D2_abc = [aa,bb,cc];
end

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

if     ChooseMKS == 1
       data  = mks_data;
       data.presC = str2double(get(handles.edit_mksPresC,'String'));
       data.presZ = str2double(get(handles.edit_mksPresZ,'String'));
elseif ChooseSRS == 1
       data = srs_data;
       data.presC = str2double(get(handles.edit_srsPresC,'String'));
       data.presZ = str2double(get(handles.edit_srsPresZ,'String'));
end


avog = 6.022e23;
pi   = 3.141593;

data.leak  = str2double(get(handles.edit_LeakRate,'String'));
data.diam  = str2double(get(handles.edit_Diameter,'String'));
data.cal_m = avog*data.leak/((data.presC-data.presZ)*pi*(data.diam/2)^2);

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

if     ChooseMKS && Scale__HD
            aa = str2double(get(handles.edit_mks_HD_a,'String'));
            bb = str2double(get(handles.edit_mks_HD_b,'String'));
            cc = str2double(get(handles.edit_mks_HD_c,'String'));            
            data.m3Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            set(handles.checkbox_HDfluxMKS,'Value',1);  
            data.HDflux = (data.m3Pres-data.m3Back)*data.cal_m;
            plot_xx_yy_1(data.temptr(jSpan),data.HDflux(jSpan),tHD,xL,yL,axFnl);
            data.HD_abc = [aa,bb,cc];
elseif ChooseMKS && Scale__D2            
            aa = str2double(get(handles.edit_mks_D2_a,'String'));
            bb = str2double(get(handles.edit_mks_D2_b,'String'));
            cc = str2double(get(handles.edit_mks_D2_c,'String'));            
            data.m4Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            set(handles.checkbox_D2fluxMKS,'Value',1);
            data.D2flux = (data.m4Pres-data.m4Back)*data.cal_m;
            plot_xx_yy_1(data.temptr(jSpan),data.D2flux(jSpan),tD2,xL,yL,axFnl);
            data.D2_abc = [aa,bb,cc];
elseif ChooseSRS && Scale__HD
            aa = str2double(get(handles.edit_srs_HD_a,'String'));
            bb = str2double(get(handles.edit_srs_HD_b,'String'));
            cc = str2double(get(handles.edit_srs_HD_c,'String'));            
            data.m3Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            set(handles.checkbox_HDfluxSRS,'Value',1);
            data.HDflux = (data.m3Pres-data.m3Back)*data.cal_m;
            plot_xx_yy_1(data.temptr(jSpan),data.HDflux(jSpan),tHD,xL,yL,axFnl);
            data.HD_abc = [aa,bb,cc];
elseif ChooseSRS && Scale__D2
            aa = str2double(get(handles.edit_srs_D2_a,'String'));
            bb = str2double(get(handles.edit_srs_D2_b,'String'));
            cc = str2double(get(handles.edit_srs_D2_c,'String'));            
            data.m4Back = data.m2Pres.*data.m2Pres*aa + data.m2Pres*bb + cc;
            set(handles.checkbox_D2fluxSRS,'Value',1);
            data.D2flux = (data.m4Pres-data.m4Back)*data.cal_m;
            plot_xx_yy_1(data.temptr(jSpan),data.D2flux(jSpan),tD2,xL,yL,axFnl);
            data.D2_abc = [aa,bb,cc];
end

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
       
function   pushbutton_Tot_D_flx_Callback(hObject, eventdata, handles)
global axFnl
global mks_data
global srs_data

ChooseMKS = get(handles.radiobutton_ChooseMKS,'Value');
ChooseSRS = get(handles.radiobutton_ChooseSRS,'Value');

if     ChooseMKS
       data  = mks_data;
elseif ChooseSRS
       data = srs_data;
end

data.D_flux = data.HDflux + data.D2flux*2;

T_min = str2double(get(handles.edit_Temp_min,'String'));
T_max = str2double(get(handles.edit_Temp_max,'String'));

jBgn = find(data.temptr>(T_min-7.5) & data.temptr<(T_min+7.5),1,'first');
jEnd = find(data.temptr>(T_max-7.5) & data.temptr<(T_max+7.5),1,'first');
jSpan = jBgn:jEnd;


[RampRate,~] = fit_TempTime(data.dtList(jSpan),data.temptr(jSpan));
set(handles.edit_RampRate,'String',num2str(RampRate,'%4.3f'));

data.jSpan  = jSpan;
data.Dreten = sum(data.D_flux(jSpan).*(data.dtList(jSpan)-data.dtList(jSpan-1)));

xL  = 'Temp [K]';
yL  = 'Flux [ions/m^2/s]';
tL = ['Total D Retention = ' num2str(data.Dreten,'%9.3e') ' [D/m^2]'];

plot_xx_yy_1(data.temptr(jSpan),data.D_flux(jSpan),tL,xL,yL,axFnl);

if     ChooseMKS
       mks_data = data;
       set(handles.pushbutton_WkspcMKS,'enable','on');
       set(handles.pushbutton_TxtF_MKS,'enable','on');
elseif ChooseSRS
       srs_data = data;
       set(handles.pushbutton_WkspcSRS,'enable','on');
       set(handles.pushbutton_TxtF_SRS,'enable','on');
end

function   edit_time_min_Callback(hObject, eventdata, handles)
global mks_data
global srs_data


function   edit_time_max_Callback(hObject, eventdata, handles)
global mks_data
global srs_data

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

Header1 = ['D Retention = ' num2str(data.Dreten,'%8.4e') ' [D/m^2]' ...
           ' | Temperatures Spanned = ' num2str(data.temptr(min(data.jSpan)),'%7.3e')...
                                 ' to ' num2str(data.temptr(max(data.jSpan)),'%7.3e') ];
Header2 = 'Time[s]     Temp[K]     DFlux[D/m^2/s]   HDFlux[HD/m^2/s]   D2Flux[D2/m^2/s]';
Values  = [data.dtList(jSpan),data.temptr(jSpan),data.D_flux(jSpan),...
           data.HDflux(jSpan),data.D2flux(jSpan)];

Var__MKS = get(handles.edit_Var__MKS,'String');
fileName = [Var__MKS '.txt'];

fid = fopen(fileName,'wt');
fprintf(fid,[Header1 '\n']);
fprintf(fid,[Header2 '\n']);
fclose(fid);
dlmwrite(fileName,Values, '-append','delimiter','\t','precision','%8.4e');

function   pushbutton_TxtF_SRS_Callback(hObject, eventdata, handles)
global srs_data

data  = srs_data;
jSpan = data.jSpan;

Header1 = ['D Retention = ' num2str(data.Dreten,'%8.4e') ' [D/m^2]' ...
           ' | Temperatures Spanned = ' num2str(data.temptr(min(data.jSpan)),'%7.3e')...
                                 ' to ' num2str(data.temptr(max(data.jSpan)),'%7.3e') ];
Header2 = 'Time[s]     Temp[K]     DFlux[D/m^2/s]   HDFlux[HD/m^2/s]   D2Flux[D2/m^2/s]';
Values  = [data.dtList(jSpan),data.temptr(jSpan),data.D_flux(jSpan),...
           data.HDflux(jSpan),data.D2flux(jSpan)];

Var__SRS = get(handles.edit_Var__SRS,'String');
fileName = [Var__SRS '.txt'];

fid = fopen(fileName,'wt');
fprintf(fid,[Header1 '\n']);
fprintf(fid,[Header2 '\n']);
fclose(fid);
dlmwrite(fileName,Values, '-append','delimiter','\t','precision','%8.4e');



%% ========================= END GUI Functions ============================ 






%% ========================================================================
%  ========================= Data Manipulation ============================
%  ========================================================================

function [ MKS ] =  fit_MKS_data(fileName,filter,axPlot,massPk,TDS_AorB)
% store_TDS_mks
%   folderName : grab all the files inside this folder
%   parse the time from the fileNames
%   'Dec_21_2015__11-39-17_AM'
%
%   Fit quadratic to mass 2 and 3 peaks to steady the
%   shifting mass spectra. Assuming a flattop, find the
%   mean partial pressure spanning 2*nn+1 data points.
%
global killFit

warning('off','all')

plotYorN = 'PlotYes';
% plotYorN = 'PlotNo';

%% Define Peaks and Ranges for each mass
% m2Pk  = 2.0100;             % H2 mass
% m3Pk  = 3.0200;             % HD mass  previously 3.0180
% m4Pk  = 4.0380;             % D2 mass  previdusly 4.0320
% m_Pk  = 4.0060;             % He mass

m2Pk  = massPk.H2peak;
m3Pk  = massPk.HDpeak;
m4Pk  = massPk.D2peak;
m_Pk  = massPk.Hepeak;

delPk = 0.2;                % delta mass to separate masses near each peak
 
minPres = 1.0e-15;          %
minWght = 0.999;              % 0.8

nn = 6;                     % flattop span = 2*nn + 1 quick fix from nn = 6

%% Get the MKS File

if     strcmp(TDS_AorB,'TDS_A')
        data = read_MKS_data_A(fileName);
        
elseif strcmp(TDS_AorB,'TDS_B')
        data = read_MKS_data_B(fileName);
end

%% Define TDS storage vector
nLength = length(data.dateTime);

MKS.m2Pres = zeros(nLength,1);               % mass 2 peak pressure
MKS.m3Pres = zeros(nLength,1);
MKS.m4Pres = zeros(nLength,1);
MKS.m_Pres = zeros(nLength,1);
MKS.m2Wght = zeros(nLength,1);               % mass 2 rms error in fit
MKS.m3Wght = zeros(nLength,1);
MKS.m4Wght = zeros(nLength,1);
MKS.m_Wght = zeros(nLength,1);
MKS.dtList = data.dateTime;                  % date/time vector
MKS.temptr = data.temper_K;                  % temperature vector

data.massNumb = data.massNumb/50;            % brings mass to 2,3, and 4
data.partPres = max(0,data.partPres');

%% Define mass range near each peak
mass0 = data.massNumb;
delM  = mass0(2)-mass0(1);
min0  = min(mass0);


[mass0,i0] = sort(mass0);   % Ordering according to mass with i0 as the indices
data.partPres = data.partPres(i0,:); % Reorders the partial press to match the mass order
mass_0 = mass0;

i_2 = find(mass0<(2+delPk) & mass0>(2-delPk));
i_3 = find(mass0<(3+delPk) & mass0>(3-delPk));
i_4 = find(mass0<(4+delPk) & mass0>(4-delPk));

%% Stretch mass axis to completely zoom in and expand all masses to range from 1.5 to 4.5
mass_0(i_2) = 1.5 + 1/length(i_2)*(1:length(i_2));   % Span from 1.5 to 2.5
mass_0(i_3) = 2.5 + 1/length(i_3)*(1:length(i_3));   % Span from 2.5 to 3.5
mass_0(i_4) = 3.5 + 1/length(i_4)*(1:length(i_4));   % Span from 3.5 to 4.5

[~,f2] = min(abs(mass_0-m2Pk));                     % find index that is closest to m2Pk
[~,f3] = min(abs(mass_0-m3Pk));
[~,f4] = min(abs(mass_0-m4Pk));
[~,f_] = min(abs(mass_0-m_Pk));

f2 = f2-nn:f2+nn;                                   % Add 2*nn index values around m2Pk
f3 = f3-nn:f3+nn;
f_ = f_-nn:f_+nn;
f4 = f4-nn:f4+nn;

if2 = find( f2<=i_2(end) & f2>=i_2(1));             % Cutout index values that do not lie in mass2 window
if3 = find( f3<=i_3(end) & f3>=i_3(1));  
if_ = find( f_<=i_4(end) & f_>=i_4(1));  
if4 = find( f4<=i_4(end) & f4>=i_4(1));  

f2 = f2(if2);                         
f3 = f3(if3);
f_ = f_(if_);
f4 = f4(if4);

mass2 = mass_0(f2);           % mass2 is zoomed in near the peak (may not be 2nn+1 length)
mass3 = mass_0(f3);
mass4 = mass_0(f4);
mass_ = mass_0(f_);


%% Setup the correct plotting axes 
axes(axPlot);
killFit = 0;                                    % killFit used to exit the fitting for loop

for ii = 4:nLength-3
    
    if killFit == 1
        break
    end
    
    if strcmp(filter,'Gaussian')
        pPrs_3 = data.partPres(:,ii-3);
        pPrs_2 = data.partPres(:,ii-2);
        pPrs_1 = data.partPres(:,ii-1);
        pPrs00 = data.partPres(:,ii  );
        pPrs01 = data.partPres(:,ii+1);
        pPrs02 = data.partPres(:,ii+2);
        pPrs03 = data.partPres(:,ii+3);
    
        pPrs0  = (pPrs_3+pPrs03)*0.006 + (pPrs_2+pPrs02)*0.061 + ...
                 (pPrs_1+pPrs01)*0.242 +        pPrs00  *0.383;
    else
        pPrs0  = data.partPres(:,ii  );
    end
    %% Find mass nearest each peak and find height of peak    
    pPrs2 = pPrs0(f2);
    pPrs3 = pPrs0(f3);
    pPrs4 = pPrs0(f4);
    pPrs_ = pPrs0(f_);
    
    % Fit Mass Peaks
    [plotPres2,peakPres2,wghtPres2] = fit_quad_to_mass(pPrs2,mass2-m2Pk,f2,[minPres,minWght]);
    [plotPres3,peakPres3,wghtPres3] = fit_quad_to_mass(pPrs3,mass3-m3Pk,f3,[minPres,minWght]);
    [plotPres4,peakPres4,wghtPres4] = fit_quad_to_mass(pPrs4,mass4-m4Pk,f4,[minPres,minWght]);
    [plotPres_,peakPres_,wghtPres_] = fit_quad_to_mass(pPrs_,mass_-m_Pk,f_,[minPres,minWght]);
 
    MKS.m2Pres(ii) = peakPres2;
    MKS.m3Pres(ii) = peakPres3;
    MKS.m4Pres(ii) = peakPres4;
    MKS.m_Pres(ii) = peakPres_;
    MKS.m2Wght(ii) = wghtPres2;
    MKS.m3Wght(ii) = wghtPres3;
    MKS.m4Wght(ii) = wghtPres4;
    MKS.m_Wght(ii) = wghtPres_;
   
    %% Plot for debugging
    minValue = 1e-20;
    
    if strcmp(plotYorN,'PlotYes')
        loglin = 1;

        aa = pPrs0;
        bb = plotPres2;
        cc = plotPres3;
        dd = plotPres4;
        ee = plotPres_;
    
        if loglin == 1    
            ylim([-15.0,-6.5])
            aa = log10(aa);
            bb = log10(max(bb,minValue));
            cc = log10(max(cc,minValue));
            dd = log10(max(dd,minValue));
            ee = log10(max(ee,minValue));
        end
        
        plot(mass_0,aa, 'mo',...
             mass2 ,bb,'r*-',...
             mass3 ,cc,'b*-',...
             mass4 ,dd,'k*-',...
             mass_ ,ee,'g*-',...
             'LineWidth',2.0);       
        n_step = num2str(          ii-3,'%6.0f');
        N_step = num2str(     nLength-6,'%6.0f');
        timeS  = num2str(MKS.dtList(ii),'%8.2f');
%         mass_2 = num2str(       pkMass2,'%5.3f');
        title(['n_{step} = ' n_step ' of ' N_step ...
               ' : time = '  timeS ' [s] '])        
%         title(['n_{step} = ' n_step ' of ' N_step ...
%                ' : time = '  timeS ' [s] '...
%                ' : mass_2 = ' mass_2 ])
        xlim([ 1.5, 4.5])
        ylim([ -14.5,-6.5])
        xlabel('Mass / Charge')
        ylabel('Log_{10}(Partial Pressure) [ T ]')
        box on
        grid on
        pause(0.00001)
        
    end
    % end debugging
    
end

for ii = 1:3
    MKS.m2Pres(ii) = MKS.m2Pres(4);
    MKS.m3Pres(ii) = MKS.m3Pres(4);
    MKS.m4Pres(ii) = MKS.m4Pres(4);
    MKS.m_Pres(ii) = MKS.m_Pres(4);
    MKS.m2Wght(ii) = MKS.m2Wght(4);
    MKS.m3Wght(ii) = MKS.m3Wght(4);
    MKS.m4Wght(ii) = MKS.m4Wght(4);
    MKS.m_Wght(ii) = MKS.m_Wght(4);
end

for ii = nLength-2:nLength
    MKS.m2Pres(ii) = MKS.m2Pres(nLength-3);
    MKS.m3Pres(ii) = MKS.m3Pres(nLength-3);
    MKS.m4Pres(ii) = MKS.m4Pres(nLength-3);
    MKS.m_Pres(ii) = MKS.m_Pres(nLength-3);
    MKS.m2Wght(ii) = MKS.m2Wght(nLength-3);
    MKS.m3Wght(ii) = MKS.m3Wght(nLength-3);
    MKS.m4Wght(ii) = MKS.m4Wght(nLength-3);
    MKS.m_Wght(ii) = MKS.m_Wght(nLength-3);
end

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

function [ SRS ] =  fit_SRS_data(folderName,filter,axPlot,massPk)
% store_TDS_srs
%   folderName : grab all the files inside this folder
%   parse the time from the fileNames
%   'Dec_21_2015__11-39-17_AM'
%
%   Fit quadratic to mass 2 and 3 peaks to steady the
%   shifting mass spectra. Assuming a flattop, find the
%   mean partial pressure spanning 2*nn+1 data points.
%
global killFit

warning('off','all')

plotYorN = 'PlotYes';
% plotYorN = 'PlotNo';

%% Define Peaks and Ranges for each mass
% m2Pk  = 2.035;
% m3Pk  = 3.090;
% m4Pk  = 4.125;

 m2Pk  = massPk.H2peak;
 m3Pk  = massPk.HDpeak;
 m4Pk  = massPk.D2peak;

m2slope = 2.440;

minPres = 1.0e-12;          % Below minPres
minWght = 0.8;

nn = 4;                     % flattop span = 2*nn + 1

%% Get the SRS folder's contents
data = read_SRS_data(folderName);

%% Define TDS storage vector
nLength = length(data.dateTime);

SRS.m2Pres = zeros(nLength,1);               % mass 2 peak pressure
SRS.m3Pres = zeros(nLength,1);
SRS.m4Pres = zeros(nLength,1);
SRS.m2Wght = zeros(nLength,1);               % mass 2 rms error in fit
SRS.m3Wght = zeros(nLength,1);
SRS.m4Wght = zeros(nLength,1);
SRS.dtList = data.dateTime;                  % date/time vector

data.partPres = max(0,data.partPres');

%% Find index values for each range
massN  = data.massNumb;
mTspan = find(massN > 2.00 & massN < 3.00);

%% Find how much the mass spectrum shifts

% % DELETE or REMOVE DEBUGGING
% m2Pk = 39;
% m3Pk = 40;
% m4Pk = 41;
% % Define zoom values
% zoomBgn = 37.5;
% zoomEnd = 41.5;

[~,f2] = min(abs(massN-m2Pk));
[~,f3] = min(abs(massN-m3Pk));
[~,f4] = min(abs(massN-m4Pk));

total_N = floor(max(massN));

% Define zoom values
zoomBgn = 0.5;
zoomEnd = 4.5;

jBgn = 1 + round(zoomBgn*length(massN)/total_N);
jEnd = 1 + round(zoomEnd*length(massN)/total_N);

pPrs  = zeros(jEnd-jBgn+1,nLength);
mass0 = massN(jBgn:jEnd);

[~,j2slope] = min(abs(massN-m2slope)); 

for ii = 1:nLength
    pPrsT = data.partPres(mTspan,ii);
    del_T = log10(pPrsT(2:end))-log10(pPrsT(1:end-1));
    [~,iT]= max(abs(del_T));
    del_f = j2slope-(mTspan(1)+iT);
    pPrs(:,ii) = data.partPres(jBgn-del_f:jEnd-del_f,ii);
%     ii
%     clf
%     semilogy(mass0,pPrs(:,ii))
%     ylim([1e-13,1e-6])
%     xlim([1.75,3.75])
%     title(num2str(del_f))
%     pause(0.04)
end

%% Redefine fitting regime after shift
f2 = f2-jBgn;
f3 = f3-jBgn;
f4 = f4-jBgn;

f2 = f2-nn:f2+nn;                                   % Add 2*nn index values around m2Pk
f3 = f3-nn:f3+nn;
f4 = f4-nn:f4+nn;

mass2 = mass0(f2);
mass3 = mass0(f3);
mass4 = mass0(f4);

%% Setup the correct plotting axes 
axes(axPlot);
killFit = 0;                                    % killFit used to exit the fitting for loop

%%
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

    % Fit Mass Peaks
    [plotPres2,peakPres2,wghtPres2] = fit_quad_to_mass(pPrs2,mass2-m2Pk,f2,[minPres,minWght]);
    [plotPres3,peakPres3,wghtPres3] = fit_quad_to_mass(pPrs3,mass3-m3Pk,f3,[minPres,minWght]);
    [plotPres4,peakPres4,wghtPres4] = fit_quad_to_mass(pPrs4,mass4-m4Pk,f4,[minPres,minWght]);

    SRS.m2Pres(ii) = peakPres2;
    SRS.m3Pres(ii) = peakPres3;
    SRS.m4Pres(ii) = peakPres4;
    SRS.m2Wght(ii) = wghtPres2;
    SRS.m3Wght(ii) = wghtPres3;
    SRS.m4Wght(ii) = wghtPres4;
   
    %% Plot for debugging
    minValue = 1e-20;
    
    if strcmp(plotYorN,'PlotYes')
        loglin = 1;

        aa = pPrs0;
        bb = plotPres2;
        cc = plotPres3;
        dd = plotPres4;
    
        if loglin == 1    
            ylim([-13.0,-6.0])
            aa = log10(aa);
            bb = log10(max(bb,minValue));
            cc = log10(max(cc,minValue));
            dd = log10(max(dd,minValue));
        end    
      
        plot(mass0,aa, 'mo',...
             mass2,bb,'r*-',...
             mass3,cc,'b*-',...
             mass4,dd,'k*-',...
             'LineWidth',3.0);
        xlim([ 1.5, 4.5])
        ylim([-13.0,-6.0])
        xlabel('Mass / Charge')
        ylabel('Log_{10}(Partial Pressure) [ T ]')
        n_step = num2str(          ii-3,'%6.0f');
        N_step = num2str(     nLength-6,'%6.0f');
        timeS  = num2str(SRS.dtList(ii),'%8.2f');
% %         mass_2 = num2str(  m2Pk+pkMass2,'%5.3f');
%         title(['n_{step} = ' n_step ' of ' N_step ...
%                 ' : time = ' timeS ' [s] '...
%               ' : mass_2 = ' mass_2 ])        
        title(['n_{step} = ' n_step ' of ' N_step ...
                ' : time = ' timeS ' [s] '])
        box on
        grid on
        pause(0.00001)
    end
    % end debugging
    
end

for ii = 1:3
    SRS.m2Pres(ii) = SRS.m2Pres(4);
    SRS.m3Pres(ii) = SRS.m3Pres(4);
    SRS.m4Pres(ii) = SRS.m4Pres(4);
    SRS.m2Wght(ii) = SRS.m2Wght(4);
    SRS.m3Wght(ii) = SRS.m3Wght(4);
    SRS.m4Wght(ii) = SRS.m4Wght(4);
end

for ii = nLength-2:nLength
    SRS.m2Pres(ii) = SRS.m2Pres(nLength-3);
    SRS.m3Pres(ii) = SRS.m3Pres(nLength-3);
    SRS.m4Pres(ii) = SRS.m4Pres(nLength-3);
    SRS.m2Wght(ii) = SRS.m2Wght(nLength-3);
    SRS.m3Wght(ii) = SRS.m3Wght(nLength-3);
    SRS.m4Wght(ii) = SRS.m4Wght(nLength-3);
end

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

plot_xx_yy_2(xData*xMax,         yData ,...
             xData*xMax,fitScale(xData),...
             tLb,xLb,yLb,axPlot)
   
if     pOrder == 1
        p1 = 0;
        p2 = fitScale.p1/xMax;
        p3 = fitScale.p2;
elseif pOrder == 2
        p1 = fitScale.p1/xMax/xMax;
        p2 = fitScale.p2/xMax;
        p3 = fitScale.p3;
end

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
% If cocave up or if the peak mass value is outside of mass range then use mean pressure value
if fitQ(1) >= 0  
    peakPres =  mean(pPrs);
    wghtPres =  std(pPrs-peakPres)/peakPres;
    plotPres =  ones(length(f_idx),1)*peakPres;
elseif maxMassVal >= massShifted(end) || maxMassVal <= massShifted(1) && peakPres < minPres
    peakPres =  mean(pPrs);
    wghtPres =  std(pPrs-peakPres)/peakPres;
    plotPres =  ones(length(f_idx),1)*peakPres;
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

function plot_xx_yy_1(xx,yy,tL,xL,yL,axPlot)
axes(axPlot)
plot( xx, yy, 'r*-',...
     'LineWidth',2.0);
xlim([min(xx) max(xx)])
title( tL)
xlabel(xL)
ylabel(yL)
box on

function plot_xx_yy_2(xx1,yy1,xx2,yy2,tL,xL,yL,axPlot)
axes(axPlot)
plot( xx1, yy1, 'ob',...
      xx2, yy2, '-r',...
     'LineWidth',2.0);
xlim([min(xx1) max(xx1)])
title( tL)
xlabel(xL)
ylabel(yL)
box on
grid on

function plot_xx_Lyy_2(xx,yy1,yy2,tL,xL,yL,cL,axPlot)
axes(axPlot)
plot(xx,log10(yy1),'r*-',...
     xx,log10(yy2),   cL,...
     'LineWidth',2.0);
xlim([min(xx) max(xx)])
title( tL)
xlabel(xL)
ylabel(yL)
box on





%% END of TDS GUI Subroutines =============================================






