alias vim="/opt/homebrew/bin/vim"
alias vi="vim"
alias ealias="vim ~/.bash_aliases"
alias ralias="source ~/.bash_aliases"

alias egit='git config -e --global'
alias essh="vim ~/.ssh/config"

alias ml="cd ~/projects/learnsmth/ml"
alias bks='cd $HOME/bks'
alias egrep='egrep --color=auto'
alias elc='cd ~/projects/elance'
alias fgrep='fgrep --color=auto'
alias frl='cd ~/projects/freelance'
alias myw='cd ~/projects/mywork'
alias grep='grep --color=auto'
alias g='grep'
alias c='cd'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias llh='ls -alFh'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias eidea='vim ~/projects/makesmth/todolist.rst'

alias cdgo='cd $GOPATH'

alias godocs='godoc -http=:6606 & sensible-browser http://localhost:6606/'

alias TF='|tail -f 20'
alias toggl='cd ~/soft/TogglDesktop && ./TogglDesktop'
alias zedit='vim ~/.zshrc'
alias rzrc='source ~/.zshrc'
alias djrun='./manage.py runserver_plus'

alias extradev='ssh schat-dev "tmux attach -t api"'
alias pyt='python -m timeit '
alias dserve='python -m SimpleHTTPServer 3003'
alias extrarun='cd ~/Dropbox/projects/ext/sportchat/extra_sync && workon extra && python manage.py runserver -p 5050'
alias extrades='cd ~/soft/api-designer-master && grunt server'

alias lightsoff='sudo xset dpms force off'

alias dirsz='du -s `pwd`/* | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'
alias hh='history | egrep -i'
alias p='ping 8.8.8.8 -A'
alias pwg='pwgen -cnB 8 10 | while read PASS; do echo -n -e "$PASS\t"; echo -n "$PASS" | md5sum | cut -f1 -d" "; done'

alias pcat='pygmentize -g'
alias adhoc='cd ~/projects/ext/adhoc'
alias wadhoc='adhoc && dup'
alias ochs='cd ~/Dropbox/projects/ext/adhoc/1ch-backend && workon 1ch-backend && export SIMPLE_SETTINGS=och_backend.config,instance.local'
alias task_api='adhoc && cd br-pub-api && workon br-pub-api && export TASK_API_CFG="cfg/local.cfg"'

# docker
alias dup='docker-compose up'
alias dbuild='docker-compose build'
# Kill all running containers.
alias dockerkillall='docker kill $(docker ps -q)'

# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'

# Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
alias dockercleanv='printf "\n>>> Deleting unused volumes\n\n" &&  docker volume rm $(docker volume ls -qf dangling=true)'

# Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc || true && dockercleani && dockercleanv'

alias 1w='ssh 1ch-work'
alias kor="ssh nalg -t 'tmux a;bash -l'"
alias vgolf='vimgolf put'

alias ts='date +%s'
alias pU='pip install -U'
alias pI='pip install'
alias pR='pip install -r requirements.txt'
alias condapi='PIP_REQUIRE_VIRTUALENV=false pip install'
alias setvenv='echo `basename "$PWD"` > .python-version'

alias socks="ssh -D 1337 -f -C -q -N nalg && networksetup -setsocksfirewallproxy \"Wi-Fi\" localhost 1337 && myip"
alias rsocks="ps aux|grep 1337"
alias ksocks="networksetup -setsocksfirewallproxystate \"Wi-Fi\" off && myip"
alias gg="git grep"
alias gbr="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias runjupyter="cd /Users/snoopt/projects/mywork/notebooks && conda activate fastai && jupyter lab"
alias venv="pyenv virtualenv 3.9.1 `basename "$PWD"` && echo `basename "$PWD"` > .python-version"
alias gitdryclean='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse "$branch^{tree}") -p $mergeBase -m _)) == "-"* ]] && echo "$branch is merged into master and can be deleted"; done'
alias gitclean='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse "$branch^{tree}") -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
