function [d] = bin2deco(ans)
if(ans(1)==0)
    ans1=num2str(ans);
    ans = "0000"+ans1;

else 
     ans1=num2str(ans);
    ans = "1111"+ans1;
end
d=typecast(uint8(bin2dec(ans)),'int8');
end

