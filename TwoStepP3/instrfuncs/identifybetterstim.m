
tmplr=(rand(1,20)>.5)+1;

for k=1:20
	%......................... Draw the two stimuli 
	Screen('DrawTexture',wd,stimSet{1,1}(2,1),[],box(  tmplr(k),:));
	Screen('DrawTexture',wd,stimSet{1,1}(2,2),[],box(3-tmplr(k),:));
	Screen('Flip',wd);

	if usekbqueue	           % KbQueue is more accurate for USB devices
		KbQueueFlush; KbQueueStart; 
	end
	while 1
		if usekbqueue
			[KeyIsDown,KeyCode] = KbQueueCheck; 
		else
			[KeyIsDown, foo, KeyCode] = KbCheck;
		end
		if KeyIsDown; 
			key = KbName(KeyCode);
			if iscell(key); key=key{1}; end
			if     strcmp(key(1),keyleft ); tmpa = 1; break;% left was chosen 
			elseif strcmp(key(1),keyright); tmpa = 2; break;% right was chosen 
			end
		end

	end

	tmpa = (tmplr(k)==1) * tmpa + (tmplr(k)==2)*(3-tmpa);
    
	if tmpa==1
		Screen('DrawTexture',wd,stimSet{1,2}(2,1),[],box(  tmplr(k),:));
		Screen('DrawTexture',wd,stimSet{1,1}  (2,2),[],box(3-tmplr(k),:));
		rtmp = rand>0.25;
	else
		Screen('DrawTexture',wd,stimSet{1,1}  (2,1),[],box(  tmplr(k),:));
		Screen('DrawTexture',wd,stimSet{1,2}(2,2),[],box(3-tmplr(k),:));
		rtmp = rand<=0.25;
	end
	Screen('Flip',wd);
	WaitSecs(0.5);

	if   rtmp; Screen('DrawTexture',wd,outcome(1),[],boxo);
	else       Screen('DrawTexture',wd,outcome(2),[],boxo);
	end

	% write outcome explicitly, too
	if      rtmp==1
		text1='Gewonnen!';
		text2=['+ 20 Cent'];
		ocol=green;
	else
		text1='Kein Gewinn!';
		text2=['0 Cent'];
		ocol=red;
	end
	[wt]=Screen(wd,'TextBounds',text1); ypos1=boxo(2)-(1.5*wt(4));
	[wt]=Screen(wd,'TextBounds',text2); ypos2=boxo(4)+(1.3*wt(4));
	DrawFormattedText(wd,text1,'center',ypos1,ocol);     
	DrawFormattedText(wd,text2,'center',ypos2,ocol);     
	Screen('Flip',wd);
	WaitSecs(1.5);

end

txt='Dies war das bessere Bild:';
Screen('DrawTexture',wd,stimSet{1,1}(2,1),[],box(1,:));
DrawFormattedText(wd,txt,'center',ypost,txtcolor,60,[],[],1.3);

getleftrightarrow;
