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
	tx{i}='Die grauen Kisten f�hren wieder zu den farbigen Kisten.'; 
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Die eine graue Kiste f�hrt h�ufiger zu dem einem Paar farbigen Kisten und die andere graue Kiste f�hrt h�ufiger zu dem anderen Paar farbige Kisten.';

i=i+1; 
	ypos{i}=yposm;
    tx{i}='Dies ver�ndert sich w�hrend des gesamten Gewinnspiels nicht. Aber Sie m�ssen selbst herausfinden, welche graue Kiste �fter zu welchem Paar farbige Kisten f�hrt.';
    
i=i+1; 
	ypos{i}=yposm;
    tx{i}='Die zwei Paare farbige Kisten f�hren wiederum zu Gewinn oder nicht. Wie oft jedes Bild gewinnt, ver�ndert sich langsam.';
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Eine farbige Kiste, die anfangs schlecht war, kann sp�ter gut sein und ein andere farbige Kiste kann in der Mitte des Experiments am besten sein usw.';
 
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Ab jetzt k�nnen Sie tats�chlich Geld gewinnen, deshalb ist jeder Durchgang wichtig!';


instr_display;
