# <center>Data Science with Linux </center>

## <center> Basic Navigation

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

## <center> Data Analyis

```bash
# View the contents of a file
cat temp_data.csv

# View the top row of a file
head -n 1 temp_data.csv

# View the las row of a file
tail -n 1 temp_data.csv

# Save the head of a file to another file
head -n 300 temp_data.csv > temp_data2.csv
```

```bash
# A count of words, lines, and characters within a file
wc temp_data.csv

# A count of words within a file
wc -w temp_data.csv

# A count fo lines within a file
wc -l temp_data.csv

# A count of character within a file
wc -c temp_data.csv
```

```bash
# Print the number of charcater for the longest line in the file
cat temp_data.csv | awk '{ print length }' | sort -n | tail -1
```


### <centre> Install Python Enviroments

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
