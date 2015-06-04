#!/bin/bash
####### User to edit these accordingly ######
export PLATFORM=lin64
export MATLAB_PATH=/usr/local/MATLAB/R2013a
export XILINX_PATH=/opt/Xilinx/14.7/ISE_DS
export MLIB_DEVEL_PATH=/home/rprimian/git/mlib_devel
export MLIB_ROOT=$MLIB_DEVEL_PATH
export MATLAB=$MATLAB_PATH
source $XILINX_PATH/settings64.sh
####### These are some SWARM-specific settings ######
export CASPER_HW_ROUTES=hw_routes_roach2rev1.mat # User Rev. 1
export USER_UCF_PATH='./sma_corr/pblocks' # SWARM area groups
export QDR_MMCM_LOCK_EN=yes # Enable MMCM lock feature for QDR
export IDCTRL_100=yes # User 100 MHz for IDELAY_CTRL
####### Add MATLAB to path and start SysGen ######
export PATH=$MATLAB/bin:$PATH
sysgen
