#!/bin/xonsh

import yaml
import sys
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-b", "--do-build", action='store_true', help="Starts the build.")
parser.add_argument("-r", "--receipe",  help="Build receipe.")
args = parser.parse_args()



class Project:
  def __init__(self, name, url, branch='master'):
    self.name = name
    self.git_url = url
    self.branch = branch

def build_project(project):
  build_folder = project.name + '/build'
  ![git clone --recursive --single-branch -b @(project.branch) @(project.git_url) @(project.name)]
  ![meson @(project.name) @(build_folder)]
  ![ninja -C @(build_folder)]

if args.do_build:
  ![pip3 install git+https://github.com/mesonbuild/meson]
  with open(args.receipe, 'r') as f:
    projects = yaml.load(f.read())
    for name,data in projects.items():
      build_project(Project(name, **data))