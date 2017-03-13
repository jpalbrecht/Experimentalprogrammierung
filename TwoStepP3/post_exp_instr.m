i=0; clear tx ypos func;
func{1}=[];

i=i+1; 
	ypos{i}=yposm;
	tx{i}= ['Sie haben ' num2str(payoutRew) ' Euro Im Spielmodus 1 erspielt. Von Ihrem Startwert von ' num2str(punStartValue) ' Euro aus Spielmodus 2 sind nun noch ' num2str(payoutPun) ' übrig. Zusammen haben Sie also ' num2str(payoutRew + payoutPun) ' erspielt. Zum Beenden drücken Sie die Taste J.'];

instr_display;


