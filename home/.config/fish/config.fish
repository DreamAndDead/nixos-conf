
if status is-interactive
  # https://github.com/MiguelRegueiro/Kitty-and-Fish-terminal-Setup
  fastfetch
  starship init fish | source

  # https://sw.kovidgoyal.net/kitty/shell-integration/
  if set -q KITTY_INSTALLATION_DIR
      set --global KITTY_SHELL_INTEGRATION enabled
      source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
      set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
  end

  # costom
  abbr -a sudo "doas"
  abbr -a sudoedit "doas emacs -nw"
  abbr -a e-update "doas emerge --sync"
  abbr -a e-upgrade "doas emerge --ask --verbose --update --newuse --deep --with-bdeps=y @world"
  abbr -a e-search "emerge --search"
  abbr -a e-versions "equery list -po"
  abbr -a e-install "doas emerge --ask --verbose"
  abbr -a e-remove "doas emerge --ask --verbose --deselect"
  abbr -a e-clean "doas emerge --ask --verbose --depclean"
  abbr -a e-preserve "doas emerge --ask --verbose @preserved-rebuild"
  abbr -a e-repo "eselect repository"
end
