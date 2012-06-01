function [ output ] = quant16_hw_lut( input )
% quant16_hw_lut

if     input < 2^11
    output = 0;
elseif input < 1*2^12 + 2^11
    output = 1;
elseif input < 2*2^12 + 2^11
    output = 2;
elseif input < 3*2^12 + 2^11
    output = 3;
elseif input < 4*2^12 + 2^11
    output = 4;
elseif input < 5*2^12 + 2^11
    output = 5;
elseif input < 6*2^12 + 2^11
    output = 6;
elseif input < 7*2^12 + 2^11
    output = 7;
elseif input < 8*2^12 + 2^11
    output = 8;
elseif input < 9*2^12 + 2^11
    output = 9;
elseif input < 10*2^12 + 2^11
    output = 10;
elseif input < 11*2^12 + 2^11
    output = 11;
elseif input < 12*2^12 + 2^11
    output = 12;
elseif input < 13*2^12 + 2^11
    output = 13;
elseif input < 14*2^12 + 2^11
    output = 14;
else
    output = 15;
end
    

end

