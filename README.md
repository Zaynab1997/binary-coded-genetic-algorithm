# binary-coded-genetic-algorithm
Five phases are considered in a genetic algorithm:
I. Initial population
II. Fitness function
III. Selection
IV. Crossover
V. Mutation

Two cases were studied in this project:
__________________________________________________
A. Binary Coded data

I. Initial Population:
  The population is created randomly, consisting of zeros and ones, as follows:
      pop =round(rand(Npop,N));
                        
II. Fitness function                        
We intent to optimize the number of one bits of the chromosome in the population.
The activation function is the number of zeros in the chromosomes:

```
	function z=MinOnek(nb_bit,x)
    	z=nb_bit - sum(x);
	end
```

III. Selection  
  By classifying individuals from 1 to Npop according to their value according to function J.
By each time pulling the individual with the probability:

  1. Wheel:
  
  ```
	function [r] = selection(sumc,Npop)
 	 n=rand();
   	  r=1;
  	   while (sumc(r) < n && r<=Npop)
    	      r=r+1;
   	    end
	end
  ```
  
  2. Random:
  
  ```
    function [r] = selectionrandom(Npop)
       r=randi([1 Npop]);
    end
  ```
IV. Crossover
  It consists in randomly drawing an integer between 1 and N-1 and in exchanging, with a probability Pc.
  1. Single Point Crossover
  
  ![image](https://user-images.githubusercontent.com/36966005/159266554-1106d129-3763-4e9f-b1f3-7d4351ee24fe.png)
  
```  
for i=1:2:Npop
        if(pc > rand())
            index=round((N-2)*rand())+1;
            newpop(i,1:index)=pop(i,1:index);
            newpop(i,index+1:N)=pop(i+1,index+1:N);
 
            newpop(i+1,1:index)=pop(i+1,1:index);
            newpop(i+1,index+1:N)=pop(i,index+1:N);
         end
end
```
  2. Double Point Crossover
  
  ![image](https://user-images.githubusercontent.com/36966005/159267083-6f34c2ef-9408-4b23-af9c-adc172b5cb7a.png)
  
 ``` 
  for i=1:2:Npop
     if(pc > rand())
	      index1=round(((N-2)/2)*rand())+1;
	      index2=index1+round(((N-2)/2)*rand())+1;
	      newpop(i,1:index1)=pop(i,1:index1);
	      newpop(i,index1+1:index2)=pop(i+1,index1+1:index2);
	      newpop(i,index2+1:N)=pop(i+1,index2+1:N);
	      newpop(i+1,1:index1)=pop(i+1,1:index1);
	      newpop(i+1,index1+1:index2)=pop(i,index1+1:index2);
 	      newpop(i+1,index2+1:N)=pop(i+1,index2+1:N);
      end
  end
```   
V. Mutation
The changing and evolution of Data:

![image](https://user-images.githubusercontent.com/36966005/159267497-ca9da83e-a1be-4271-9650-13589bce9122.png)

```
for i=1:Npop
      if( pm > rand())
        index1=round((N-1)*rand())+1;
        index2=round((N-1)*rand())+1;
        newpop(i,index1)=1-newpop(i,index1);
        newpop(i,index2)=1-newpop(i,index2);
      end
 end
``` 
 __________________________________________________
B. Real Case

I. Initial Population:
 The population is created randomly, consisting of zeros and ones, as follows:
 
 ```
     pop =4*rand(Npop,N)-2;
```

II. Fitness function                        
We intent to optimize the module of the chromosome in the population.
The activation function is the square of the module of chromosomes:

```
	function z=Sphere(x)
  	      z=sum(x.^2);
	end
  fitness(i)=1/(1+fitness(i));
```  
III. Selection  
  Same selection method as the binary case

IV. Crossover
  The used function is the following:
  
  ![image](https://user-images.githubusercontent.com/36966005/159268175-86984f61-e314-4334-b98f-f4e2e9f9b83e.png)
  
 ``` 
    for i=1:2:Npop
            if(pc > rand())
                alpha = rand();
                  newpop(i,:)=alpha*pop(i,:)+(1-alpha)*pop(i+1,:);
                  newpop(i+1,:)=alpha*pop(i+1,:)+(1-alpha)*pop(i,:);
             end
    end
```    

  ![image](https://user-images.githubusercontent.com/36966005/159268232-b3277470-f1d0-4fbd-acb6-476eac010ec5.png)
 
V. Mutation
The changing and evolution of Data:

![image](https://user-images.githubusercontent.com/36966005/159268288-a3d78171-11fb-4b59-9a94-b3fbcc6c4109.png)

where u ∈ N(0,1)

```
 for i=1:Npop
      if( pm > rand())
          u=randn(1,N);
          newpop(i,:)=newpop(i,:)+sigma.*u;
       end
  end
```
 __________________________________________________  
C. Binary-Real Case

I. Initial Population:
 The population is created randomly, consisting of zeros and ones, as follows:
     pop =round((2.^n)*rand(Npop,N)-0.5);
                        
II. Fitness function                        
We intent to optimize the module of the chromosome in the population.
The activation function is the square of the module of chromosomes:

```
	function z=Sphere(x)
  	      z=sum(x.^2);
	end
  fitness(i)=1/(1+fitness(i));
```  

III. Selection  
  Same selection method as the binary case

IV. Crossover
  Tt consists in randomly drawing an integer between 1 and N-1 and in exchanging, with a probability Pc.
```  
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
          end
end
```

V. Mutation
The changing and evolution of Data:
![image](https://user-images.githubusercontent.com/36966005/159269028-18d96d60-2b6a-4a31-8fbe-69e173cb3906.png)

```
for i=1:Npop
      if( pm > rand())
          indexc3=round((N-1)*rand())+1;
        index1=round((n-1)*rand())+1;
         m1 =dectobina(n,newpop(i,indexc3));
           newm1=m1;
           newm1(index1)=1-m1(index1);
           newpop(i,indexc3)=bin2deco(newm1);
      end
end
```
