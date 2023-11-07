if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/miniconda3/bin/conda
    eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

pyenv init - | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/feridev/tmp/google-cloud-sdk/path.fish.inc' ]; . '/home/feridev/tmp/google-cloud-sdk/path.fish.inc'; end
