#!/bin/bash
rsync -azP --exclude '*bak' .config ~/
rsync -azP .gitconfig .gitconfig.work .zshrc ~/