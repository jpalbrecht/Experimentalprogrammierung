function Exp=  writeWhat(Exp, set, ne, pn, ns)
% ne shows if aversive or neutral pics where loaded
% 1: neutral, 2: aversive. this is randomized in sequence
% for example sequence could be [1 2 2 1]

% pn shwos:: 1: punishment 2: reward. randomized

if (ne == 1)           % neutral
    if (pn(ns)==1)      % punishment
        tmp = ['neutralPunishmentSet' num2str(set)];
        Exp.name = tmp;
        %---------------------------------------------------------------------------
        fprintf(['............. Starting ' tmp ' \n']);
    else                % reward
        tmp = ['neutralRewardSet' num2str(set)];
        Exp.name = tmp;
        %---------------------------------------------------------------------------
        fprintf(['............. Starting ' tmp ' \n']);
    end
else                   % aversive
    if (pn(ns)==1)      % punishment
        tmp = ['aversivePunishmentSet' num2str(set)];
        Exp.name = tmp;
        %---------------------------------------------------------------------------
        fprintf(['............. Starting ' tmp ' \n']);
    else                % reward
        tmp = ['aversiveRewardSet' num2str(set)];
        Exp.name = tmp;
        %---------------------------------------------------------------------------
        fprintf(['............. Starting ' tmp ' \n']);
    end
end
end