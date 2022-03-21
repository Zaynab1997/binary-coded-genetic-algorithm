clc;
clear;
close all;
%initialisation
sigma=0.1;
Npop=100;
n=4;
Ngen=100;
N=n;
pc=0.6;
pm=0.9;
val=1;
fitness=zeros(Npop,1);
newpop=zeros(Npop,N);
sumc=zeros(Npop ,1);
BestSol=zeros(Ngen,1);
%fitness
CostFunction=@(x) Sphere(x);
%generation
pop =4*rand(Npop,N)-4;
% ------------  starting the ga
for j=1:Ngen
     row_totals = sum(abs(pop),2);
    [sorted, SortOrder]=sort(row_totals,'descend');
     pop=pop(SortOrder,:);
    %calcul de fitness
     for i=1:Npop
       fitness(i)=CostFunction(pop(i,:));
       fitness(i)=1/(1+fitness(i));
     end
     fitness=fitness./sum(fitness);
    for i=1:Npop
      sumc(i)=sum(fitness(1:i));
    end
% -----------   selectionn: wheel
      for i=1:Npop
        r=selection(sumc,Npop);
%         disp(r)
%        r=selectionrandom(Npop);
        newpop(i,:) = pop(r,:);
      end
       popwheel=newpop;
% -----------      croisement
    for i=1:2:Npop
        if(pc > rand())
           alpha = rand();
           newpop(i,:)=alpha*newpop(i,:)+(1-alpha)*newpop(i+1,:);
           newpop(i+1,:)=alpha*newpop(i+1,:)+(1-alpha)*newpop(i,:);
        end
    end
    popcross=newpop;
%  ----------------   mutation
    for i=1:Npop
      if( pm > rand())
        u=randn(1,N);
        newpop(i,:)=newpop(i,:)+sigma.*u;
      end
    end
    popmutated=newpop;
% ------------------ final selection
    poptemp=[popwheel;popcross;popmutated];
    row_totals = sum(abs(poptemp),2);
    [sorted, SortOrder]=sort(row_totals,'descend');
    poptemp=poptemp(SortOrder,:);
    pop=poptemp(round(Npop/3)+1:end,:);
       for i=1:Npop
        fitness(i)=CostFunction(pop(i,:));
        fitness(i)=1/(1+fitness(i));
       end
      fitness=fitness./sum(fitness);
% Store Best Solution
      BestSol(j,1)=min(fitness);
      if (val<BestSol(j,1))
          break;
      end
      val=min(fitness);
      disp(['Iteration ' num2str(j) ': Best Min = ' num2str(BestSol(j,1))]);
end
figure(1)
% t=1:1:Ngen;
plot(BestSol)
% disp(min(BestSol));
% disp((BestSol(end)));
% disp(max(BestSol));

