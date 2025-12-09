# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

export PATH="/home/david/.qlot/bin:$PATH"

export http_proxy="http://127.0.0.1:10080"
export https_proxy="http://127.0.0.1:10080"
export all_proxy="http://127.0.0.1:10080"

export EMACS_SOCKET_NAME="/tmp/emacs1000/server"
export EDITOR="emacsclient"

[ -x /usr/bin/fish ] && SHELL=/usr/bin/fish exec fish

