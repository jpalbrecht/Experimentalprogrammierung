i=0; clear tx ypos1 ypos2 xpos2 xpos1 func;
 func{1}=[];

 i=i+1; 
	ypos1{i}=ypost;
    xpos1{i}='center';
	tx{i}='Hier ist nochmals ein kleines Quiz um zu sehen, ob Sie die Instruktionen richtig verstanden haben.\n \n Sollten Sie etwas wichtiges verpasst haben, führen wir Sie noch einmal durch die Geldverlust Instruktionen.';
    ypos2{i}=yposm;
    xpos2{i}='center';
    tx2{i}='Sie werden eine Frage mit jeweils 4 Antwortmöglichkeiten gestellt bekommen. Zur Auswahl drücken Sie bitte die Tasten 1 bis 4 für Ihre präferierte Antwort.';
    func{i}='';
    
 i=i+1; 
	ypos1{i}=ypost;
    xpos1{i}='center';
	tx{i}='Frage 1:  Im zweiten Spielmodus... \n \n ';
    ypos2{i}=yposm;
    xpos2{i}=wdw/100*10;
    tx2{i}='1) ist die Wahrscheinlichkeit zu gennwinnen höher\n    als im ersten Spielmodus.\n2) ist alles wie in Spielmodus 1,\n    nur dass es darum geht, Verluste zu vermeiden. \n3) ist die Beziehung zwischen grauer Box \n    und farbiger Box komplett unvorhersehbar.\n4) bleibt der Gewinnwert der Boxen über die Zeit konstant.';
    func{i}='question=1;getanswer;';
        
i=i+1; 
	ypos1{i}=yposm;
    xpos1{i}='center';
	tx{i}='Wenn Sie sich in Ihrer Antwort sicher sind, drücken Sie die Taste J um das Training zu beenden.';
    ypos2{i}=yposm;
    xpos2{i}=wdw/100*10;
    tx2{i}='';
    func{i}='';
    
    
instr_display_comTest;