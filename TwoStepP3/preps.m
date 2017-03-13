%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% Setup %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

aborted=0; % if this parameter is set to one, things will abort. 

% make sure we use different random numbers
rand('twister',sum(1000*clock));

%....................... Saving

namestring_short = ['TS_' subjn '_'  type   '_P' num2str(projectGroup) '_s' num2str(session)]; % simplified name string 
namestring_long  = ['TS_' subjn '_' type  '_P' num2str(projectGroup) '_s' num2str(session) '_' datestr(now,'_yymmdd_HHMM')]; % detailed name string

% namestring_short = ['TS_P' project '_' type '_' subjn '_' session ];                             % simplified name string
% namestring_long  = ['TS_P' project '_' type '_' subjn '_' session '_' name '_' datestr(now,'_yymmdd_HHMM')]; % detailed name string

if dotraining;
	namestring_short	= [namestring_short '_training'];
    namestring_long	= [namestring_long  '_training'];
end      

if exist('data')~=7; eval(['!mkdir data']); end % make 'data' folder if dosn't exist

if dosave 
	fprintf('............ Data will be saved as                              \n');
	fprintf('............ %s and %s \n', namestring_long, namestring_short);
	fprintf('............ in the folder ''data''\n');
end

%......................... load random walks from Daw et al. 2011 
if dotraining
   load ('randomwalks/randomwalk_1st_8.mat'); 
   rewprob{1,1} = rand(2,2,length(randomwalk_1st_8))<randomwalk_1st_8;	% draw random bits 
   load ('randomwalks/dawtrainingrandomwalks.mat'); 
   rewprob{1,1}(:,:,9:58) = rand(2,2,length(dawtrainingrandomwalks))<dawtrainingrandomwalks;	% draw random bits    
   rewprob{1,3} = rewprob{1,1};
else
    %load other randomwalks
    for i=1:1:4
        eval(['load(''randomwalks/randomwalks' num2str(i) '.mat'');']);
        rewprob{1,i} = rand(2,2,length(dawrandomwalks))<dawrandomwalks;
    end
end


%......................... pre-assign some variables 
for i=1:1:4
    lr{1,i} = (rand(3,Z.Ntrials)>0.5)+1;			        % left or right 
    trans{1,i} = rand(1,Z.Ntrials)<Z.p; 			        % noise for transition from state 1
end

% pseudorandom sequence for trials in instructions (1:8)
if dotraining;
	trans{1,1}(1:18)     = [1 1 0 1 1 1 1 0 0 1 0 1 1 0 0 1 1 1]; 
	%trans(nt0:end) = rand(1,Z.Ntrials)<Z.p; 
end 
S = [ones(1,Z.Ntrials); zeros(1,Z.Ntrials)];    % state sequence

%empty vectors: 
R = zeros(1,Z.Ntrials);                             
G = zeros(1,Z.Ntrials);                               
RT = zeros(2,Z.Ntrials);                     
onset_trial = zeros(2,Z.Ntrials);
onset_dec   = zeros(2,Z.Ntrials);
onset_dec_mem = zeros(2,Z.Ntrials);
onset_feedback = zeros(1,Z.Ntrials);    
onset_missing_sign = zeros(2,Z.Ntrials);

% get BackgroundStimuli randomisation
for i=1:1:4
    randStimBg(i,:) = randTB(50,1,100);
end
% randomize punishment-aversive/punishment-negative/
% non-punishment-aversive/non-punishment-negative
[foo,i1] = sort(rand(1,2));
[foo,i2] = sort(rand(1,2));
sequence = [i1 i2];
% randomize punishment/non-punishment which comes first
[foo,pn] = sort(rand(1,2));
tmp = repmat(pn(1),1,2);
pn = [tmp repmat(pn(2),1,2)];
% %......................... generate random walks
% dsigma=0.02;
% randomwalk=.25+.5*rand(4,1);
% for t=2:Z.Ntrial
% 	tmp = randomwalk(:,t-1)+dsigma*randn(4,1);
% 	i=tmp<.25; tmp(i) =  .5-tmp(i);
% 	i=tmp>.75; tmp(i) = 1.5-tmp(i);
% 	randomwalk(:,t)=tmp;
% end
% plot(randomwalk');
