%  This script allows you to edit the H2 (m2Pres) signal for saturated SRS
%   and replaces part of the SRS signal with the MKS signal
%
% Load and fit both MKS and SRS data first
%% Put breakpoint at line 695 to stop pushbutton for select data in "D Background Fit"
%
% function   pushbutton_SlctData_Callback(hObject, eventdata, handles)
% global axBck
% global axFnl
% global mks_data
% global srs_data
% 
% ChooseMKS = get(handles.radiobutton_ChooseMKS,'Value');
% ChooseSRS = get(handles.radiobutton_ChooseSRS,'Value');
% 
% Scale__D2 = get(handles.radiobutton_Scale__D2,'Value');
% Scale__HD = get(handles.radiobutton_Scale__HD,'Value');
%
% --> Break here, after the Scale__HD line
%
%%
% Click on "Select Data" button in the GUI so that the breakpoint is hit.
% Then, run the present code.

% plot(mks_data.dtList,mks_data.m2Pres,'b.',srs_data.dtList,srs_data.m2Pres,'ro')
mksTOsrs = interp1(mks_data.dtList,mks_data.m2Pres,srs_data.dtList);
figure(101)
plot(srs_data.dtList,mksTOsrs*20,'b.',srs_data.dtList,srs_data.m2Pres,'ro')

% choose a time to start and end area you want to fit
time0 = 3445;
time1 = 6323;

[~,idx0] = min(abs(time0-srs_data.dtList));
[~,idx1] = min(abs(time1-srs_data.dtList));

xx = idx0:idx1;       % area we want to match
[aa,bb,cc] = scale_back(mksTOsrs,srs_data.m2Pres,srs_data.m2Wght,xx,1,axBck);
figure(102)
plot(srs_data.dtList,mksTOsrs*bb+cc,'b.',srs_data.dtList,srs_data.m2Pres,'ro')

% choose a time to start and end area the replacement area
time0 = 2276;
time1 = 6323;

[~,idx0] = min(abs(time0-srs_data.dtList));
[~,idx1] = min(abs(time1-srs_data.dtList));

xx2 = idx0:idx1;
srs_data.m2Pres2 = srs_data.m2Pres;
srs_data.m2Pres2(xx2) = mksTOsrs(xx2)*bb+cc;
figure(103)
plot(srs_data.dtList,srs_data.m2Pres2,'b.',srs_data.dtList,srs_data.m2Pres,'ro')

prompt='if good fit, type 1 : ';
goodfit = input(prompt);
if goodfit == 1
    srs_data.m2Pres = srs_data.m2Pres2;
end
