
rtmp=[1 0 1 1 0 1 1 1 0 1];

for k=1:10
	%......................... Draw left stimulus 
	Screen('DrawTexture',wd,stimSet{1,1}(2,1),[],box(1,:));
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
			elseif strcmp(key,'ESCAPE'); 
				aborted=1;
				Screen('Fillrect',wd,ones(1,3)*80);
				text='Aborting experiment';
				col=[200 30 0];
				Screen('TextSize',wd,60);
				DrawFormattedText(wd,text,'center','center',col,60);
				Screen('TextSize',wd,txtsize);
				error('Pressed abort key --- aborting experiment')
			end
		end

	end
    
	Screen('DrawTexture',wd,stimSet{1,2}(2,1),[],box(1,:));
	Screen('Flip',wd);
	WaitSecs(0.4);

	if   rtmp(k); Screen('DrawTexture',wd,outcome(1),[],boxo);
	else          Screen('DrawTexture',wd,outcome(2),[],boxo);
	end

	% write outcome explicitly, too
	if      rtmp(k)==1
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

txt='Ok, Sie haben 7 von 10 mal gewonnen, und 3 mal verloren.';
DrawFormattedText(wd,txt,'center',yposm,txtcolor,60,[],[],1.3);

getleftrightarrow;
