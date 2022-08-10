#!/usr/bin/env python
# coding: utf-8

# In[1]:


import xarray as xr  # "canonical" namespace short-hand
import pathlib
import os


# In[2]:


exp_dir = '/glade/u/home/afox/work/jedi/Jedi_experiments'


# In[4]:


# Create a restart that has slightly different SWE
in_dir = os.path.join(exp_dir+'/'+'input/wrf_hydro_nwm_files/colorado')

datetouse = '2021030100'

filename_in = 'RESTART.'+datetouse+'_DOMAIN1'
filename_out = 'RESTART.'+datetouse+'_DOMAIN1_mem001'
in_file = os.path.join(in_dir+'/'+filename_in)
out_file = os.path.join(in_dir+'/'+filename_out)
ds = xr.open_dataset(in_file, engine="netcdf4")
ds['SNOWH'] = ds['SNOWH'] + 0.02121
ds['SNEQV'] = ds['SNEQV'] + 21.21*0.25
ds.to_netcdf(out_file)

filename_out = 'RESTART.'+datetouse+'_DOMAIN1_mem002'
out_file = os.path.join(in_dir+'/'+filename_out)
ds = xr.open_dataset(in_file, engine="netcdf4")
ds['SNOWH'] = ds['SNOWH'] - 0.02121
ds['SNEQV'] = ds['SNEQV'] - 21.21*0.25
ds.to_netcdf(out_file)



ds.SNOWH.plot(robust=True, figsize=(12, 9));

