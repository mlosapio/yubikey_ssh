# Set variables in .bashrc file


if pgrep -l -f "/usr/local/MacGPG2/libexec/shutdown-gpg-agent" 2>/dev/null; then
    kill -9 `cut -d: -f 2 $HOME/.gpg-agent-info | head -n1` 2>/dev/null
    pkill -9 -l -f /usr/local/MacGPG2/libexec/shutdown-gpg-agent
fi

# on OS X with GPGTools, comment out the next line:
if test -f $HOME/.gpg-agent-info && \
    kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info | head -n1` 2>/dev/null; then
    . "${HOME}/.gpg-agent-info"
else
    # No, gpg-agent not available; start gpg-agent
    eval `gpg-agent --enable-ssh-support --daemon --no-grab --write-env-file $HOME/.gpg-agent-info`
    . "${HOME}/.gpg-agent-info"
fi

GPG_TTY=$(tty)
export GPG_TTY
export GPG_AGENT_INFO
export SSH_AUTH_SOCK



# don't forget to change your path correctly!
