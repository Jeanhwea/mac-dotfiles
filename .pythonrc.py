# -*- coding: utf-8 -*-
# export PYTHONSTARTUP=$HOME/.pythonrc.py
import os
import sys


def _change_working_dir():
  ''' set python shell working path to git top directory. '''
  cwd = os.getcwd()
  while True:
    if os.path.exists(os.path.join(cwd, '.git')):
      os.chdir(cwd)
      break
    if cwd != os.path.dirname(cwd):
      cwd = os.path.dirname(cwd)
    else:
      break
  print('work directory -> {}'.format(os.getcwd()))


def _insert_to_sys_path():
  ''' insert current work directory to sys.path. '''
  paths = sys.path
  sys.path = [os.getcwd()]
  for p in paths:
    if p and len(p) > 0 and os.path.exists(p) and p not in sys.path:
      sys.path.append(p)
  print('sys path -> {}'.format(sys.path))


if __name__ == '__main__':
  _change_working_dir()
  _insert_to_sys_path()
