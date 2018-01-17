
# coding: utf-8

# In[17]:

import datetime

text_file = open('logs.txt','a')
text_file.write("Log Time: " + str(datetime.datetime.now()) + "\n")
text_file.close()

