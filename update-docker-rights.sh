#!/bin/sh

# Updates the rights and ownership of the files created inside docker from root to the current user

sudo chown -R $USER:$USER .
sudo chmod -R ug+rw .
