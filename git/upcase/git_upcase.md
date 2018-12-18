# Mastering Git

git init

HEAD is the working directory

touch readme.md

now, uncommited changes

git status

git add .
git commit -m "Initial commit"

git status, all good

now we are in the master

you should show the commit hash

touch other.md
dirty repo

# always be commiting

# stash command

take your working directory, grab them away

when u don't want to commit cuz your tests are broken, but u have to go to another branch and fix a bug

git stash

by default, ignores untracked files

echo "hello world" >> readme.md

git stash

Last login: Fri Dec 14 14:30:13 on ttys003
ll%                                                                                                                                                             
 albert@mac  ~/localDocuments/CodingArea/tutorials/git/upcase   master ●  ll                                                                      [2.4.4]
total 8
-rw-r--r--  1 albert  staff  578 Dec 14 15:04 git_upcase.md
 albert@mac  ~/localDocuments/CodingArea/tutorials/git/upcase   master ●  ll                                                                      [2.4.4]
total 8
-rw-r--r--  1 albert  staff  578 Dec 14 15:04 git_upcase.md
 albert@mac  ~/localDocuments/CodingArea/tutorials/git/upcase   master ●  mkdir practice                                                          [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/tutorials/git/upcase   master ●  cd practice                                                             [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/tutorials/git/upcase/practice   master ●  ll                                                             [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/tutorials/git/upcase/practice   master ●  touch readme.md                                                [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/tutorials/git/upcase/practice   master ●  touch other.md                                                 [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/tutorials/git/upcase/practice   master ●  cd ..                                                          [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/tutorials/git/upcase   master ●  ll                                                                      [2.4.4]
total 8
-rw-r--r--  1 albert  staff  578 Dec 14 15:04 git_upcase.md
drwxr-xr-x  4 albert  staff  128 Dec 14 15:04 practice
 albert@mac  ~/localDocuments/CodingArea/tutorials/git/upcase   master ●  cd ..                                                                   [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/tutorials/git   master ●  ll                                                                             [2.4.4]
total 0
drwxr-xr-x  5 albert  staff  160 Dec 14 15:04 upcase
 albert@mac  ~/localDocuments/CodingArea/tutorials/git   master ●  cd ..                                                                          [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/tutorials   master ●  ll                                                                                 [2.4.4]
total 0
drwxr-xr-x  16 albert  staff  512 Sep 12 16:31 angular-6-pwa
drwxr-xr-x  12 albert  staff  384 Oct 23 08:37 capybara
drwxr-xr-x   3 albert  staff   96 Dec 14 14:53 git
drwxr-xr-x  19 albert  staff  608 Jul 10 11:09 maxim-angular
drwxr-xr-x  22 albert  staff  704 Sep 12 14:36 pwa-max
drwxr-xr-x   5 albert  staff  160 Aug 30 14:35 pwa-rails
drwxr-xr-x   3 albert  staff   96 Sep 12 16:34 pwa-youtube
drwxr-xr-x  30 albert  staff  960 Oct  4 10:48 react-maxim
drwxr-xr-x   6 albert  staff  192 Sep 28 04:22 rspec-ruben
drwxr-xr-x   6 albert  staff  192 Oct 25 06:34 ruby-advanced
drwxr-xr-x   5 albert  staff  160 Dec 12 21:28 vim
 albert@mac  ~/localDocuments/CodingArea/tutorials   master ●  cd ..                                                                              [2.4.4]
 albert@mac  ~/localDocuments/CodingArea  ll                                                                                                        [2.4.4]
total 0
drwxr-xr-x  17 albert  staff  544 Oct 19 05:32 Clients
drwxr-xr-x   4 albert  staff  128 Aug  6 09:23 PersonalProjects
drwxr-xr-x   3 albert  staff   96 Oct 10 11:48 PlayGround
drwxr-xr-x   6 albert  staff  192 Oct 31 10:38 codewars
drwxr-xr-x  22 albert  staff  704 Aug 27 17:48 test-assoc
drwxr-xr-x   2 albert  staff   64 Aug 27 17:47 tmp
drwxr-xr-x  15 albert  staff  480 Dec 14 14:53 tutorials
drwxr-xr-x  19 albert  staff  608 Nov  7 01:46 xing_preparation
 albert@mac  ~/localDocuments/CodingArea  mkdir practice && cd xing_preparation                                                                     [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/xing_preparation  cd ..                                                                                    [2.4.4]
 albert@mac  ~/localDocuments/CodingArea  ll                                                                                                        [2.4.4]
total 0
drwxr-xr-x  17 albert  staff  544 Oct 19 05:32 Clients
drwxr-xr-x   4 albert  staff  128 Aug  6 09:23 PersonalProjects
drwxr-xr-x   3 albert  staff   96 Oct 10 11:48 PlayGround
drwxr-xr-x   6 albert  staff  192 Oct 31 10:38 codewars
drwxr-xr-x   2 albert  staff   64 Dec 14 15:05 practice
drwxr-xr-x  22 albert  staff  704 Aug 27 17:48 test-assoc
drwxr-xr-x   2 albert  staff   64 Aug 27 17:47 tmp
drwxr-xr-x  15 albert  staff  480 Dec 14 14:53 tutorials
drwxr-xr-x  19 albert  staff  608 Nov  7 01:46 xing_preparation
 albert@mac  ~/localDocuments/CodingArea  cd practice                                                                                               [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/practice  ll                                                                                               [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/practice  mkdir git                                                                                        [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/practice  cd git                                                                                           [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/practice/git  ll                                                                                           [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/practice/git  touch readme.md                                                                              [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/practice/git  touch other.md                                                                               [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/practice/git  ll                                                                                           [2.4.4]
total 0
-rw-r--r--  1 albert  staff  0 Dec 14 15:05 other.md
-rw-r--r--  1 albert  staff  0 Dec 14 15:05 readme.md
 albert@mac  ~/localDocuments/CodingArea/practice/git  git init                                                                                     [2.4.4]
Initialized empty Git repository in /Users/albert/localDocuments/CodingArea/practice/git/.git/
 albert@mac  ~/localDocuments/CodingArea/practice/git   master  rm -rf .git                                                                       [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/practice/git  ll                                                                                           [2.4.4]
total 0
-rw-r--r--  1 albert  staff  0 Dec 14 15:05 other.md
-rw-r--r--  1 albert  staff  0 Dec 14 15:05 readme.md
 albert@mac  ~/localDocuments/CodingArea/practice/git  rm other.md                                                                                  [2.4.4]
remove other.md? y 
 albert@mac  ~/localDocuments/CodingArea/practice/git  ll                                                                                           [2.4.4]
total 0
-rw-r--r--  1 albert  staff  0 Dec 14 15:05 readme.md
 albert@mac  ~/localDocuments/CodingArea/practice/git  git init                                                                                     [2.4.4]
Initialized empty Git repository in /Users/albert/localDocuments/CodingArea/practice/git/.git/
 albert@mac  ~/localDocuments/CodingArea/practice/git   master  ga .                                                                              [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/practice/git   master ✚  gc -m "initial commit"                                                          [2.4.4]
[master (root-commit) 9925b03] initial commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 readme.md
 albert@mac  ~/localDocuments/CodingArea/practice/git   master  gst                                                                               [2.4.4]
On branch master
nothing to commit, working tree clean
 albert@mac  ~/localDocuments/CodingArea/practice/git   master  touch other.rb                                                                    [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/practice/git   master  gst                                                                               [2.4.4]
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	other.rb

nothing added to commit but untracked files present (use "git add" to track)
 albert@mac  ~/localDocuments/CodingArea/practice/git   master  echo "hello" >> readme.md                                                         [2.4.4]
 albert@mac  ~/localDocuments/CodingArea/practice/git   master ●  gst                                                                             [2.4.4]
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   readme.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	other.rb

no changes added to commit (use "git add" and/or "git commit -a")
 albert@mac  ~/localDocuments/CodingArea/practice/git   master ●  git stash                                                                       [2.4.4]
Saved working directory and index state WIP on master: 9925b03 initial commit
 albert@mac  ~/localDocuments/CodingArea/practice/git   master  gst                                                                               [2.4.4]
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	other.rb

nothing added to commit but untracked files present (use "git add" to track)

stash: reserva oculta

git stash drop

git stash -u -> include untracked

the red dot is gone, branch is clean

so i save my changes, i can get back to them later, so i can move on and work in sth else

git stash pop
you go back to the state you had before

# ref log
when u pull, push, rebase, merge, are saved. you can restore before any operation

git reflog

it's local

this is noisy

we can see the results just for a branch

git reflog show <branch_name>

# GIT LOG
git log

for every commit, we see the commit hash

git log --oneline
slims down the output

git log --oneline --decorate
git log --oneline --decorate --graph -all

git config --global alias.sla 'log --oneline --graph --all'

now we do git sla

for big teams, to see more details

git log --pretty=format: '%h - %an [%ar] %s'

git log -E -i --grep  'cach(e|ing)'

git blame Gemfile
git show 77442baf















