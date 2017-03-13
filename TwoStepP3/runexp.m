%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%Main script to run two-step task (modified from Daw et al, 2011) %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;   % Tabula rasa
modifymeTWOSTEP;   % set the subject-specific experimental parameters
expparams;         % experimental parameters *NOT* to be modified between subjects
preps;             % preparations: set up stimulus sequences, left/right etc.

try    % this is important: if there's an error, psychtoolbox will crash graciously
    % and move on to the 'catch' block at the end, where all screens etc are
    % closed.
    
    %if debug == 0; HideCursor; end % hide the mouse cursor
    setup;   % set up the psychtoolbox screen and layout parameters
    % this includes things like positioning of stimuli and
    % loading the stimuli into psychtoolbox
    
    %---------------------------------------------------------------------------
    if  dotraining % do instructions or not
        fprintf('............. Instructions \n');
        % unrandomize punishment/reward 
        % trainingsmodus -> reward first!
        pn = [2 2 1 1];
        T.instr_start = GetSecs;
        correct = 1;
        while correct
            % normal instruction
            instructions_dawlike_rew;
            % comprehension test
            compTestRew;
            % check answers
            if ~(answer{1}~='4' || answer{2}~='2')
                correct = 0;
            else 
                compTestAns;
            end
        end
        correct = 1;
        while correct
            % instruction punishment
            instructions_dawlike_pun;
            % comprehension test
            compTestPun;
            % check answers
            if ~(answer{1}~='2')
                correct = 0;
            else 
                compTestAns;
            end
        end
        
        T.instr_end = GetSecs;
        % reset instruction_steps to 0
        instr_steps = 0;
    else
        T.refresher_start =  GetSecs;
        % time for first refresher
        if pn(1)==2
            refresherRew;
        else
            refresherPun;
        end
        good_luck;
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
        T.time_begin       = T.fMRI_TBegin(end);jjjjj
        T.baseline_start   = T.fMRI_TBegin(end);
        WaitSecs(10);
        ejlse
        T.time_begin = GetSecs;
    end
    
    %---------------------------------------------------------------------------
    fprintf('............. Starting actual experiment \n');
    
    if dotraining == 0; instr_steps = 0; end
    
    T.exp_start = GetSecs;
    for ns = 1:1:4
        % check if training. if: use only trainingSets
        if ~dotraining
            set = ns;
        else
            set = ceil(ns/2);
        end
        % ne shows if aversive or neutral pics where loaded
        % 1: neutral, 2: aversive. this is randomized in sequence
        % for example sequence could be [1 2 2 1]
        ne = sequence(ns);
        % pn shows:: 2: reward 1: punishment. randomized
        eval(['exp_' num2str(ns) '=struct;']);
        eval(['exp_' num2str(ns) '=writeWhat(exp_' num2str(ns) ', set, ne, pn, ns);']);
        eval(['exp_' num2str(ns) '.T_exp_start=GetSecs;']);
        for nt = nt0:Z.Ntrials
            twosteptrial;
        end
        eval(['exp_' num2str(ns) '.T_exp_end=GetSecs;']);
        % save everything important in struct do this afterwards for time
        % measurements!
        eval(['exp_' num2str(ns) '.A=A;']);
        eval(['exp_' num2str(ns) '.S=S;']);
        eval(['exp_' num2str(ns) '.R=R;']);
        eval(['exp_' num2str(ns) '.RT=RT;']);
        eval(['exp_' num2str(ns) '.a_side=a_side;']);
        eval(['exp_' num2str(ns) '.onset_trial=onset_trial;']);
        eval(['exp_' num2str(ns) '.onset_missing_sign=onset_missing_sign;']);
        eval(['exp_' num2str(ns) '.onset_feedback=onset_feedback;']);
        eval(['exp_' num2str(ns) '.onset_dec=onset_dec;']);
        eval(['exp_' num2str(ns) '.onset_dec_mem=onset_dec_mem;']);
        eval(['exp_' num2str(ns) '.onset_cross_var=onset_cross_var;']);
        eval(['exp_' num2str(ns) '.onset_cross_offset_trial=onset_cross_offset_trial;']);
        
        eval(['exp_' num2str(ns) '.lr=lr{1,ns};']);
        eval(['exp_' num2str(ns) '.trans=trans{1,ns};']);
        eval(['exp_' num2str(ns) '.bgStim=randStimBg(ns,:);']);
        eval(['exp_' num2str(ns) '.randomwalkNr=ns;']);
        eval(['exp_' num2str(ns) '.Z=Z;']);
        eval(['exp_' num2str(ns) '.orderRewPun=pn;']);
        eval(['exp_' num2str(ns) '.orderNeuAve=sequence;']);
        
        if ns == 2 & (nt > nt0)
            % give a pause with secret key
            twoStepPauseSecret;
            % time for instruction
            % set Text-Modus to no Background!
            Screen('Preference', 'TextAlphaBlending', 0);
            if pn(ns)==1
                refresherRew;
            else
                refresherPun;
            end
        else
            % give a pause
            if ~dotraining & ns ~=4
                twoStepPause;
            end
        end
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
    
    rand_trials    = randperm(Z.Ntrials);
    payout_trials  = rand_trials(1:Z.Ntrials/3);
    payoutPun = punStartValue; % set to initialValue
    payoutRew = 0; % set to initialValue
    for ns = 1:1:4
        if(pn(ns)==2) % case Reward
             eval(['sumRew=sum(exp_' num2str(ns) '.R(payout_trials));']);
             payoutRew = payoutRew + payoutpertrial*(sumRew);
        else % case Punishment
             eval(['sumPun=length(payout_trials) - sum(exp_' num2str(ns) '.R(payout_trials));']);
             payoutPun = payoutPun - sumPun*payoutpertrial;
        end
    end
    payoutRew=min(max(payoutRew,minpayout),maxpayout); % limit: minpayout to maxpayout
    payoutPun=min(max(payoutPun,minpayout),maxpayout); % limit: minpayout to maxpayout
    
    if dotraining;   post_training;
    else             post_exp_instr;post_exp_instr_nopress;
    end
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
