#!/usr/bin/env bash

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
  git config --replace-all remote.origin.fetch +refs/heads/*:refs/remotes/origin/*
  git fetch
}

commit_log_files() {
  git checkout master
  git add . -- ./logs/*
  git commit --message "Travis download: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-token https://fakuivan:${GH_TOKEN}@github.com/fakuivan/facu-cammesa-logs.git > /dev/null 2>&1
  git push --quiet --set-upstream origin-token master
}

setup_git
commit_log_files
upload_files
