%The Code to generate the CMC( Cumulative Match Characteristic Curve)for
%the LG4000 and LG2200 Dataset.

%Clear the workspace.
clear();

%Load the two matrix variables. 
%   -matrix2200names.mat
%   -matrix4000names.mat (matrix)

load('matrix2200names.mat');
load('matrix4000names.mat');

matrix1 = matrix2200names;
matrix2= matrix;


%Control which matrix the code uses using the variable currentDistMatrix.
%using matrix1 and matrix2.

currentCMCMatrix = matrix2;

%varibles init.
sortedarray=[];
matrixCopy = [];
total_prob = [];
prob =0 ;



%In this function we perform from Rank 1 Recognition Rate to Rank 88
%Recognition Rate(i.e. the number of subjects in the gallery).

%If the match is found in the desired ranks (i.e if the first match in a
%Rank one is correct) we increment the prob variable which will help us
%find the probability later.
for rank= 1:89
    c = 0 ;
    prob =0;
    for k=2:221
       for j=2:89
           if currentCMCMatrix(k,1)==currentCMCMatrix(1,j)
               garray=[];
               c = c + 1;
               savedvalue=currentCMCMatrix(k,j);
               
               %Transposing matrix for rearranging the columns and sorting
               %on the scores to find the closest match for the Rank.
               matrixCopy = transpose(currentCMCMatrix);
               matrixCopy(1,j);                          
               sortedarray = sortrows(matrixCopy,j);
               
               %For the current rank find if there's a match.
               for counter = 1:rank
                   if(currentCMCMatrix(k,1) == sortedarray(counter,1))
                       prob = prob + 1;
                   end
               end                           
           end               
       end
    end
    
    %Calculate the total probability of each rank, we know that there are
    %only 22 matches in the entire gallery vs probes.
    %total_prob is a numeric vector containing rank from 1 to 89.
    total_prob = [total_prob,prob/22];
end

%From Rank 1 to Rank 89.
xaxis=[1:89];
%Plot against the total probability vector.
plot(xaxis, total_prob);
title('CMC Graph');
xlabel('Rank');
ylabel('Recognition Rate');
