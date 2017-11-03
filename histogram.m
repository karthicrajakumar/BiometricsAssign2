%The Code to generate the Impostor and Geniune Distributions of the
%dataset.

%clear the workspace
clear();

%Load the two matrix variables. 
%   -matrix2200names.mat
%   -matrix4000names.mat

load('matrix2200names.mat');
load('matrix4000names.mat');

%Control which matrix the code uses using the variable currentDistMatrix.
%using matrix1 and matrix2.

%The Geniune and Impostor vectors.
matrixG = [];
matrixI = [];

%The two matrix containing score values for LG2200 and LG4000.
matrix1 = matrix2200names;
matrix2= matrix;

%Control which matrix the code uses using this variable.
currentDistMatrix = matrix1;

for k=1 : 220
    for j=1:88
        
        %If the subject name is same mark it as a geniune score.
        if currentDistMatrix(k,1)==currentDistMatrix(1,j)
            matrixG= [matrixG, currentDistMatrix(k,j)];
        %else mark it as an impostor.
        elseif j~=1 && k~= 1
            matrixI = [matrixI,currentDistMatrix(k,j)];
            
        end
    end
end

%plotting the vectors.
figure;
ylabel('Frequency (percent)');
xlabel('Hamming Distance');

%the impostor distribution.
[histFreq, histXout] = hist(matrixI, 10);

%normalizing the yaxis to percentages because the difference is too big.
bar(histXout, histFreq/sum(histFreq)*100);
hold on;

%the geniune distribution.
[genfreq, genXout] = hist(matrixG, 10);
bar(genXout, genfreq/sum(genfreq)*100);

%the legends
legend('Imposter Distribution','Geniune Distribution')



