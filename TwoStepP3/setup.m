fprintf('............ Setting up the screen   \n');

%................... colours (in RBG)
bgcol 		= [0 0 0];	% this is just in grayscale (each value separately)
white 		= [200 200 200];
hard_white  = [255 255 255];
black 		= [0 0 0];
gray1   	= [70 70 70];
red 		= [255 50 50];
blue 		= [120 120 255];
green 		= [30 255 30];
purple		= [148 0 211];
brown		= [205 133 63];
chartreuse 	= [127 255 0];
yellow		= [250 250 50];
purple		= [150 0 150];
txtcolor 	= hard_white;

% General text/stimulus settings for experiment
txtsizefrac = 0.03;                     % text size as fraction of screen height!
blw         = .35;                      % width of stimulus as fraction of **xfrac**
blh         = .35;                      % height of stimulus as fraction of **xfrac**

% The total number of characters allowed per line
if strcmpi(exploc,'b');     TotalCharacterWrap = 50;
elseif strcmpi(exploc,'d'); TotalCharacterWrap = 50;
end

%................... open a screen
AssertOpenGL;
Screen('Preference','Verbosity',0);

if strcmpi(exploc,'d')
    if doscanner; screenNumber = 1;
    else          screenNumber = max(Screen('Screens'));	% select the last monitor.
    end
else
    screenNumber = 0;
end

if debug;
    Screen('Preference','SkipSyncTests',2); % ONLY do this for quick debugging;
    wd=Screen('OpenWindow',0,bgcol(2),[0 0 600 400],[],2,[],[]); % Make small PTB screen on my large screen
else
    Screen('Preference','SkipSyncTests',2);
    %wd=Screen('OpenWindow', screenNumber,bgcol(2),[],[],2,[],[],[]);			% Get Screen. This is always size of the display.
    wd=Screen('OpenWindow', 2,bgcol(2),[],[],2,[],[],[]);
end
KbName('UnifyKeyNames');        % need this for KbName to behave

%---------------------------------------------------------------------------
%                    SCREEN LAYOUT
%---------------------------------------------------------------------------
[wdw, wdh]=Screen('WindowSize', wd);	% Get screen size

%................... Presentation coordinates
xfrac=.6; 			   % fraction of x width to use
yfrac=.6; 			   % fraction of y height to use
xl0=xfrac*wdw; 		% width to use in pixels
yl0=yfrac*wdh; 		% height to use in pixels
x0=(1-xfrac)/2*wdw; 	% zero point along width
y0=(1-yfrac)/2*wdh;	% zero point along height
yposm = 'center';

% adjust text size
txtsize = ceil(wdh * txtsizefrac);
txtlarge = ceil(1.5*txtsize);
Screen('TextSize',wd,txtsize);	% Set size of text

%Main experiment:
%.................... The squares
boxc = x0+round([xl0*1/6 xl0*5/6 xl0*3/6]); % x centres left/right [1 1 0] third of fracdisplay and middle third of disply [0 0 1]
boxc2 = [0 170 170];

% boxlines
box0 = round([-blw*xl0 -blh*xl0 blw*xl0 blh*xl0]/2);

% each box
for k=1:3;
    if k == 3 % middle third box in upper panel of display 25!
        box (k,:) =     box0 + [boxc(k) .25*wdh boxc(k) .25*wdh];	% main, slightly smaller, box
        boxl (k,:) = 1.1*box0 + [boxc(k) .25*wdh boxc(k) .25*wdh];	% slightly larger box
        box2 (k,:) = [0.6*box0 + [boxc2(k) .25*wdh boxc2(k) .25*wdh]]+[0 100 0 100];  % smaller stim1 for instructing probabilities
    else
        box (k,:) =     box0 + [boxc(k) .65*wdh boxc(k) .65*wdh];	% main boxes  65!
        boxl (k,:) = 1.1*box0 + [boxc(k) .65*wdh boxc(k) .65*wdh];	% slightly larger boxes
        box2 (k,:) = [0.6*box0 + [boxc2(k) .65*wdh boxc2(k) .65*wdh]]+[0 45 0 45];	% smaller stim2 for instructing probabilities
    end
end
boxo      = 0.6*box0 + [boxc(3) .6*wdh boxc(3) .6*wdh];	% central box for outcomes

% boxes for neutral or aversive backgroundStimuli: [startW startH endW endH]
boxs(1,:) = [0 0 wdw/2 wdh/2];
boxs(2,:) = [wdw/2 0 wdw wdh/2];
boxs(3,:) = [0 wdh/2 wdw/2 wdh];
boxs(4,:) = [wdw/2 wdh/2 wdw wdh];
%.................... load stimuli
if dotraining
    stimSet = cell(2,3);
    % load trainingsset1
    for k=1:2
        eval(['tmp=imread(''imgs/setT1/gray' num2str(4+k) '.png'');']);      	stimT  (1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/setT1/blue' num2str(k)   '.png'');']);        stimT  (2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/setT1/green' num2str(k) '.png'');']);         stimT  (3,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/setT1/gray' num2str(4+k) '_chosen.png'');']); stimchT(1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/setT1/blue' num2str(k)   '_chosen.png'');']); stimchT(2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/setT1/green' num2str(k) '_chosen.png'');']);  stimchT(3,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/setT1/gray' num2str(4+k) '_fade.png'');']); 	stimfaT(1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/setT1/blue' num2str(k)   '_fade.png'');']);   stimfaT(2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/setT1/green' num2str(k) '_fade.png'');']);    stimfaT(3,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/setT1/gray_both.png'');']);                   stimboth(1)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/setT1/blue_both.png'');']);                   stimboth(2)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/setT1/green_both.png'');']);                  stimboth(3)=Screen('MakeTexture',wd,tmp);
    end
    % save Trainingsset 1
    stimSet{1,1} = stimT;
    stimSet{1,2} = stimchT;
    stimSet{1,3} = stimfaT;
%     % load trainingsset2
%     for k=1:2
%         eval(['tmp=imread(''imgs/setT2/gray' num2str(6+k) '.png'');']);      	stimT  (1,k)=Screen('MakeTexture',wd,tmp);
%         eval(['tmp=imread(''imgs/setT2/rosa' num2str(k)   '.png'');']);        stimT  (2,k)=Screen('MakeTexture',wd,tmp);
%         eval(['tmp=imread(''imgs/setT2/green' num2str(k) '.png'');']);         stimT  (3,k)=Screen('MakeTexture',wd,tmp);
%         eval(['tmp=imread(''imgs/setT2/gray' num2str(6+k) '_chosen.png'');']); stimchT(1,k)=Screen('MakeTexture',wd,tmp);
%         eval(['tmp=imread(''imgs/setT2/rosa' num2str(k)   '_chosen.png'');']); stimchT(2,k)=Screen('MakeTexture',wd,tmp);
%         eval(['tmp=imread(''imgs/setT2/green' num2str(k) '_chosen.png'');']);  stimchT(3,k)=Screen('MakeTexture',wd,tmp);
%         eval(['tmp=imread(''imgs/setT2/gray' num2str(6+k) '_fade.png'');']); 	stimfaT(1,k)=Screen('MakeTexture',wd,tmp);
%         eval(['tmp=imread(''imgs/setT2/rosa' num2str(k)   '_fade.png'');']);   stimfaT(2,k)=Screen('MakeTexture',wd,tmp);
%         eval(['tmp=imread(''imgs/setT2/green' num2str(k) '_fade.png'');']);    stimfaT(3,k)=Screen('MakeTexture',wd,tmp);
%     end
%     % save Trainingsset 2
%     stimSet{2,1} = stimT;
%     stimSet{2,2} = stimchT;
%     stimSet{2,3} = stimfaT;
else
    % load other sets
    stimSet = cell(4,3);
    % load set 1:
    for k=1:2
        eval(['tmp=imread(''imgs/set' num2str(1) '/gray_' num2str(k)  '_' num2str(1) '.png'');']);        stim  (1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(1) '/orange' num2str(k) '.png'');']);                         stim  (2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(1) '/purple' num2str(k) '.png'');']);                         stim  (3,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(1) '/gray_' num2str(k)  '_' num2str(1) '_chosen.png'');']); stimch(1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(1) '/orange' num2str(k) '_chosen.png'');']);                  stimch(2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(1) '/purple' num2str(k) '_chosen.png'');']);                  stimch(3,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(1) '/gray_' num2str(k)  '_' num2str(1) '_fade.png'');']);   stimfa(1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(1) '/orange' num2str(k) '_fade.png'');']);                    stimfa(2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(1) '/purple' num2str(k) '_fade.png'');']);                    stimfa(3,k)=Screen('MakeTexture',wd,tmp);
    end
    % save set 1
    stimSet{1,1} = stim;
    stimSet{1,2} = stimch;
    stimSet{1,3} = stimfa;
    % load set 2:
    for k=1:2
        eval(['tmp=imread(''imgs/set' num2str(2) '/gray_' num2str(k)  '_' num2str(2) '.png'');']);        stim  (1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(2) '/turk' num2str(k)   '.png'');']);                         stim  (2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(2) '/yellow' num2str(k) '.png'');']);                         stim  (3,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(2) '/gray_' num2str(k)  '_' num2str(2) '_chosen.png'');']); stimch(1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(2) '/turk' num2str(k)   '_chosen.png'');']);                  stimch(2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(2) '/yellow' num2str(k) '_chosen.png'');']);                  stimch(3,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(2) '/gray_' num2str(k)  '_' num2str(2) '_fade.png'');']);   stimfa(1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(2) '/turk' num2str(k)   '_fade.png'');']);                    stimfa(2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(2) '/yellow' num2str(k) '_fade.png'');']);                    stimfa(3,k)=Screen('MakeTexture',wd,tmp);
    end
    % save set 2
    stimSet{2,1} = stim;
    stimSet{2,2} = stimch;
    stimSet{2,3} = stimfa;
    % load set 3:
    for k=1:2
        eval(['tmp=imread(''imgs/set' num2str(3) '/gray_' num2str(k)  '_' num2str(3) '.png'');']);        stim  (1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(3) '/beige' num2str(k)   '.png'');']);                        stim  (2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(3) '/brown' num2str(k) '.png'');']);                          stim  (3,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(3) '/gray_' num2str(k)  '_' num2str(3) '_chosen.png'');']); stimch(1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(3) '/beige' num2str(k)   '_chosen.png'');']);                 stimch(2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(3) '/brown' num2str(k) '_chosen.png'');']);                   stimch(3,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(3) '/gray_' num2str(k)  '_' num2str(3) '_fade.png'');']);   stimfa(1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(3) '/beige' num2str(k)   '_fade.png'');']);                   stimfa(2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(3) '/brown' num2str(k) '_fade.png'');']);                     stimfa(3,k)=Screen('MakeTexture',wd,tmp);
    end
    % save set 3
    stimSet{3,1} = stim;
    stimSet{3,2} = stimch;
    stimSet{3,3} = stimfa;
    % load set 4:
    for k=1:2
        eval(['tmp=imread(''imgs/set' num2str(4) '/gray_' num2str(k)  '_' num2str(4) '.png'');']);        stim  (1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(4) '/cyanBlue' num2str(k)   '.png'');']);                         stim  (2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(4) '/salmon' num2str(k) '.png'');']);                         stim  (3,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(4) '/gray_' num2str(k)  '_' num2str(4) '_chosen.png'');']); stimch(1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(4) '/cyanBlue' num2str(k)   '_chosen.png'');']);                  stimch(2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(4) '/salmon' num2str(k) '_chosen.png'');']);                  stimch(3,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(4) '/gray_' num2str(k)  '_' num2str(4) '_fade.png'');']);   stimfa(1,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(4) '/cyanBlue' num2str(k)   '_fade.png'');']);                    stimfa(2,k)=Screen('MakeTexture',wd,tmp);
        eval(['tmp=imread(''imgs/set' num2str(4) '/salmon' num2str(k) '_fade.png'');']);                    stimfa(3,k)=Screen('MakeTexture',wd,tmp);
    end
    % save set 4
    stimSet{4,1} = stim;
    stimSet{4,2} = stimch;
    stimSet{4,3} = stimfa;


    % Load background stimuli
    % neutral
    for i=1:1:50
        eval(['tmp=imread(''imgs/bg/neutral/neu (' num2str(i)  ').jpg'');']);
        stimbg  (1,i)=Screen('MakeTexture',wd,tmp);
    end

    % negative
    for i=1:1:50
        eval(['tmp=imread(''imgs/bg/negative/neg (' num2str(i)  ').jpg'');']);
        stimbg  (2,i)=Screen('MakeTexture',wd,tmp);
    end
end

% Load non-punishment stimuli
eval(['tmp=imread(''imgs/euro20_black.png'');' ]);	outcome(1)=Screen('MakeTexture',wd,tmp);
eval(['tmp=imread(''imgs/noout.png'');']);	outcome(2)=Screen('MakeTexture',wd,tmp);
rew_txt  = 'Gewonnen!';
rew_cent = ['+ 20 Cent'];
rew_col  = green;
pun_txt  = 'Kein Gewinn.';
pun_cent = ['0 Cent'];
pun_col  = red;

% Load Punishment stimuli
eval(['tmp=imread(''imgs/euro20_black_cross.png'');' ]);	outcomePun(2)=Screen('MakeTexture',wd,tmp);
eval(['tmp=imread(''imgs/noout.png'');']);			outcomePun(1)=Screen('MakeTexture',wd,tmp);
pun_txtPun  = 'Verloren!';
pun_centPun = ['- 20 Cent'];
pun_colPun  = red;
rew_txtPun  = 'Kein Verlust.';
rew_centPun = ['+- 0 Cent'];
rew_colPun  = green;


%For instructions:
%.................... Arrows

eval(['tmp=imread(''imgs/arrows.tif'');'])
tmp(tmp==255)=bgcol(2);
arrow=Screen('MakeTexture',wd,tmp);
arrowsquare(1,:)=[wdw*.84 wdh*.92 wdw*.98 wdh*.98];

%.................... Instructions positions
addpath('instrfuncs');
yposm = 'center'; ypost = .1*wdh; ypostt=.05*wdh;

%.................... load graphs
for k=0:6;
    eval(['tmp=imread(''instrfuncs/samplefig' num2str(k)   '.jpg'');']); instrfig(1,k+1)=Screen('MakeTexture',wd,tmp);
end
for k=1:32
    eval(['tmp=imread(''instrfuncs/samplefig4_' num2str(k)   '.jpg'');']); instrfigsamples(1,k)=Screen('MakeTexture',wd,tmp);
end

%.................... box for graphs & instruction figures
tmp = size(tmp);
tmpy = yl0;
tmpx = ceil(yl0*tmp(2)/tmp(1));
instrfigbox = [wdw/2-tmpx/2 wdh/2-tmpy/2 wdw/2+tmpx/2 wdh/2+tmpy/2];
instrboth(1,:) = ceil([  wdw/3-blw*xl0/1.4 wdh/2-blw*xl0/2.2        wdw/3+blw*xl0/1.4     wdh/2+blw*xl0/2.2]);
instrboth(2,:) = ceil([2*wdw/3-blw*xl0/1.4 wdh/2-blw*xl0/2.2      2*wdw/3+blw*xl0/1.4     wdh/2+blw*xl0/2.2]);
instrboth(3,:) = ceil([  wdw/2-blw*xl0/1.4 wdh/2-blw*xl0/2.2        wdw/2+blw*xl0/1.4     wdh/2+blw*xl0/2.2]);
% each box for instructions with all stimuli (1st-->2nd step)
for k=1:3;
    if k == 3 % middle third box in upper panel of display
        instrall(k,:) =     box0 + [boxc(k) .40*wdh boxc(k) .40*wdh];	% main, slightly smaller, box
    else
        instrall(k,:) =     box0 + [boxc(k) .75*wdh boxc(k) .75*wdh];	% main boxes
    end
end
% monitor frame rate
[monitorFlipInterval nrValidSamples stddev] = Screen('GetFlipInterval', wd);