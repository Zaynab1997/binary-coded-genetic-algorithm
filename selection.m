function [r] = selection(sumc,Npop)
  n=rand();
   r=1;
   while (sumc(r) < n && r<=Npop)
    r=r+1;
   end
end

