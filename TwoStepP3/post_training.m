i=0; clear tx ypos func;
func{1}=[];
 
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Die Übung ist nun zu Ende!';

i=i+1; 
	ypos{i}=yposm;
	tx{i}= ['Wir werden gleich mit dem richtigen Gewinnspiel anfangen. Sie haben jetzt noch einmal die Gelegenheit letzte Fragen zu stellen.'];

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Vielen Dank. Es geht nun gleich los!';

instr_display;