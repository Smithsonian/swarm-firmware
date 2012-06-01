function [ output ] = atan_quad1_hw_lut( input )
% atan2_hw_lut

re = bitand(bitshift(input, -7), 2^7-1);
im = bitand(input, 2^7-1);

if re == 0
    if im == 0
        rads = 0;
    else
        rads = pi/2;
    end
else
    rads = atan(im/re);
end
    
output = round(rads * ((2^11)/pi));

end

