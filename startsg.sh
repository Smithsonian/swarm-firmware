#!/bin/bash
####### User to edit these accordingly ######
export PLATFORM=lin64
export MATLAB_PATH=/usr/local/MATLAB/R2013a
export XILINX_PATH=/opt/Xilinx/14.7/ISE_DS
export MLIB_DEVEL_PATH=../mlib_devel
export MLIB_ROOT=$MLIB_DEVEL_PATH
export MATLAB=$MATLAB_PATH
source $XILINX_PATH/settings64.sh
####### These are some SWARM-specific settings ######
export USER_UCF_PATH='./sma_corr/pblocks' # SWARM area groups
export QDR_MMCM_LOCK_EN=yes # Enable MMCM lock feature for QDR
####### Add MATLAB to path and start SysGen ######
export PATH=$MATLAB/bin:$PATH
sysgen
