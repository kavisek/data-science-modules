# <center> Github for DataScience </center>

![Git Image](https://miro.medium.com/max/1600/1*OY34A4uBsawmGoqpBV3UaA.png)

In summary. Git is a version control system.

Github is a platform for storing and managing you git repositories. Github and git are two different things. One is  aversion control system the other is a platform. GitHub

There are many platform online that support Git repositories. A few are listed below.

 - [BitBucket]()
 - [Github]()
 - [Gitlab]()

### Community CheatSheets

This guide may not meet all your needs. Therefore checkout some of the CheatSheets linked below.

- [Git CheatSheet by Tower](https://www.git-tower.com/blog/git-cheat-sheet/)
- [Git CheatSheet by Github](https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf)
- [Git CheatSheet by GitLab](https://about.gitlab.com/images/press/git-cheat-sheet.pdf)
- [Git CheatSheet by Atlassian]( https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet)

#### Cloning a repository

This following command pull a repository from Github and clones the file to your computer.

```bash
# Clone the repository
git clone https://github.com/kavisek/DataScience.git
```

#### The Basics

If you are working on a repository by yourself. You will most commonly be using the following commands.

- `git pull`
- `git add [file]`
- `git add .`
- `git commit -m [message]`
- `git push`

```bash
# Pull from the repository (you might need to sign-into Github)
git pull

# Navigate to the directory using bash
cd DataScience

# Create a file using bash
touch test.txt

# Add the file to Staging
git add test.txt

# Commit the changes to the repository
git commit -m 'adding new test.txt file to project'

# Push the changes to the repository
git push
```

#### Adding and Committing Multiple File
```bash
# Add multiple file to the project repository.
git add .

# Committing filesystem
git commit -m 'adding many file to repo'

# Push files to repository
git push
```


#### View Repository Logs

```bash
# Viewing the repository logs in a pretty, oneline per commit
git log --oneline

# Viewing the repository logs in a pretty, oneline per commit with a graph
git log --oneline --graph

# View the last 3 Commits
git log -n 3

# View the last commits  

```



















<center> AUthor: Kavi Sekhon </center>
