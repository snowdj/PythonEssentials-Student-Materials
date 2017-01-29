This repository contains specifications files for the Foundations of Applied Mathematics labs.

# Setup

This website is a _git repository_, an online storage space for code and other small files.
_Git_ is the underlying software that manages updates between this online repository and the copies (or _clones_) of the repository stored locally on computers.
If git is not already installed on your computer, [downloaded it here](http://git-scm.com/downloads).

Many different companies have websites for hosting online git repositories.
We suggest using either [GitHub](https://github.com) or [Bitbucket](https://bitbucket.org), and provide installation instructions for both services below.
If you have never used git, consider reading [this GitHub page](https://help.github.com/articles/set-up-git/) or [these Bitbucket tutorials](https://www.atlassian.com/git/tutorials).

### Setup with GitHub

1. [Sign up for GitHub](https://github.com).
If you are a student, you may consider checking out [GitHub's education pack](https://education.github.com/) for free private repositories.

2. On GitHub, click the plus sign in the top right hand corner of the page and select **Import repository**.
Enter the url to this page (https://github.com/Foundations-of-Applied-Mathematics/PythonEssentials-Student-Materials or similar) and supply a name your new repository, then click the green **Begin import** button.

### Setup with Bitbucket

1. [Sign up for Bitbucket](https://bitbucket.org).
Click **not now** if it asks you to set up your first repository.

2. On Bitbucket, click the **Repositories** button from the menu at the top and select **Import repository**.
Enter the url to this page (https://github.com/Foundations-of-Applied-Mathematics/PythonEssentials-Student-Materials or similar) and supply a name your new repository.
Under **Advanced settings**, enter a short description for your repository, select **No forks** under forking, and select **Python** under language.
Then click the blue **Import repository** button.

### Cloning and Configuration

After setting up your online repository, open up a shell application on your computer (_Terminal_ on Linux or Mac, or _GitBash_ on Windows).
Use `cd <directory>` to navigate to the place where you want to store the files from this repository, then use `git clone` to make a local copy of the repository.
For example, if you're using Bitbucket, your user name is `username`, and your repository is named `volume1`, run the following commands in the shell:

```bash
$ cd ~/Desktop
$ git clone https://username@bitbucket.org/username/volume1.git
Cloning into 'volume1'...
remote: Counting objects: 67, done.
remote: Total 67 (delta 0), reused 0 (delta 0), pack-reused 67
Unpacking objects: 100% (67/67), done.
```

Finally, navigate to your new folder and run the following commands to configure the repository.

```bash
$ cd volume1
$ git config --local user.name "YOUR NAME"
$ git config --local user.email "YOUR EMAIL ADDRESS"
```

# Using Git

Git manages the history of a file system through _commits_, or checkpoints.
Use `git status` to see the files that have been changed since the last commit.
These changes are then moved to the _staging area_, a list of files to save during the next commit, with `git add <filename(s)>`.
Save the changes in the staging area with `git commit -m "A brief message describing the changes"`.

All of these commands are done within a clone of the repository, stored somewhere on a computer.
This repository must be manually synchronized with the online repository via two other git commands: `git pull origin master`, to pull updates from the web to the computer; and `git push origin master`, to push updates from the computer to the web.

### Common Git Commands

| Command                     | Explanation                                    |
|:------------------------------------------------|:---------------------------|
| `git status`               | Display the staging area and untracked changes.|
| `git pull origin master`   | Pull down changes from the online repository.  |
| `git push origin master`   | Push up changes to the online repository.      |
| `git add <filename(s)>`    | Add a file or files to the staging area.       |
| `git add -u`               | Add all of the modified, previously tracked files to the staging area.|
| `git commit -m "<message>"` | Save the changes in the staging area with a given message.|
| `git checkout -- <filename>` | Revoke the changes made since the last commit on a file that is not in the staging area. |
| `git reset -- <filename>`  | Remove a file from the staging area.           |
| `git diff <filename>`      | See the changes made on an unstaged file since the last commit.|
| `git diff --cached <filename>` | See the changes made on a staged file since the last commit.|
| `git config --local user.name "your name"` | Tell git who you are |
| `git config --local user.email youremail@gmail.com` | Tell git who you are |

### Example Work Session

Short version:
```bash
$ cd Desktop/Volume1/
$ git pull origin master                           # Pull updates.

# Make changes to a file.

$ git add -u                                       # Track changes.
$ git commit -m "Made some changes."               # Commit changes.
$ git push origin master                           # Push updates.
```

Long version:
```bash
# Navigate to the clone of the repository.
$ cd Desktop/Volume1/

# Pull any updates from the online repository (such as TA feedback).
$ git pull origin master
From https://bitbucket.org/byuacmeta/template
 * branch            master     -> FETCH_HEAD
Already up-to-date.

# Work on the labs. For example, modify PythonIntro/python_intro.py.

$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    PythonIntro/python_intro.py

nothing added to commit but untracked files present (use "git add" to track)

$ git add PythonIntro/python_intro.py 
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    modified:   PythonIntro/python_intro.py

# Commit the changes to the repository with an informative message.
$ git commit -m "Made some changes"
[master fed9b34] Made some changes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 python_intro.py

# Push the changes to the online repository.
$ git push origin master
Counting objects: 3, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 327 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://byuacmeta@bitbucket.org/byuacmeta/template.git
   5742a1b..fed9b34  master -> master

# The changes have been saved and the online repository updated.
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
nothing to commit, working directory clean
```
