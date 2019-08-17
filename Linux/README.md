### <center> 10x Data Science with Linux </center>

##### Basic Navigation Sequence

```bash
# Creating and removing directories and filesr
mkdir testing
cd testing
touch file
rm file
cd ..
rmdir -i testing
```

##### Copying

```bash
# Copying files and directories
mkdir testing
cd testing
touch file.txt
cp file.txt file2.txt
cd ..
cp mkdir/* mkdir2/*
```

#### Removing Directory

```bash
# Remove a directory all its contents (including sub folders)
rm -rf folder
```

#### View Active Process on Machine

```bash
top
```

### Pip Free and Requirement Folder

Export enviroment package versions into a requirements file.
```
conda activate airflow
pip freeze > requirement.txt
```


### Install into Linux Enviroment

Only do this in your docker file. Do not do this in main machine.
```
pip install requirement.txt
```
