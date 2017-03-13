function [key,aborted] = getkey(wd);

	[foo,keyCode]=KbStrokeWait;
	key = KbName(keyCode); 
	aborted=0;

	if strcmpi(key,'ESCAPE'); 
		aborted=1; 
		Screen('Fillrect',wd,ones(1,3)*80);
		text='Aborting experiment';
		col=[200 30 0];
		Screen('TextSize',wd,60);
		DrawFormattedText(wd,text,'center','center',col,60);
		error('Pressed ESC --- aborting experiment')
	end
