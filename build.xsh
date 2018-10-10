#!/bin/xonsh

import yaml

class Project:
  def __init__(self, name, url, branch='master'):
    self.name = name
    self.git_url = url
    self.branch = branch

projects = [
  Project("dav1d", "https://code.videolan.org/videolan/dav1d")
]

def build_project(project):
  build_folder = project.name + '/build'
  ![git clone --recursive --single-branch -b @(project.branch) @(project.git_url) @(project.name)]
  ![meson @(project.name) @(build_folder)]
  ![ninja -C @(build_folder)]

with open('projects.yml', 'r') as f:
  projects = yaml.load(f.read())
  for name,data in projects.items():
    build_project(Project(name, **data))