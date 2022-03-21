clc;
clear;
close all;
%initialisation
val=1;
Npop=100;
N=30;
Ngen=200;
pc=0.6;
pm=0.04;
fitness=zeros(Npop,1);
newpop=zeros(Npop,N);
sumc=zeros(Npop ,1);
 BestSol=zeros(Ngen,1);
%fitness
CostFunction=@(y,x) MinOnek(y,x);
%generation
pop =round(rand(Npop,N));


for j=1:Ngen
     row_totals = sum(pop,2);
    [sorted, SortOrder]=sort(row_totals,'descend');
    pop=pop(SortOrder,:);
%     disp([pop(SortOrder,:)]);
    %calcul de fitness
     for i=1:Npop
       fitness(i)=CostFunction(N,pop(i,:));
     end
     % Sort Population    right
% compute the row totals
 

% end 
    
     %sum culmate for selection

    for i=1:Npop
      sumc(i)=sum(fitness(1:i));
    end
   %proba
   sumc=sumc/sumc(Npop);
   
%      %sum culmate for selection
% 
%       sumc=sum(fitness(1:i));
%     
%    %proba
%     for i=1:Npop
%      proba(i)=fitness(i)/sumc
%     end
   %selection     right
   %wheel
% end
      for i=1:Npop
        r=selection(sumc,Npop);
%         r=selectionrandom(Npop);
        newpop(i,:) = pop(r,:);
      end
%    pop=newpop;
% end
%       croisement
    for i=1:2:Npop
        if(pc > rand())
%           
%             index1=round(((N-2)/2)*rand())+1;
%            index2=index1+round(((N-2)/2)*rand())+1;
           
            index=round((N-2)*rand())+1;
 
            newpop(i,1:index)=pop(i,1:index);
            newpop(i,index+1:N)=pop(i+1,index+1:N);
 
            newpop(i+1,1:index)=pop(i+1,1:index);
            newpop(i+1,index+1:N)=pop(i,index+1:N);

%             newpop(i,1:index1)=pop(i,1:index1);
%             newpop(i,index1+1:index2)=pop(i+1,index1+1:index2);
%             newpop(i,index2+1:N)=pop(i+1,index2+1:N);
% 
%             newpop(i+1,1:index1)=pop(i+1,1:index1);
%             newpop(i+1,index1+1:index2)=pop(i,index1+1:index2);
%             newpop(i+1,index2+1:N)=pop(i+1,index2+1:N);
        end
    end
% end 
% mutation
%      pop=newpop;
%       for k=1:round(pm*Npop)
%       l=randi([1 Npop]);%min fi ye3mil
%          index=randi([1 N])
%         newpop(l,index)=newpop(l,index)<1;   
% %         newpop(l)=(newpop(l)<1);
%           
%       end
    for i=1:Npop
      if( pm > rand())
        index1=round((N-1)*rand())+1;
%           index2=round((N-1)*rand())+1;
        newpop(i,index1)=1-newpop(i,index1);
%          newpop(i,index2)=1-newpop(i,index2);
      end
    end
       for i=1:Npop
        fitness(i)=CostFunction(N,newpop(i,:));
       end
     
% Store Best Solution
  
      BestSol(j,1)=max(fitness);
%       if (val<BestSol(j,1))
%           break
%       end
%       val=max(fitness);
      pop=newpop;
          disp(['Iteration ' num2str(j) ': Best Min = ' num2str(BestSol(j,1))]);
end
figure(1)
t=1:1:Ngen;

plot( t,N-BestSol)

   row_totals = sum(pop,2);
    [sorted, SortOrder]=sort(row_totals,'descend');
    pop=pop(SortOrder,:);
    pop(Npop,:)
