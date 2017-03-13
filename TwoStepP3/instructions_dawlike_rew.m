
i=0; clear tx ypos func;
 func{1}=[];
 
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Wir möchten Ihnen jetzt die Aufgabe erklären. Sie können mit der Taste F vor- und mit der Taste J zurückblättern.';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Es geht darum soviel Geld wie möglich zu gewinnen.';
    
    
i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Jeder Durchgang besteht aus zwei aufeinanderfolgenden Entscheidungen. Sie sehen immer zwei gleichfarbige Kisten, die sich durch eine Figur unterscheiden.\nBei der ersten Entscheidung wählen Sie immer zwischen zwei grauen Kisten:'];
	func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stimSet{1,1}(1,2),[],box(2,:));getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Wenn Sie eine dieser Kisten auspacken, finden Sie kein Geld, aber Sie kommen abhängig von Ihrer Entscheidung häufiger zu jeweils einem Paar farbiger Kisten.'; 
	func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stimSet{1,1}(1,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Zum Beispiel:'];
	func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(2,1),[],box(1,:));Screen(''DrawTexture'',wd,stimSet{1,1}(2,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Hier führt die Entscheidung für die eine graue Kiste\nhäufiger zu einem bestimmten Paar farbiger Kisten...'];
	func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(1,1),[],instrall(3,:));Screen(''DrawTexture'',wd,stimSet{1,1}(2,1),[],instrall(1,:));Screen(''DrawTexture'',wd,stimSet{1,1}(2,2),[],instrall(2,:)); getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['...während die Entscheidung für die andere graue Kiste\n häufiger zu einem anderen Paar farbiger Kisten führt.'];
	func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(1,2),[],instrall(3,:));Screen(''DrawTexture'',wd,stimSet{1,1}(3,1),[],instrall(1,:));Screen(''DrawTexture'',wd,stimSet{1,1}(3,2),[],instrall(2,:)); getleftrightarrow;';
    
i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Dieser Zusammenhang zwischen einer der grauen Kisten \nund den häufigeren, farbigen Kisten bleibt immer gleich!\n\nEs mischt allerdings der Zufall ein wenig mit, sodass die eine graue Kiste nicht immer zu dem einen Paar farbiger Kisten führt und die andere graue Kiste auch nicht immer zu den anderen farbigen Kisten.'];
    func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stimSet{1,1}(1,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Zum Beispiel führt die eine graue Kiste in 7 von 10 Fällen zu den zwei farbigen Kisten und nur in 3 von 10 Fällen zu den anderen farbigen Kisten.'];
    func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stimSet{1,1}(1,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Immer wenn Sie zwei Bilder sehen, haben Sie 2 Sekunden Zeit eines der beiden auszuwählen.\n\nDazu drücken Sie bitte die Taste F für das linke Bild\nund die Taste J für das rechte Bild.'];
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Versuchen Sie das jetzt einige Male:';
	
% Ohne Feedback, ohne Choice 2nd step
i=i+1; 
	ypos{i}=ypost;
	func{i}='instr_steps = 1;set=1;for nt = 1:4;ns=1; twosteptrial; end; getleftrightarrow;';

i=i+1;  
	ypos{i}=yposm;
	tx{i}=['Wie bereits gesagt, dieser Zusammenhang zwischen der ersten Entscheidung und den häufigeren farbigen Kisten bleibt immer gleich!'];

i=i+1;  
	ypos{i}=yposm;
	tx{i}=['Gibt es hierzu bisher Fragen?'];
	            
i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Nur bei den farbigen Kisten können Sie tatsächlich Geld gewinnen. Sind Sie durch Auswahl einer grauen Kiste zu zwei farbigen Kisten gelangt, so müssen Sie sich für eine der beiden farbigen Kisten entscheiden.'];
    func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(2,1),[],box(1,:));Screen(''DrawTexture'',wd,stimSet{1,1}(2,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Kurz nach der Entscheidung erfahren Sie, ob in der Kiste Geld ist (20 Cent)... '];
    func{i}='Screen(''DrawTexture'',wd,outcome(1),[],boxo);[wt]=Screen(wd,''TextBounds'',rew_txt);ypos1=boxo(2)-(1.2*wt(4));[wt]=Screen(wd,''TextBounds'',rew_cent);ypos2=boxo(4)+(1.4*wt(4));DrawFormattedText(wd,rew_txt,''center'',ypos1,rew_col);DrawFormattedText(wd,rew_cent,''center'',ypos2,rew_col);getleftrightarrow;';
       
i=i+1; 
	ypos{i}=ypost;
	tx{i}=['...oder ob die Kiste leer ist (0 Cent).'];
    func{i}='Screen(''DrawTexture'',wd,outcome(2),[],boxo);[wt]=Screen(wd,''TextBounds'',pun_txt);ypos1=boxo(2)-(1.2*wt(4));[wt]=Screen(wd,''TextBounds'',pun_cent);ypos2=boxo(4)+(1.4*wt(4));DrawFormattedText(wd,pun_txt,''center'',ypos1,pun_col);DrawFormattedText(wd,pun_cent,''center'',ypos2,pun_col);getleftrightarrow;';
    
i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Stellen Sie sich vor, dass jede Kiste mit einer bestimmten Chance Geld beinhaltet. Bei der einen Kiste haben Sie zum Beispiel eine Chance von 60% Geld zu finden. Um ein Gefühl hierfür zu entwickeln, werden wir das ausprobieren. Wählen Sie bitte die Kiste ein paar mal aus, indem Sie die Taste F für links drücken.'];
    func{i}='trainprobreward';

i=i+1;
	ypos{i}=yposm;
	tx{i}='Bei der anderen Kiste kann die Chance höher oder niedriger sein Geld zu gewinnen und Sie sollen das herausfinden.';
   
i=i+1;
	ypos{i}=ypost;
	tx{i}='Sie können jetzt 20 mal zwischen zwei Kisten wählen. Versuchen Sie herauszufinden, in welcher Kiste Sie häufiger Geld finden. Ob Sie Geld finden, hängt nur von der Kiste ab, die Sie auspacken und nicht davon, ob die Kiste rechts oder links erscheint.';
    func{i}='identifybetterstim;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Je häufiger Sie sich für diese Kiste entscheiden, desto häufiger gewinnen Sie 20 Cent. Sie sollen immer versuchen die beste Kiste auszupacken.';
    func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(2,1),[],box(1,:));getleftrightarrow;';
    
i=i+1;
	ypos{i}=ypost;
	tx{i}='Später ist das ein wenig schwieriger:\n\n1) Es gibt zwei farbige Paare Kisten:';
    func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';
	
i=i+1;
	ypos{i}=ypost;
	tx{i}='2) Die Chance, dass eine Kiste Geld enthält, verändert sich langsam. Sie kann also langsam höher oder niedriger werden. Das besprechen wir jetzt noch mal genauer.';
    func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Es kann sein, dass eine Kiste am Anfang sehr häufig Geld enthält...';
	func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(2,1),[],box2(3,:));for k=2:4;Screen(''DrawTexture'',wd,instrfig(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.8);end;getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='...dann aber immer seltener.';
	func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(2,1),[],box2(3,:));Screen(''DrawTexture'',wd,instrfig(5),[],instrfigbox);getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Wenn Sie immer diese Kiste auspacken, gewinnen Sie anfangs häufig... ';
	func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(2,1),[],box2(3,:));for k=1:16;Screen(''DrawTexture'',wd,instrfigsamples(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.05);end;getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='...und finden später immer seltener Geld. ';
	func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(2,1),[],box2(3,:));for k=17:32;Screen(''DrawTexture'',wd,instrfigsamples(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.05);end;getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Währenddessen kann es passieren, dass die andere Kiste besser wird, also häufiger Geld enthält.';
	func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(2,1),[],box2(3,:));Screen(''DrawTexture'',wd,stimSet{1,1}(2,2),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(6),[],instrfigbox);getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Und auch das kann sich im weiteren Verlauf wieder verändern.';
	func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(2,1),[],box2(3,:));Screen(''DrawTexture'',wd,stimSet{1,1}(2,2),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='In diesem Fall würden Sie am meisten Geld gewinnen, wenn Sie zuerst immer die eine Kiste auspacken... ';
    func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(2,1),[],box2(3,:));Screen(''DrawTexture'',wd,stimSet{1,1}(2,2),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='...dann eine Weile lang die andere Kiste und am Ende wieder die erste Kiste.';
    func{i}='Screen(''DrawTexture'',wd,stimSet{1,1}(2,1),[],box2(3,:));Screen(''DrawTexture'',wd,stimSet{1,1}(2,2),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

i=i+1;
	ypos{i}=yposm;
	tx{i}='Das ist nur ein Beispiel. Der Verlauf kann auch ganz anders sein. Die Veränderungen sind also unvorhersagbar.\n\nAber die Veränderungen sind recht langsam. Das heißt, dass eine Kiste mindestens ein paar Runden häufig Geld enthält und eine andere Kiste auch für ein paar Runden lang selten Geld enthält.';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Insgesamt gibt es also zwei Paare farbige Kisten (blau und grün), die Geld enthalten können:';
	func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';
	
i=i+1; 
	ypos{i}=yposm;
    tx{i}='Als Zusammenfassung:\nSie entscheiden sich also zuerst für eine der grauen Kisten. Dadurch kommen Sie zu zwei farbigen Kisten und entscheiden sich für eine Kiste, die dann Geld enthält oder nicht.';
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Immer wenn Sie zwei Kisten sehen haben Sie 2 Sekunden Zeit sich für eine der beiden zu entschieden.\n\nDazu drücken Sie bitte die Taste F für die linke Kiste\nund die Taste J für die rechte Kiste.'];
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Bitte üben Sie diesen Ablauf jetzt einige Male.';

% Jetzt komplett (mit vollständigen 2nd step und feedback)
i=i+1; 
	ypos{i}=ypost;
	func{i}='instr_steps = 0;set=1;ns=1;for nt = 5:12;twosteptrial;end;getleftrightarrow;';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Diese Aufgabe ist schwierig. Sie müssen versuchen herauszufinden, welche der vier farbigen Kisten aktuell am häufigsten Geld beinhaltet und diese dann auswählen.\n\nDamit Sie überhaupt zu dieser Kiste gelangen, müssen Sie sich immer erst für eine graue Kiste entscheiden, die Sie häufiger zu der aktuell besten Kiste führt.';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Wieviel Sie verdienen, hängt ein bisschen vom Glück ab,\naber vor allem davon, wie gut Sie auswählen.'; 

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Falls Sie noch Fragen haben, wenden Sie sich bitte jetzt an uns.\nSie können auch mit der Taste F zurückblättern und sich die Anleitungen nochmal anschauen.';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Zur Berechnung Ihres Gewinnes wird am Ende zufällig ein Drittel der Durchgänge bestimmt. Wie oft Sie in diesen gewonnen haben, ergibt Ihren Gewinn. Deshalb ist jeder Durchgang sehr wichtig, denn jeder kann zufällig ausgewählt werden. Diesen Gewinn werden Sie im echten Durchgang auch tatsächlich erhalten.';

instr_display;
