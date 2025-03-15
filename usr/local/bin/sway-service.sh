#! /bin/sh

# First import environment variables from the login manager
systemctl --user import-environment

# Then start the service
exec systemctl --wait --user start sway.service
