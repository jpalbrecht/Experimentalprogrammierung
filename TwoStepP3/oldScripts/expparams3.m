%----------------------------------------------------------------------------
%        Experimental Parameters
%        DO NOT MODIFY between subjects within one experiment
%----------------------------------------------------------------------------
% Daw's timing: choice time 2s (2x), stimulus faded on top: 3s (2x), feedback: 1.5s,
% mean jittered ITI (fMRI), one trial: 13.5s

% General parameters of the experiment
if dotraining;	Z.Ntrials = 56;  nt0=9; 	    % number of dotraining trials & actual start trial
else			   Z.Ntrials = 201; nt0=135;        % number of trials  & actual start trial
%else			   Z.Ntrials = 9; nt0=7;        % short testing number of trials  & actual start trial   
end
if debug;      Z.Ntrials = 12;end

Z.p = .7;                                       % probability of correct transition 
Z.max_choice_time       =  2;                   % maximal time to respond sec
% stimulus is shown with a frame at the same position for Z.max_choice_time-reaction time (RT)  
Z.display_choice_ontop  =  1.5;                 % duration to highlight choice with frame in upper panel of display 
Z.display_fb            =  1.5;                 % duration to display feedback
Z.min_display_fix_cross =  1;                   % minimum display of fixation cross 
Z.text_fb_too_slow      = 'Zu langsam!';        % display text if no choice was given
Z.show_missing_sign     = 2;
session  = '3';      % Which session (0, training, first 1-67trail, second 68-134 trail or third session 135-201 trail?)

% Settings for payout 
maxpayout=10; 		  % maximal payout in Euro 
minpayout = 0;      % minimal payout in Euro 
if dotraining == 1; minpayout= 0;end
payoutpertrial=0.2;	% payout per trial (win or loss)

%....................... keys 
KbName('UnifyKeyNames');

%----------------------------------------------------------------------------
%        Keyboard / input device settings 
%----------------------------------------------------------------------------

if doscanner; devicetype = DevicetypeINsideScanner;
else          devicetype = DevicetypeOUTsideScanner;
end

if     strcmpi(devicetype,'keyboard'); % if using keyboard
	keyleft			= 'f';			% left key
	keyright		   = 'j';			% right key
	instrforward	= 'RightArrow';
	instrbackward	= 'LeftArrow';
	usekbqueue     = 1;
elseif strcmpi(devicetype,'lumitouch');	 % for lumitouch device
	keyleft			= '3';		% left key, responsbox
	keyright		   = '8';		% right key, responsbox
	instrforward	= '8';		% index finger of non-dominant hand
	instrbackward	= '3';		% third finger of non-dominant hand
% elseif strcmpi(devicetype,'nnl'); %	 for NNL device
% 	keyleft			= '6';			% left key, responsbox
% 	keyright		= '1';			% right key, responsbox
% 	instrforward = 'b';	% index finger of non-dominant hand
% 	instrbackward  = 'c';	% third finger of non-dominant hand
	usekbqueue     = 1;
elseif strcmpi(devicetype,'currentdesignsINSIDE')
	% two response devices with four buttons each, button numbers for
	% the right hand devices from 1 at the top to four and for
	% the left hand device from 6 at the bottom to 9 at the top
	% number 5 is the fMRI trigger
	keyleft			= '8';			% left key, responsbox
	keyright		   = '3';			% right key, responsbox
	instrforward	= keyright;		% right key for changing instruction page
	instrbackward	= keyleft;		% left key for changing instruction page
	usekbqueue     = 0;
elseif strcmpi(devicetype,'currentdesignsOUTSIDE')
	keyleft			= '1';			% left key, responsbox
	keyright		   = '4';			% right key, responsbox
	instrforward	= keyright;		% right key for changing instruction page
	instrbackward	= keyleft;		% left key for changing instruction page
	usekbqueue     = 1;
else
	error('Unknown device type')
end

% start queue for KbQueueCheck 
if usekbqueue; 
	KbQueueCreate; 
	KbQueueStart; 
end



%----------------------------------------------------------------------------
%        MRI triggers 
%----------------------------------------------------------------------------

if      strcmpi(exploc,'d'); MRITriggerCode	= 's'; 
elseif  strcmpi(exploc,'b'); MRITriggerCode	= '5%'; 
end
NumInitialfMRITriggers	= 4; 
NumFinalfMRITriggers	= 10;


%----------------------------------------------------------------------------
%        ITIs for scanning
%----------------------------------------------------------------------------
% load predefined variable 'ITI_final' containing exponentialy distributed values
% between 1 and 7 (including fixation cross 1s): 
% min 1.015, max 7.000, mean 2.029, total ITI 3.448, total dur: shortversion 35.2730  ("Daw timing"  45.4550)
load('ITI_min0_max6_TwoStep_201.mat'); 
ITI_final = ITI_final(randperm(Z.Ntrials)); 


