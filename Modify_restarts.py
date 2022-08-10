#!/usr/bin/env python
# coding: utf-8


import xarray as xr  # "canonical" namespace short-hand
import pathlib


# Create a restart that has slightly different SWE
in_dir = pathlib.Path('/Users/afox/Jedi/Jedi_experiments/input/wrf_hydro_nwm_files/taylor_park')

datetouse = '2019030101'

filename_in = 'RESTART.'+datetouse+'_DOMAIN1'
filename_out = 'RESTART.'+datetouse+'_DOMAIN1_mem001'
in_file = in_dir / filename_in
out_file = in_dir / filename_out
ds = xr.open_dataset(in_file, engine="netcdf4")
ds['SNOWH'] = ds['SNOWH'] + 0.02121
ds['SNEQV'] = ds['SNEQV'] + 21.21*0.25
ds.to_netcdf(out_file)

filename_out = 'RESTART.'+datetouse+'_DOMAIN1_mem002'
out_file = in_dir / filename_out
ds = xr.open_dataset(in_file, engine="netcdf4")
ds['SNOWH'] = ds['SNOWH'] - 0.02121
ds['SNEQV'] = ds['SNEQV'] - 21.21*0.25
ds.to_netcdf(out_file)
