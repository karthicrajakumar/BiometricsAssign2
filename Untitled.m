matrixG = [];
matrixI = [];

for k=1 : 220
    for j=1:88
        if k == j
            matrixG= [matrixG, matrix(k,j)];
        end
        if k ~= j
            matrixI = [matrixI,matrix(k,j)];
        end
    end
end

[counts1, binCenters1]=hist(matrixG,100);
[counts2, binCenters2]=hist(matrixI,100);
plot(binCenters1,counts1,'r-');
hold on;
plot(binCenters2, counts2, 'g-');
grid on;
