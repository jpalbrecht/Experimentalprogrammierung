
%--------------------------------------------------------------------------
%        MAIN FILE TO EDIT
%        This is the only file that should demand any changes!!!
%--------------------------------------------------------------------------
fprintf('............ Setting basic parameters according to \n')
fprintf('............            MODIFYME.M\n'); 
fprintf('............ \n')

debug       = 0;

%--------------------------------------------------------------------------
%        If set doscanner=1, exp will wait for the first trigger 
%                            of the MR scanner and keys are different
%        If set doscanner=0, then do training + instructions 
%--------------------------------------------------------------------------
doscanner   = 0;   % 0: outside scanner 
                   % 1: inside the scanner 

%--------------------------------------------------------------------------
%        Choose between training session (outside the scanner) and
%                       main session (inside the scanner)
%--------------------------------------------------------------------------

dotraining   = 0;   % 0: main experimental session
                    % 1: training session 
  
projectGroup       = 3;  % just for saving. Indicates Project research Group

%--------------------------------------------------------------------------
%        To save or not to save
%        This should ALWAYS be set to 1 when doing experiments obviously
%--------------------------------------------------------------------------
dosave   = 1;      % save output? 

%--------------------------------------------------------------------------
%        Patient Information 
%--------------------------------------------------------------------------
project  = '1';     % Project ID - either '1' or '2' 
type     = 'C';     % should be always 'C'! Do not change. only saving reasons
name     = 'NA';    % Subject initials *** have to be in single quotes ***
payment  = 1;       % is this subject being paid / should payment info be displayed
                    % at the end? 
subjn    = '00000';  % Subject Number. This number has to be > 1000 
                    % *** subject number has to be in single quotes ***
age      = 33;      % subject's age in years 
sex      = 'f';     % subject's sex; 'm' = male; 'f' = female
                    % please make sure this is a string, i.e. in single quotes
exploc   = 'b';     % 'b' for berlin, 'd' for dresden. Change only for fMRI reasons

%--------------------------------------------------------------------------
%        Input device type & handedness inside and outside the scanner
%        Device can be: 'keyboard', 'lumitouch', 
%                        'currentdesignsINSIDE' or 'currentdesignsOUTSIDE'
%--------------------------------------------------------------------------
DevicetypeOUTsideScanner   = 'keyboard';  % Please do not change unless you
                                          % know what you do
DevicetypeINsideScanner    = 'currentdesignsINSIDE';  

%--------------------------------------------------------------------------
%        EXPERIMENT VERSION 
%        PLEASE check this is correct! 
%--------------------------------------------------------------------------
expversion = 'twostep-5.1.120716';
