6%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%Main script to run two-step task (modified from Daw et al, 2011) %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;   % Tabula rasa

modifymeTWOSTEP;   % set the subject-specific experimental parameters
expparams2;         % experimental parameters *NOT* to be modified between subjects
preps;             % preparations: set up stimulus sequences, left/right etc. 


try    % this is important: if there's an error, psychtoolbox will crash graciously
       % and move on to the 'catch' block at the end, where all screens etc are
       % closed. 

   if debug == 0; HideCursor; end % hide the mouse cursor 
   setup;   % set up the psychtoolbox screen and layout parameters 
            % this includes things like positioning of stimuli and 
            % loading the stimuli into psychtoolbox 

   %---------------------------------------------------------------------------
   if  dotraining % do instructions or not 
      fprintf('............. Instructions \n');
      T.instr_start = GetSecs;
      instructions_dawlike;
      T.instr_end = GetSecs;
   else
      T.refresher_start =  GetSecs;
      %refresher;
      %good_luck; 
      T.refresher_end = GetSecs;
   end
  
   %---------------------------------------------------------------------------
   fprintf('............. Waiting for scanner trigger\n');
   if doscanner
      DrawFormattedText(wd,'Gleich geht''s los ...','center', 'center', txtcolor);
      Screen('Flip',wd);
      
      Display.wd         = wd;
      Display.yposm      = yposm;
      Display.txtcolor   = txtcolor;
      Display.txtlarge   = txtlarge;
      Display.txtsize    = txtsize;
      
      T.fMRI_TBegin      = WaitForMRITrigger(MRITriggerCode, NumInitialfMRITriggers, Display);
      T.time_begin       = T.fMRI_TBegin(end);
      T.baseline_start   = T.fMRI_TBegin(end);
      WaitSecs(10);
   else
      T.time_begin = GetSecs;
   end

   %---------------------------------------------------------------------------
   fprintf('............. Starting actual experiment \n');

   if dotraining == 0; instr_steps = 0; end

   T.exp_start = GetSecs;
   for nt = nt0:Z.Ntrials
      twosteptrial;
   end
   T.exp_end = GetSecs;

   %---------------------------------------------------------------------------
   fprintf('............. Acquiring final volumes / Baseline\n');

   Screen('TextSize',wd,txtlarge);
   DrawFormattedText(wd,'+','center','center',txtcolor);
   Screen('TextSize',wd,txtsize);
   T.baseline_end = Screen('Flip',wd);

   if doscanner % acquiring additional volumes
      T.fMRI_TEnd = WaitForMRITrigger(MRITriggerCode, NumFinalfMRITriggers);
   else
      WaitSecs(5-monitorFlipInterval); % 5 sec baseline before experiment ends
   end 
   
   %---------------------------------------------------------------------------
   fprintf('............. payout & end of experiment \n');

   if dotraining
      rand_trials    = randperm(Z.Ntrials);
      rand_trials    = rand_trials(rand_trials>8);
      payout_trials  = rand_trials(1:(Z.Ntrials-8)/3);
   else
       rand_trials    = randperm(Z.Ntrials);
       payout_trials  = rand_trials(1:Z.Ntrials/3);
   end
   payout=min(max(payoutpertrial*(sum(R(payout_trials))),minpayout),maxpayout); % limit: 0 to maxpayout
   save('filename2_sjind.mat','R');
   %if dotraining;   post_training;
   %else             post_exp_instr;
   %end
   T.end = GetSecs;
    
   %---------------------------------------------------------------------------
	if dosave; 
		fprintf('saving all in two separate files\n');
		eval(['save data' filesep namestring_short  '.mat']);
		eval(['save data' filesep namestring_long '.mat']);
	end
   
   ShowCursor; % show the mouse cursor again 
   Screen('CloseAll');
    
    %----------------------------------------------------------------------
catch % execute this if there's an error, or if we've pressed the escape key

   if aborted==0;    % if there was an error
      fprintf(' ******************************\n')
      fprintf(' **** Something went WRONG ****\n')
      fprintf(' ******************************\n')
      if dosave; eval(['save data/' namestring_long  '.crashed.mat;']);end
   elseif aborted==1; % if we've abored by pressing the escape key
      fprintf('                               \n')
      fprintf(' ******************************\n')
      fprintf(' **** Experiment aborted ******\n')
      fprintf(' ******************************\n')
      if dosave; eval(['save data/' namestring_long  '.aborted.mat;']);end
   end
   Screen('CloseAll'); % close psychtoolbox, return screen control to OSX
   rethrow(lasterror)
   psychrethrow(psychlasterror)
   ShowCursor; % show the mouse cursor again 
end
