
# coding: utf-8

# # <center>  Wrangling the Data
# Competition Link: https://www.kaggle.com/c/recruit-restaurant-visitor-forecasting

# In[5]:

# import modules
import pandas as pd 

# import data
air_reserve = pd.DataFrame(pd.read_csv('https://www.dropbox.com/s/xbaofzzdtyky2r2/air_reserve.csv?dl=1'))
air_store_info = pd.DataFrame(pd.read_csv('https://www.dropbox.com/s/zevll8p6dwhcv0u/air_store_info.csv?dl=1'))
air_visit_data = pd.DataFrame(pd.read_csv('https://www.dropbox.com/s/sln3ut6unrawq7z/air_visit_data.csv?dl=1'))
data_info = pd.DataFrame(pd.read_csv('https://www.dropbox.com/s/jg845ld2javd4lj/date_info.csv?dl=1'))
hpg_reserve = pd.DataFrame(pd.read_csv('https://www.dropbox.com/s/zpembfgmhds433h/hpg_reserve.csv?dl=1'))
hpg_store_info = pd.DataFrame(pd.read_csv('https://www.dropbox.com/s/g6bbc3uya6qg3wt/hpg_store_info.csv?dl=1'))
store_id = pd.DataFrame(pd.read_csv('https://www.dropbox.com/s/5xowsufv256y1au/store_id_relation.csv?dl=1'))

sample_submission = pd.DataFrame(pd.read_csv('https://www.dropbox.com/s/uk2qn4rz4ktawxj/sample_submission.csv?dl=1'))

# set pandas options

pd.set_option('max_columns',1000)
pd.set_option('max_rows',1000)


# In[6]:

sample_submission.shape


# In[7]:

sample_submission.sample(10)


# In[8]:

air_reserve.head()


# In[9]:

air_store_info.head()


# In[10]:

air_visit_data.head()


# In[11]:

data_info.head()


# In[12]:

hpg_reserve.head()


# In[13]:

hpg_store_info.head()


# In[14]:

store_id.head()


# ### Wrangling AIR Point of Sale Data

# In[15]:

reserve = store_id
reserve = reserve.merge(hpg_store_info)
reserve = reserve.merge(hpg_reserve)
reserve = pd.DataFrame(reserve)
reserve.head()


# In[16]:

visits_reserve = store_id
visits_reserve = visits_reserve.merge(air_store_info)
visits_reserve = visits_reserve.merge(air_visit_data)
visits_reserve = visits_reserve.merge(air_reserve)
visits_reserve = visits_reserve.merge(data_info, left_on='visit_date',
                      right_on='calendar_date')
visits_reserve = pd.DataFrame(visits_reserve )
visits_reserve.head(4)


# ### Exploring Joint Systems

# In[17]:

len(hpg_store_info)


# In[18]:

len(air_store_info)


# In[19]:

len(store_id)


# In[20]:

store_id.head()


# In[21]:

joint_systems = store_id

joint = joint_systems['air_store_id'].isin(visits_reserve['air_store_id'].unique())
joint = pd.Series(joint, name='joint')
joint_systems = pd.concat([joint_systems,joint], axis=1)
joint_systems


# In[ ]:

joint_systems['joint'].value_counts()


# ### Joining AIR and HPG Data

# In[ ]:

air_hpg_reserveations = visits_reserve.merge(reserve, left_on='hpg_store_id', 
                            right_on='hpg_store_id',how='left')
air_hpg_reserveations.head()


# ### Exporting the Data

# In[ ]:

visits_reserve.to_csv('Data/visits_reserve.csv')
reserve.to_csv('Data/reserve.csv')
air_hpg_reserveations.to_csv('Data/air_hpg_reserveations.csv')


# Author: Kavi
