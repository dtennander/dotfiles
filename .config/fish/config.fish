if status is-interactive
    # Commands to run in interactive sessions can go here
end

status --is-interactive; and jenv init - | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/daten/google-cloud-sdk/path.fish.inc' ]
    . '/Users/daten/google-cloud-sdk/path.fish.inc'
end
eval "$(/opt/homebrew/bin/brew shellenv)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/date/google-cloud-sdk/path.fish.inc' ]
    . '/Users/date/google-cloud-sdk/path.fish.inc'
end

set -gx PATH "/Users/date/.local/bin" $PATH
