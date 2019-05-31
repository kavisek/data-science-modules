# <center> Regex Tutorial <center>


### Matching Dates


Example 1: 2019/01/01  
Regex: ```[0-9]*\/[0-9]*\/[0-9]*```


Example 2: 2019-01-01  
Regex: ```[0-9]*-[0-9]*-[0-9]*```

### Matching Characters and the Start and End of a String

Example: | Vancouver || Canucks || Rock |  
Regex: ```^\|```


Title: Matching the Last "-" Character  
Example: | Vancouver || Canucks || Rock |  
Regex: ```\|$```
