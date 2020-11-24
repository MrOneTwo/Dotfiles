# Defined in - @ line 0
function gcb --description 'alias gcb=git branch | fzf | xargs git checkout'
	git branch | fzf | xargs git checkout $argv;
end
