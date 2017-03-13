function Result = WaitForMRITrigger(MRITriggerCode, NumberOfTriggers, Display)

if(nargin < 3)
	Display = [];
end

Result				= nan(1, NumberOfTriggers);
CountTriggerInput	= 0;
TrigerCodeConverted = KbName(MRITriggerCode);

while (CountTriggerInput < NumberOfTriggers)
	[touch, secs, keyCode] = KbCheck;

	if ((touch) && (keyCode(TrigerCodeConverted)))
		CountTriggerInput = CountTriggerInput + 1;
		
		if ((~isempty(Display)) && (CountTriggerInput == 1))
% 			drawfixationcross(Display.wd, Display.drmd(2,:), Display.fixationdotsize);
% 			Screen('Flip',Display.wd); 
			Screen('TextSize', Display.wd, Display.txtlarge);
			DrawFormattedText(Display.wd,'+', Display.yposm, Display.yposm, Display.txtcolor);
			Screen('Flip',Display.wd);
			Screen('TextSize', Display.wd, Display.txtsize);

			disp('First Trigger Received!');
		end
			
		Result(CountTriggerInput) = secs;
		
		while ((touch) && (keyCode(TrigerCodeConverted)))
			[touch, secs, keyCode] = KbCheck;
		end
	end
end
