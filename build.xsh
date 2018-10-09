#!/bin/xonsh

class Project:
  def __init__(self, name, git_url, branch='master'):
    self.name = name
    self.git_url = git_url
    self.branch = branch

projects = [
  Project("dav1d", "https://code.videolan.org/videolan/dav1d")
]

def build_project(project):
  build_folder = project.name + '/build'
  ![git clone --single-branch -b @(project.branch) @(project.git_url) @(project.name)]
  ![meson @(project.name) @(build_folder)]
  ![ninja -C @(build_folder)]

for p in projects:
  build_project(p)