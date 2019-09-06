# <center> Github for DataScience </center>

In summary. Git is a version control system.

Github is a platform for storing and managing you git repositories. Github and git are two different things. One is  aversion control system the other is a platform. GitHub

There are many platform online that support Git repositories. A few are listed below.

 - [BitBucket]()
 - [Github]()
 - [Gitlab]()

### Cloning a repository

This following command pull a repository from Github and clones the file to your computer.

```bash
# Clone the repository
git clone https://github.com/kavisek/DataScience.git
```

### The Basics

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

### Adding and Committing Multiple File
```bash
# Add multiple file to the git hub repo.
git add .

# Comitting filesystem
git commit -m 'adding many file to repo'

# Push files to repository
git push
```
