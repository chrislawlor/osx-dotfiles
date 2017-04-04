export PATH=/usr/local/bin:$HOME/bin:/usr/local/mysql/bin:$PATH;
export WORKON_HOME=$HOME/.virtualenvs;
source /usr/local/bin/virtualenvwrapper.sh;

export APPENGINE_SDK_PATH=/usr/local/bin;
export GAE_SDK_ROOT=/Applications/GoogleAppEngineLauncher.app/Contents/Resources/GoogleAppEngine-default.bundle/Contents/Resources/google_appengine/;

export PIP_CACHE=$HOME/.pip/cache;
export PIP_USE_MIRRORS=true;

# Scala
export SCALA_HOME=/usr/local/share/scala;
export PATH=$PATH:$SCALA_HOME/bin;

# Java
export JAVA_HOME=$(/usr/libexec/java_home);
export PATH=${JAVA_HOME}/bin:$PATH;

# Android Studio
export STUDIO_SDK=/Library/Java/JavaVirtualMachines/jdk1.7.0_40.jdk;


# Google Cloud SDK
# export PATH=$HOME/Applications/google-cloud-sdk-0.9.9/bin:$PATH;

# Custom prompt
function parse_git_dirty {
  git branch > /dev/null 2>&1
  if [[ $(echo $?) == "0" ]]
    then [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "⚡"
  fi
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/on \1/"
}

export PS1='\e[0;32m\u@localhost:\w \e[0;35m$(parse_git_branch)\e[0;33m$(parse_git_dirty)\e[m\n$ '


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [[ -f $HOME/.bash_aliases ]]; then
    source $HOME/.bash_aliases;
fi

# Git, because WTF IDK
export PATH=/usr/local/git/bin/:$PATH


# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
