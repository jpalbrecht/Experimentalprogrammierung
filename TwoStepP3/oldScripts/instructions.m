 i=0; clear tx ypos func;
 func{1}=[];
 
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Wir m�chten Ihnen jetzt die Aufgabe erkl�ren. Sie k�nnen mit der rechten und linken Taste vor- und zur�ck bl�ttern.';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Es geht darum soviel Geld wie m�glich zu gewinnen.';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Jeder Durchgang besteht aus zwei aufeinanderfolgenden Entscheidungen. Bei der ersten entscheiden Sie sich zwischen zwei grauen Bildern:'];
	func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(1,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Diese Entscheidung f�hrt Sie zu einem farbigen Paar von Bildern, zum Beispiel:'];
	func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(2,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Hier f�hrt die Entscheidung f�r das eine graue Bild\nh�ufiger zu dem einen farbigen Paar...'];
	func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],instrall(3,:));Screen(''DrawTexture'',wd,stim(2,1),[],instrall(1,:));Screen(''DrawTexture'',wd,stim(2,2),[],instrall(2,:)); getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['...w�hrend die Entscheidung f�r das andere graue Bild\n h�ufiger zu dem anderen farbigen Paar f�hrt.'];
	func{i}='Screen(''DrawTexture'',wd,stim(1,2),[],instrall(3,:));Screen(''DrawTexture'',wd,stim(3,1),[],instrall(1,:));Screen(''DrawTexture'',wd,stim(3,2),[],instrall(2,:)); getleftrightarrow;';
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Dieser Zusammenhang zwischen einem der grauen Bilder\nund dem h�ufigeren farbigen Bilderpaar bleibt immer gleich!\n\nEs mischt allerdings der Zufall ein wenig mit, so dass das eine graue Bild nicht immer zu dem h�ufigeren farbigen Bilderpaar f�hrt und das andere graue Bild auch nicht immer zu dem anderen farbigen Bilderpaar.'];

i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Immer wenn Sie zwei Bilder sehen haben Sie 2 Sekunden Zeit eines der beiden auszuw�hlen.\n\nDazu dr�cken Sie bitte die linke Taste  f�r das linke Bild\nund die rechte Taste f�r das rechte Bild.'];
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Versuchen Sie das jetzt einige Male:';
	
% Ohne Feedback, ohne Choice 2nd step
i=i+1; 
	ypos{i}=ypost;
	func{i}='instr_steps = 1;for nt = 1:4; twosteptrial; end; getleftrightarrow;';

i=i+1;  
	ypos{i}=yposm;
	tx{i}=['Wie bereits gesagt, dieser Zusammenhang zwischen der erster Entscheidung und dem h�ufigeren farbigen Bilderpaar bleibt immer gleich!'];

i=i+1;  
	ypos{i}=yposm;
	tx{i}=['Gibt es hierzu bisher Fragen?'];

i=i+1;  
	ypos{i}=yposm;
	tx{i}=['Jetzt werden wir uns mit den farbigen Bilderpaaren besch�ftigen und wie Sie tats�chlich Geld gewinnen k�nnen.'];
            
i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Sie sehen ein farbiges Bilderpaar und entscheiden sich f�r eines von beiden:'];
    func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(2,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Kurz nach der Entscheidung bekommen Sie eine R�ckmeldung. Entweder wird das gew�hlte Symbol mit 20 Cent belohnt...'];
    func{i}='Screen(''DrawTexture'',wd,outcome(1),[],boxo);[wt]=Screen(wd,''TextBounds'',rew_txt);ypos1=boxo(2)-(1.5*wt(4));[wt]=Screen(wd,''TextBounds'',rew_cent);ypos2=boxo(4)+(1.4*wt(4));DrawFormattedText(wd,rew_txt,''center'',ypos1,rew_col);DrawFormattedText(wd,rew_cent,''center'',ypos2,rew_col);getleftrightarrow;';
    
i=i+1; 
	ypos{i}=ypost;
	tx{i}=['...oder Sie erhalten keine Belohnung, also 0 Cent.'];
    func{i}='Screen(''DrawTexture'',wd,outcome(2),[],boxo);[wt]=Screen(wd,''TextBounds'',pun_txt);ypos1=boxo(2)-(1.5*wt(4));[wt]=Screen(wd,''TextBounds'',pun_cent);ypos2=boxo(4)+(1.4*wt(4));DrawFormattedText(wd,pun_txt,''center'',ypos1,pun_col);DrawFormattedText(wd,pun_cent,''center'',ypos2,pun_col);getleftrightarrow;';
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Meistens gewinnen Sie bei einem der Bilder h�ufiger.'];
    
i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Ein Bild hat zum Beispiel eine Chance von 60% zu gewinnen. Um ein Gef�hl hierf�r zu entwickeln, werden wir das ausprobieren. W�hlen Sie das Bild ein paar mal (indem Sie die linke Taste  dr�cken).'];
    func{i}='trainprobreward';


i=i+1;
	ypos{i}=ypost;
	tx{i}='Bei anderen Bildern ist die Chance h�her oder niedriger und Sie sollen das herausfinden.\n\nSie k�nnen jetzt 20 mal zwischen zwei Bildern w�hlen. Versuchen Sie herauszufinden, welches Bild besser ist. Ob Sie gewinnen oder nicht h�ngt nur davon ab, welches Bild Sie w�hlen und nicht etwa davon, ob es rechts oder links erscheint.';
    func{i}='identifybetterstim;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Je �fters Sie dieses Bild gew�hlt haben, desto �fters haben Sie gewonnen. Sie versuchen immer das beste Bild zu w�hlen.';
    func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));getleftrightarrow;';
    
i=i+1;
	ypos{i}=ypost;
	tx{i}='Sp�ter ist das ein wenig schwieriger:\n\n1) Es gibt zwei farbige Bilderpaare.';
    func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';
	
i=i+1;
	ypos{i}=yposm;
	tx{i}='2) Die H�ufigkeit der Gewinne jedes Bildes ver�ndert sich langsam. Ein gutes Bild kann also langsam schlechter und dann wieder besser werden. Das besprechen wir jetzt noch mal genauer.';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Nehmen Sie z.Bsp. wieder das Bild von vorher. Im Beispiel war die Chance zu gewinnen immer 60%.' ;
	func{i}='Screen(''DrawTexture'',wd,instrfig(1),[],instrfigbox);getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='In Wirklichkeit k�nnte es jetzt aber sein, dass ein Bild Anfangs mit hoher Wahrscheinlichkeit gewinnt,';
	func{i}='for k=2:4;Screen(''DrawTexture'',wd,instrfig(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.8);end;getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='aber dann schlechter wird.';
	func{i}='Screen(''DrawTexture'',wd,instrfig(5),[],instrfigbox);getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Wenn Sie immer dieses Bild w�hlen, gewinnen Sie anfangs h�ufig,';
	func{i}='for k=1:16;Screen(''DrawTexture'',wd,instrfigsamples(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.05);end;getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='sp�ter aber seltener.';
	func{i}='for k=17:32;Screen(''DrawTexture'',wd,instrfigsamples(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.05);end;getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Es k�nnte sein (muss aber nicht!), dass das andere Bild schlecht anf�ngt, aber dann besser wird.';
	func{i}='Screen(''DrawTexture'',wd,instrfig(6),[],instrfigbox);getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Und dass sich das am Ende wieder ver�ndert...';
	func{i}='Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

i=i+1;
	ypos{i}=yposm;
	tx{i}='In diesem Fall w�rden Sie am meisten Geld gewinnen, wenn Sie anfangs das eine Bild w�hlten, dann eine Weile lang zum anderen wechselten, und am Ende wieder zum ersten zur�ck kommen w�rden.';

i=i+1;
	ypos{i}=yposm;
	tx{i}='Dies sind aber nur Beispiele. Es sind alle Zeitverl�ufe m�glich, alle Bilder k�nnen langsam besser oder schlechter werden.';

i=i+1;
	ypos{i}=yposm;
	tx{i}='Die Ver�nderungen sind also fast unvorhersagbar. Aber die Ver�nderungen sind recht langsam. Das heisst, dass ein gutes Bild wahrscheinlich mindestens ein paar Runden weiter gut sein wird und ein mittelm�ssiges auch ein paar Runden lang mittelm�ssig bleiben wird.';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Als Zusammenfassung:\n\nEs gibt zwei farbige Bildpaare (blau und pink), die variabel zu Gewinn f�hren:';
	func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';
	
i=i+1;
	ypos{i}=ypost;
	tx{i}='Je nach dem welches der zwei grauen Bilder Sie ausgew�hlt haben sehen Sie h�ufiger eines der zwei farbigen Paare:'; 
	func{i}='Screen(''DrawTexture'',wd,stimboth(1),[],instrboth(3,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Sie entscheiden sich also zuerst f�r eines der grauen Bilder. Darauf folgen entweder zwei blaue oder zwei pinke Bilder. Dann entscheiden Sie sich f�r eines dieser zwei farbigen Bilder und gewinnen Geld oder nicht.';

i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Immer wenn Sie zwei Bilder sehen haben Sie 2 Sekunden Zeit eines der beiden auszuw�hlen.\n\nDazu dr�cken Sie bitte die linke Taste f�r das linke Bild\nund die rechte Taste f�r das rechte Bild.'];
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Bitte �ben Sie diesen Ablauf jetzt einige Male.';

% Jetzt komplett (mit vollst�ndigen 2nd step und feedback)
i=i+1; 
	ypos{i}=ypost;
	func{i}='instr_steps = 0;for nt = 5:8;twosteptrial;end;getleftrightarrow;';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Diese Aufgabe ist schwierig. Sie m�ssen versuchen herauszufinden, welches der vier farbigen Bilder aktuell am besten ist und diese dann ausw�hlen.\n\nDamit Sie das aktuell beste farbige Bilder �berhaupt w�hlen k�nnen,\nm�ssen Sie das graue Bild w�hlen, welches h�ufiger zu dem entsprechenden farbigen Bilderpaar f�hrt.';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Wieviel Sie verdienen h�ngt ein bisschen von Gl�ck ab,\naber vor allem davon, wie gut Sie ausw�hlen.'; 

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Falls Sie noch Fragen haben, wenden Sie sich bitte jetzt an uns.\nSie k�nnen auch mit der linken Taste zur�ckbl�ttern und sich die Anleitungen nochmals anschauen.';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Wir m�chten jetzt sicher stellen, dass Sie alles verstanden haben.\nBitte erkl�ren Sie dem Versuchsleiter, was Ihre Aufgabe rist.\nDr�cken Sie dann die rechte Taste um mit einem �bungsdurchgang zu beginnen. Dieser dauert ca. 9min.';

instr_display;

