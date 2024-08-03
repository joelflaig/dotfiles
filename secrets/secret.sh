nvim "$@"
gpg --symmetric "$@"
gpg --decrypt "$@"".gpg"
rm "$@"
