i=0; clear tx ypos func;
func{1}=[];

i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Wir fangen jetzt mit dem Spielmodus 2 an, also dem Modus, in dem Sie Geld verlieren können! Sie starten mit ' num2str(punStartValue) ' Euro.'];

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Es werden neue Kisten erscheinen. Die grauen Kisten führen wieder zu den farbigen Kisten';
   
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Die eine graue Kiste führt häufiger zu dem einen Paar farbiger Kisten und die andere graue Kiste führt häufiger zu dem anderen Paar farbiger Kisten.';

i=i+1; 
	ypos{i}=yposm;
    tx{i}='Dies verändert sich während des gesamten Gewinnspiels nicht. Aber Sie müssen selbst herausfinden, welche graue Kiste öfter zu welchem Paar farbiger Kisten führt.';
    
i=i+1; 
	ypos{i}=yposm;
    tx{i}='Die zwei Paare farbiger Kisten führen wiederum zu Verlusten oder nicht. Wie oft jede Kiste verliert, verändert sich langsam.';
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Eine farbige Kiste, die anfangs schlecht war, kann später gut sein und eine andere farbige Kiste kann in der Mitte des Experiments am besten sein usw.';
 
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Ab jetzt können Sie tatsächlich Geld verlieren, deshalb ist jeder Durchgang wichtig!';
  
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Sie werden zusätzlich Hintergrundbilder sehen. Lassen Sie sich dadurch nicht irritieren!';
    


instr_display;
