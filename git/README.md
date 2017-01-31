## Contents

- [Configurations](#configurations)
- [Basic Commands](#basic-commands)
- [Remotes](#remotes)
- [Branches](#branches)
- [Merge](#merge)
- [Diff](#diff)
- [Log](#log)
- [Reset](#reset)

<br />
***
<br />

## Configurations

### User

Setup a user
```bash
git config --global user.name "FirstName LastName"
git config --global user.email email@example.com
```

### Colors

Enable colors for all git commands
```bash
git config --global color.ui true
```

### Editor

Set default editor
```bash
git config --global core.editor vim
```

### View

Global configurations
```bash
cat ~/.gitconfig
```

List all configurations
```bash
git config -l
git config --list
```

### Others

Caching remote repo’s password in Git (OSX)
```bash
git config --global credential.helper osxkeychain
```

<br />

## Basic Commands

### Repository

#### Initialize

```bash
git init
```

#### Clone

```bash
git clone git://github.com/user/project.git
```

### States
* untracked
* tracked
  * unmodified
  * modified
  * staged

### Operations

#### Add

stage new & modified files, without deleted files
```bash
git add .
```

stage modified & deleted files, without new files
```bash
git add -u
```

stage all files, shortcut for previous two command
```bash
git add -A
```

#### Revert

Replace file's current content with the last committed
```bash
git checkout -- README.md
```

Revert all tracked changes
```bash
git checkout -- .
```

Revert the changes (unstaged = working directory)
```bash
git clean -f
```

Revert the changes (untracked files and folders)
```bash
git clean -df
```

#### Stash

Stashing takes the dirty state of your working directory — that is, your modified
tracked files and staged changes — and saves it on a stack of unfinished changes
that you can reapply at any time.
```bash
git stash
```

To include untracked files in the stash
 ```bash
 git stash -u
 ```

To see which stashes are stored
```bash
git stash list
```

To apply the most recent stash
```bash
git stash apply
```

To apply one of the older stashes, you can specify it by naming it
```bash
git stash apply stash@{2}
```

To apply the most recent stash and then immediately drop it from your stack
```bash
git stash pop
```

To remove a stash
```bash
git stash drop stash@{2}
```

Creating a branch from a stash
```bash
git stash branch branchName
```

<br />

## Remotes

List remotes
```bash
git remote -v
```

Add a remote
```bash
git remote add origin git://github.com/user/project.git
```

Remove a remote
```bash
git remote rm origin
```

<br />

## Branches

List branches
```bash
git branch
```

Create a branch
```bash
git branch release
```

Delete a branch
```bash
git branch -d release
```

Force delete a branch (In case the changes are not merged yet)
```bash
git branch -D release
```

Switch to a branch
```bash
git checkout release
```

Create a branch and switch to it
```bash
git checkout -b release
```

**Note:** If there is a file with the same name as a branch, to checkout the file’s changes you need to tell the git explicitly using `--`:
```bash
git checkout -- README.md
```

Checkout a local branch from a remote
```bash
git checkout --track origin/feature-name
```

Checkout a local branch from a remote with a new name
```bash
git checkout -b local-feature-name origin/feature-name
```

Check local branch correlations to remote branches
```bash
git branch -vv
```

<br />

## Merge

Merge a branch into another branch
```bash
git merge master
```

Merge a local branch into master and commit all changes as a single commit.
By squash, all changes from local branch is added to master without being committed.
After that you can commit all that commit in a single commit.
```bash
git merge feature-name --squash
```

<br />

## Diff

Get a diff between two branches
```bash
git merge feature-name --squash
```

<br />

## Log

Full log
```bash
git log --graph --color --decorate --oneline --all
```

Show all users with number of their commits
```bash
git shortlog -sn
```

Search for a commit message in a branch (`-g`: all branches)
```bash
git log [--all] --grep=STRING
```

<br />

## Reset

Reset current HEAD to the specified state (i.e: Undoing a commit)

Let’s imagine a repo with following commits structure: (`I`) is index
```
       (I)
A - B - C
        ↑
       HEAD
```

The following line resets the current branch head to `<commit>` and possibly updates the index
(resetting it to the tree of `<commit>`) and the working tree depending on `<mode>`.
```bash
git reset <mode> <commit>
```

If `<mode>` is omitted, defaults to `--mixed`. The `<mode>` must be one of the following:

#### `--hard`

To nuke commit `C` and never see it again. do this:
```bash
git reset --hard HEAD~1
```

The result is:
```
   (I)
A - B
    ↑
   HEAD
```

Now `B` is the HEAD. Because `--hard` was used, files are reset to their state at commit `B`.

#### `--mixed`

Suppose commit `C` was not a disaster, but just a bit off. You want to undo the commit but keep your changes for a
bit of editing before you do a better commit. Starting again from here, with `C` as HEAD. (Default reset mode is `mixed`)
```bash
git reset HEAD~1
```

The result is:
```
       (I)
A - B - C
    ↑
   HEAD
```

In both cases, HEAD is just a pointer to the latest commit. When you do a `git reset HEAD~1`, git moves the HEAD pointer
back one commit. But (unless you use `--hard`) you leave your files as they were. So now git status shows the changes
you had checked into `C`. You haven't lost a thing!

#### `--soft`
For the lightest touch, it’s possible to undo a commit but leave the files and index:

```bash
git reset --soft HEAD~1
```

The result is:
```
       (I)
A - B
    ↑
   HEAD
```

This not only leaves the files & index alone. When you do git status, you'll see that the same files are in the index as
before. In fact, right after this command, you could do `git commit` and you'd be redoing the same commit you just had.
