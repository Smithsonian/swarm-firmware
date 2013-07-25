function ethtweak(sys)
  for k = 1:3
    kx = bitxor(k, 1);
    set_param([sys '/network/eth/' num2str(k) '/bsdata'], 'OutputSignals', sprintf('dout%d,valid%d,dst%d', kx, kx, kx));
    set_param([sys '/network/eth/' num2str(k) '/bseof'], 'OutputSignals', sprintf('eof%d', kx));
    set_param([sys '/network/eth/' num2str(k) '/core'], 'port_r2_sfpp', num2str(k));
    gotos = find_system([sys '/network/eth/' num2str(k)], 'RegExp','on', 'SearchDepth', '1', 'BlockType','Goto','GotoTag','_0$');
    for g = 1:length(gotos)
      tag = regexprep(get_param(gotos{g}, 'GotoTag'), '_0$', ['_', num2str(k)]);        
      set_param(gotos{g}, 'GotoTag', tag);
    end
  end
end
