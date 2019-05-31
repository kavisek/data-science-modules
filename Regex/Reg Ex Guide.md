# <center> Regex Tutorial <center>

After working in the industry for a few month. Regex went from a tool I avoided using to something I gravitate towards in my python code, SQL queries, and the platforms I use on a daily basis (i.e Google Analytics).

The following resources helped developing my skills and troubleshoot by Regex statements within my workspace.

Regex 101: https://regex101.com/
Chris Albon: https://chrisalbon.com/ (Search Regex)

### Matching Dates


Example 1: 2019/01/01  
Regex: ```[0-9]*\/[0-9]*\/[0-9]*```


Example 2: 2019-01-01  
Regex: ```[0-9]*-[0-9]*-[0-9]*```

### Matching Characters


##### Start and End of a String  

Example: | Vancouver || Canucks || Rock |  
Regex: ```^\|```


Title: Matching the Last "-" Character  
Example: | Vancouver || Canucks || Rock |  
Regex: ```\|$```
