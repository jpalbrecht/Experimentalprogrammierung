Z.Ntrial = 8;
dsigma=0.02;
randomwalk=.25+.5*rand(4,1);
for t=2:Z.Ntrial
 	tmp = randomwalk(:,t-1)+dsigma*randn(4,1);
 	i=tmp<.25; tmp(i) =  .5-tmp(i);
 	i=tmp>.75; tmp(i) = 1.5-tmp(i);
 	randomwalk(:,t)=tmp; 
end
plot(randomwalk');