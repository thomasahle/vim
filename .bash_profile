# Mac uses bash_profile instead of bashrc
export BASH_SILENCE_DEPRECATION_WARNING=1
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
