% function that randomizes the numbers in a given range. 
% 

function randBlock = randTB(range, numPerBlock, numTrial)
% initialize output
randBlock = zeros(1,(numTrial/numPerBlock));
% states
states = 1:range;
% initial States
[~,randBlock(1:range)] = sort(rand(1,range));
% set stateBefore to last Number in initial states
stateBefore = randBlock(range);
% loop through numTrialTrials
for index=(range+1):range:numTrial/numPerBlock
    % remove statebefore from possible states of current block
    temp = states(states ~= stateBefore);
    % random first Index for next Number of block
    firstNumb = randi(range-1);
    % set first number of current block
    randBlock(index) = temp(firstNumb);
    % delete firstNumber of possible states of current block
    temp(firstNumb) = [];
    % add stateBefore to possible States of current block
    temp = [temp stateBefore];
    % loop throught rest Numbers of current block
    for indx = 2:1:range
        index = index +1;
        % randomize next index
        numb = randi(range-indx+1);
        % set next index
        randBlock(index) = temp(numb);
        % remove index of possible states of current block
        temp(numb) = [];
    end
    % set new statebefore for next loop
    stateBefore = randBlock(index);
end
end