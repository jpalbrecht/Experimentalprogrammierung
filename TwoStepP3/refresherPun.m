i=0; clear tx ypos func;
func{1}=[];

i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Wir fangen jetzt mit dem Spielmodus 2 an, also dem Modus, in dem Sie Geld verlieren k�nnen! Sie starten mit ' num2str(punStartValue) ' Euro.'];

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Es werden neue Kisten erscheinen. Die grauen Kisten f�hren wieder zu den farbigen Kisten';
   
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Die eine graue Kiste f�hrt h�ufiger zu dem einen Paar farbiger Kisten und die andere graue Kiste f�hrt h�ufiger zu dem anderen Paar farbiger Kisten.';

i=i+1; 
	ypos{i}=yposm;
    tx{i}='Dies ver�ndert sich w�hrend des gesamten Gewinnspiels nicht. Aber Sie m�ssen selbst herausfinden, welche graue Kiste �fter zu welchem Paar farbiger Kisten f�hrt.';
    
i=i+1; 
	ypos{i}=yposm;
    tx{i}='Die zwei Paare farbiger Kisten f�hren wiederum zu Verlusten oder nicht. Wie oft jede Kiste verliert, ver�ndert sich langsam.';
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Eine farbige Kiste, die anfangs schlecht war, kann sp�ter gut sein und eine andere farbige Kiste kann in der Mitte des Experiments am besten sein usw.';
 
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Ab jetzt k�nnen Sie tats�chlich Geld verlieren, deshalb ist jeder Durchgang wichtig!';
  
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Sie werden zus�tzlich Hintergrundbilder sehen. Lassen Sie sich dadurch nicht irritieren!';
    


instr_display;
