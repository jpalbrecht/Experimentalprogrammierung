
i=0; clear tx ypos func;
 func{1}=[];
 
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Nachdem Sie erfolgreich den ersten Part verinnerlicht haben, nun noch eine Besonderheit.\nEs wird neben dem eben vorgestellten Spielmodus noch einen weiteren geben.';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Die Aufgabe �ndert sich nicht, lediglich der Gewinn. In diesem zweiten Spielmodi geht es darum, m�glichst wenig Geld zu verlieren.';
    
    
i=i+1; 
	ypos{i}=ypost;
	tx{i}='Also: Jeder Durchgang besteht wie zuvor aus den zwei aufeinanderfolgenden Entscheidungen.\nKurz nach der zweiten Entscheidung erfahren Sie diesmal jedoch, ob die Kiste leer ist (0 Cent) ...';
    func{i}='Screen(''DrawTexture'',wd,outcomePun(1),[],boxo);[wt]=Screen(wd,''TextBounds'',rew_txtPun);ypos1=boxo(2)-(1.2*wt(4));[wt]=Screen(wd,''TextBounds'',pun_cent);ypos2=boxo(4)+(1.4*wt(4));DrawFormattedText(wd,rew_txtPun,''center'',ypos1,rew_colPun);DrawFormattedText(wd,rew_centPun,''center'',ypos2,rew_colPun);getleftrightarrow;';
    
i=i+1; 
	ypos{i}=ypost;
	tx{i}=['...oder ob Sie Geld verloren haben! (-20 Cent)...'];
    func{i}='Screen(''DrawTexture'',wd,outcomePun(2),[],boxo);[wt]=Screen(wd,''TextBounds'',pun_txtPun);ypos1=boxo(2)-(1.2*wt(4));[wt]=Screen(wd,''TextBounds'',pun_centPun);ypos2=boxo(4)+(1.4*wt(4));DrawFormattedText(wd,pun_txt,''center'',ypos1,pun_colPun);DrawFormattedText(wd,pun_centPun,''center'',ypos2,pun_colPun);getleftrightarrow;';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Sie haben jetzt noch mal die M�glichkeit ein wenig zu testen. Dr�cken Sie die Taste J um zu beginnen.';   
    
i=i+1; 
	ypos{i}=ypost;
	func{i}='instr_steps = 0;set=1;ns=3;for nt = 13:18;twosteptrial;end;getleftrightarrow;';
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Zur Erinnerung: Die Chance, dass Sie bei einer Kiste kein Geld verlieren, ver�ndert sich auch hier langsam. Sie kann also langsam h�her oder niedriger werden.\n '];

i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Sie starten mit einem Geldbetrag von ' num2str(punStartValue) ' Euro. Zur Berechnung Ihres Verlusts wird am Ende zuf�llig ein Drittel der Durchg�nge bestimmt. Diese werden vom Startwert abgezogen. Deshalb ist auch hier wieder jeder Durchgang sehr wichtig, denn jeder kann zuf�llig ausgew�hlt werden. Diesen Verlust werden Sie im echten Durchgang auch tats�chlich von Ihrem Startwert abgezogen bekommen.'];

instr_display;
