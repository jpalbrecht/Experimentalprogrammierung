i=0; clear tx ypos1 ypos2 xpos2 xpos1 func;
 func{1}=[];

 i=i+1; 
	ypos1{i}=ypost;
    xpos1{i}='center';
	tx{i}='Hier ist noch ein kleines Quiz um zu sehen ob Sie die Instruktionen richtig verstanden haben.\n \n Sollten Sie etwas wichtiges verpasst haben, f�hren wir Sie noch einmal durch die Instruktionen.';
    ypos2{i}=yposm;
    xpos2{i}='center';
    tx2{i}='Sie werden 2 Fragen mit jeweils 4 Antwortm�glichkeiten gestellt bekommen. Zur Auswahl dr�cken Sie bitte die Tasten 1 bis 4 f�r Ihre pr�ferierte Antwort.';
    func{i}='';
    
 i=i+1; 
	ypos1{i}=ypost;
    xpos1{i}='center';
	tx{i}='Frage 1:  Ver�ndert sich der Gewinnwert einer Box mit der Zeit? \n \n ';
    ypos2{i}=yposm;
    xpos2{i}=wdw/100*10;
    tx2{i}='1) Ich wei� nicht \n2) Nein, einige Boxen sind gut, andere schlecht.\n    Das �ndert sich nicht. \n3) Nein, Geldm�nzen werden zuf�llig verteilt. \n    Keine der Boxen ist gut oder schlecht. \n4) Ja, es ver�ndert sich mit der Zeit. ';
    func{i}='question=1;getanswer;';
    
i=i+1; 
	ypos1{i}=ypost;
    xpos1{i}='center';
	tx{i}='Frage 2: Ver�ndert sich die Chance, dass eine bestimmte graue Box zu einer bestimmten farbigen Box f�hrt mit der Zeit? \n \n ';
    ypos2{i}=yposm;
    xpos2{i}=wdw/100*10;
    tx2{i}='1) Ich wei� nicht \n2) Nein, die Chance ist zirka bei 70%.\n    Sie �ndert sich nicht. \n3) Nein, die Beziehung zwischen grauer Box\n    und farbiger Box ist komplett unvorhersehbar. \n4) Ja, es ver�ndert sich mit der Zeit ';
    func{i}='question=2;getanswer;';
    
i=i+1; 
	ypos1{i}=yposm;
    xpos1{i}='center';
	tx{i}='Wenn Sie sich in Ihrer Antwort sicher sind dr�cken Sie die Taste J um mit dem Training forzufahren.';
    ypos2{i}=yposm;
    xpos2{i}=wdw/100*10;
    tx2{i}='';
    func{i}='';
    
    
instr_display_comTest;