function swarm_resynth_core(core_name)
% SWARM_RESYNTH_CORE Re-synthesize a particular SWARM 
%      core with the "standard" set of XST parameters:
%
%      -opt_mode=speed
%      -glob_opt=allclocknets
%      -register_balancing=yes
%      -optimize_primitives=yes'
%      -read_cores=yes
%      -lc=off

    xst_args = {'-opt_mode', 'speed', ...
        '-glob_opt', 'allclocknets', ...
        '-register_balancing', 'yes', ...
        '-optimize_primitives', 'yes', ...
        '-read_cores', 'yes',...
        '-lc', 'off'};

    if strcmp(core_name, 'sma_corr')
        resynth_netlist('sma_corr/sysgen', 'sma_corr_cw', xst_args{:});
    else
        resynth_netlist(core_name, xst_args{:});
    end
end

