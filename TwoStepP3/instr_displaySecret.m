if length(func)<i; func{i}=[]; end
Pages = i;
page  = 1;

while 1
	DrawFormattedText(wd,tx{page},'center',ypos{page},txtcolor, TotalCharacterWrap,[],[],1.3);
	if ~isempty(func{page});
		eval(func{page}); % must contain 'getleftrightarrow' command
	else
		getSecretKey;
	end
	if page>Pages; break;end
end
