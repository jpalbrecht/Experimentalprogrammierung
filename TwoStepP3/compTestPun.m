i=0; clear tx ypos1 ypos2 xpos2 xpos1 func;
 func{1}=[];

 i=i+1; 
	ypos1{i}=ypost;
    xpos1{i}='center';
	tx{i}='Hier ist nochmals ein kleines Quiz um zu sehen, ob Sie die Instruktionen richtig verstanden haben.\n \n Sollten Sie etwas wichtiges verpasst haben, f�hren wir Sie noch einmal durch die Geldverlust Instruktionen.';
    ypos2{i}=yposm;
    xpos2{i}='center';
    tx2{i}='Sie werden eine Frage mit jeweils 4 Antwortm�glichkeiten gestellt bekommen. Zur Auswahl dr�cken Sie bitte die Tasten 1 bis 4 f�r Ihre pr�ferierte Antwort.';
    func{i}='';
    
 i=i+1; 
	ypos1{i}=ypost;
    xpos1{i}='center';
	tx{i}='Frage 1:  Im zweiten Spielmodus... \n \n ';
    ypos2{i}=yposm;
    xpos2{i}=wdw/100*10;
    tx2{i}='1) ist die Wahrscheinlichkeit zu gennwinnen h�her\n    als im ersten Spielmodus.\n2) ist alles wie in Spielmodus 1,\n    nur dass es darum geht, Verluste zu vermeiden. \n3) ist die Beziehung zwischen grauer Box \n    und farbiger Box komplett unvorhersehbar.\n4) bleibt der Gewinnwert der Boxen �ber die Zeit konstant.';
    func{i}='question=1;getanswer;';
        
i=i+1; 
	ypos1{i}=yposm;
    xpos1{i}='center';
	tx{i}='Wenn Sie sich in Ihrer Antwort sicher sind, dr�cken Sie die Taste J um das Training zu beenden.';
    ypos2{i}=yposm;
    xpos2{i}=wdw/100*10;
    tx2{i}='';
    func{i}='';
    
    
instr_display_comTest;