# -*- coding: utf-8 -*-
# export PYTHONSTARTUP=$HOME/.pythonrc.py
import os
import sys


# set python shell working path to git top directory
def _change_working_dir():
  work_dir = os.getcwd()
  while True:
    if os.path.exists(os.path.join(work_dir, '.git')):
      os.chdir(work_dir)
      break
    if work_dir != os.path.dirname(work_dir):
      work_dir = os.path.dirname(work_dir)
    else:
      break
  print('work directory -> {}'.format(os.getcwd()))


def _insert_to_sys_path():
  # insert current work directory to sys.path
  cur_dir = os.getcwd()
  sys.path.insert(-1, cur_dir)
  # remove duplicate items
  path_set = set()
  path_old = sys.path
  sys.path = []
  for p in path_old:
    if p and p in path_set:
      continue
    path_set.add(p)
    sys.path.append(p)
  print('sys path -> {}'.format(sys.path))


if __name__ == '__main__':
  _change_working_dir()
  _insert_to_sys_path()
