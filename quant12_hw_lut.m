function [ output ] = quant12_hw_lut( input )
% quant16_hw_lut

if    input == 0
    output = 0;
elseif input < 1*2^8
    output = 1;
elseif input < 2*2^8
    output = 2;
elseif input < 3*2^8
    output = 3;
elseif input < 4*2^8
    output = 4;
elseif input < 5*2^8
    output = 5;
elseif input < 6*2^8
    output = 6;
elseif input < 7*2^8
    output = 7;
elseif input < 8*2^8
    output = -8;
elseif input < 9*2^8
    output = -7;
elseif input < 10*2^8
    output = -6;
elseif input < 11*2^8
    output = -5;
elseif input < 12*2^8
    output = -4;
elseif input < 13*2^8
    output = -3;
elseif input < 14*2^8
    output = -2;
else
    output = -1;
end
    

end

