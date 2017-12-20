
# coding: utf-8

# ### Preliminaries

# In[8]:

import pandas as pd
pd.set_option('max_columns', 1000)


# ### Import Data

# In[11]:

# read csv data
print('Data Import Started')
poll = pd.read_csv('https://www.dropbox.com/s/xqd8es3ytv0fkjm/pollution_us_2000_2016.csv?dl=1')
print('Data Import Complete')


# In[15]:

poll.head()


# ### Wrangling Data

# In[18]:

# Carbon Monoxide Mean by City
aggregate = pd.DataFrame(poll.groupby('City')['CO Mean'].mean())
aggregate


# ### Exporting Data to CSV

# In[19]:

print('Exporting File: Started')
aggregate.to_csv('Data/co_city.csv')
print('Exporting File: Finished')

