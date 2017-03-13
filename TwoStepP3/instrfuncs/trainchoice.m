
for k=1:5
	%......................... Draw the two stimuli 
	Screen('DrawTexture',wd,stimT(2,1),[],box(1,:));
	Screen('DrawTexture',wd,stimT(2,2),[],box(2,:));
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
    
	if tmpa==1
		Screen('DrawTexture',wd,stimchT(2,1),[],box(1,:));
		Screen('DrawTexture',wd,stimT  (2,2),[],box(2,:));
	else
		Screen('DrawTexture',wd,stimT  (2,1),[],box(1,:));
		Screen('DrawTexture',wd,stimchT(2,2),[],box(2,:));
	end

	if k==1
		Screen('Flip',wd,[],1);
		WaitSecs(0.5);
		txt='Ok, das gewählte Bild wird immer rot umrahmt. Wählen Sie noch ein paar mal.';
		DrawFormattedText(wd,txt,'center',ypost,txtcolor,60,[],[],1.3);
		Screen('Flip',wd);
		WaitSecs(1.5);
	else
		Screen('Flip',wd);
		WaitSecs(0.5);
	end

end

txt='Ok, drücken Sie die vorwärts Taste, um weiterzumachen. Mit der zurück Taste können Sie das nochmals versuchen.';
DrawFormattedText(wd,txt,'center',yposm,txtcolor,60,[],[],1.3);

getleftrightarrow;
