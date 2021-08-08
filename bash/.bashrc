# /opt/homebrew for ARM
# https://docs.brew.sh/Installation
export PATH=/opt/homebrew/bin:$PATH

export TERM=xterm-256color

# Homebrew options

# details available here:
# https://github.com/drduh/macOS-Security-and-Privacy-Guide#homebrew

# opt out of Homebrew's analytics
export HOMEBREW_NO_ANALYTICS=1

# If set, Homebrew will not permit redirects from secure HTTPS to insecure HTTP.
export HOMEBREW_NO_INSECURE_REDIRECT=1

# abort installation of cask if no checksum is defined
export HOMEBREW_CASK_OPTS=--require-sha
. "$HOME/.cargo/env"
