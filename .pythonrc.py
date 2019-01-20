# -*- coding: utf-8 -*-
# export PYTHONSTARTUP=$HOME/.pythonrc.py
import os

# set python shell working path to git top directory
__wdir = os.getcwd()
while True:
  if os.path.exists(os.path.join(__wdir, '.git')):
    os.chdir(__wdir)
    break
  if __wdir != os.path.dirname(__wdir):
    __wdir = os.path.dirname(__wdir)
  else:
    break
# display a prompt message
print('>>> os.chdir("{}")'.format(__wdir))
