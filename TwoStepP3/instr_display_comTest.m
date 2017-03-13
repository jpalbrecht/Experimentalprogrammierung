if length(func)<i; func{i}=[]; end
Pages = i;
page  = 1;

while 1
	DrawFormattedText(wd,tx{page},xpos1{page},ypos1{page},txtcolor, 60,[],[],1.3);
    DrawFormattedText(wd,tx2{page},xpos2{page},ypos2{page},txtcolor, 60,[],[],1.3);
	if ~isempty(func{page});
		eval(func{page}); % must contain 'getleftrightarrow' command
	else
		getleftrightarrow;
	end
	if page>Pages; break;end
end
