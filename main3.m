clc;
clear;
close all;
%initialisation
sigma=0.1;
Npop=100;
n=4;
% l=10;
Ngen=100;
N=10;
pc=0.6;
pm=0.9;
fitness=zeros(Npop,1);
newpop=zeros(Npop,N);
sumc=zeros(Npop ,1);
 BestSol=zeros(Ngen,1);
%fitness
CostFunction=@(x) Sphere(x);
%generation
pop =round((2.^n)*rand(Npop,N)-(2.^(n-1)));


for j=1:Ngen
%      row_totals = sum(pop,2);
%     [sorted, SortOrder]=sort(row_totals,'descend');
%     pop=pop(SortOrder,:);
%     disp([pop(SortOrder,:)]);
    %calcul de fitness
     for i=1:Npop
       fitness(i)=CostFunction(pop(i,:));
         fitness(i)=1/(1+fitness(i));
     end
     % Sort Population    right
% compute the row totals
 

% end 
    
%      %sum culmate for selection
% 
     fitness=fitness./sum(fitness);
    for i=1:Npop
      sumc(i)=sum(fitness(1:i));
    end
   %proba
%        sumc=sumc./max(sumc);
   
     %sum culmate for selection
% 
%       sumc=sum(fitness(1:i));
    
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
           indexc1=round((N-1)*rand())+1;
           indexc2=round((N-1)*rand())+1;
           
             p1 = dectobina(n,pop(i,indexc1));
             p2 = dectobina(n,pop(i+1,indexc2));
             
            index=round((n-2)*rand())+1;

            newp1(1:index)=p1(1:index);
            newp1(index+1:n)=p2(index+1:n);
 
            newp2(1:index)=p2(1:index);
            newp2(index+1:n)=p1(index+1:n);
            
            newpop(i,indexc1)=bin2deco(newp1);
            newpop(i+1,indexc2)=bin2deco(newp2);

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
          indexc3=round((N-1)*rand())+1;
        index1=round((n-1)*rand())+1;
%          index2=round((N-1)*rand())+1;
           m1 =dectobina(n,newpop(i,indexc3));
           newm1=m1;
           newm1(index1)=1-m1(index1);
           newpop(i,indexc3)=bin2deco(newm1);
      end
    end
       for i=1:Npop
        fitness(i)=CostFunction(newpop(i,:));
          fitness(i)=1/(1+fitness(i));
       end
      fitness=fitness./sum(fitness);
% Store Best Solution
  
      BestSol(j,1)=min(fitness);
      pop=newpop;
          disp(['Iteration ' num2str(j) ': Best Min = ' num2str(BestSol(j,1))]);
end
figure(1)
t=1:1:Ngen;

plot( t,BestSol)

%    row_totals = sum(pop,2);
%     [sorted, SortOrder]=sort(row_totals,'descend');
%     pop=pop(SortOrder,:);
%     pop(Npop,:)
