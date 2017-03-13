i=0; clear tx ypos func;
func{1}=[];

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Wir fangen jetzt mit dem wirklichen Gewinnspiel an!';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Es ist alles wie zuvor, nur dass wir jetzt mit neuen Kisten anfangen.';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Die grauen Kisten führen wieder zu den farbigen Kisten.'; 
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Die eine graue Kiste führt häufiger zu dem einem Paar farbigen Kisten und die andere graue Kiste führt häufiger zu dem anderen Paar farbige Kisten.';

i=i+1; 
	ypos{i}=yposm;
    tx{i}='Dies verändert sich während des gesamten Gewinnspiels nicht. Aber Sie müssen selbst herausfinden, welche graue Kiste öfter zu welchem Paar farbige Kisten führt.';
    
i=i+1; 
	ypos{i}=yposm;
    tx{i}='Die zwei Paare farbige Kisten führen wiederum zu Gewinn oder nicht. Wie oft jedes Bild gewinnt, verändert sich langsam.';
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Eine farbige Kiste, die anfangs schlecht war, kann später gut sein und ein andere farbige Kiste kann in der Mitte des Experiments am besten sein usw.';
 
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Ab jetzt können Sie tatsächlich Geld gewinnen, deshalb ist jeder Durchgang wichtig!';


instr_display;
