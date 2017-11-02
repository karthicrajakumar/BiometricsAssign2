%This code is to takes a matrix with column name and row names and compares
%the names of each row and column. If it matches then it is added to
%genuine array(garray) and if it doesnt it puts the score into the imposter
%array (iarray). The namearray is for the names that did match for
%reference.
xaxis=[1:89];
rankarray=[];
namearray=[];
sortedarray=[];
matrixCopy = [];
total_prob = [];
prob =0 ;

for rank= 1:89
    c = 0 ;
    prob =0;
    for k=2:221
       for j=2:89
           if matrix2200names(k,1)==matrix2200names(1,j)
               garray=[];
               c = c + 1;
               savedvalue=matrix2200names(k,j);
               matrixCopy = transpose(matrix2200names);
               matrixCopy(1,j);                          
               sortedarray = sortrows(matrixCopy,j);
               for counter = 1:rank
                   if(matrix2200names(k,1) == sortedarray(counter,1))
                       prob = prob + 1;
                   end
               end                           
           end               
       end
    end
    total_prob = [total_prob,prob/22];
end
plot(xaxis, total_prob);
title('CMC Graph');
xlabel('Rank');
ylabel('Recognition Rate');