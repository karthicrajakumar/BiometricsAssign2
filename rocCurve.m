%To plot the ROC curve using FNMR and FMR.
%where FMR = (No. of False match results) /(No. of false identity claims)
%and FNMR = (No. of false match non-match results)/(No. of true identity claims)

%Saving the total no of false identity and true identity 
%by taking the length of imposter array and genuine distribution array
totalFalseIdentity = length(iarray);
totalTrueIdentity = length(garray);
count=0
fmr = [];
fnmr = [];

%to find the FMR and FNMR for each point by varing the threshold by 0.01
for i=0:99
    count = count + 0.01;
    icount = 0;
    gcount = 0;
    %fprintf('count value is %d\n', count);
    
    %finding the no. of false match results
    for j=1:totalFalseIdentity
        if iarray(1,j) <= count
            icount = icount + 1;
        end
    end
    
    %Finding the no. of false non-match results
    for j=1:totalTrueIdentity
        if garray(1,j) >= count
            gcount = gcount + 1;
        end
    end
    
    %calculating FMR, FNMR and storing them in an array to plot
    fmrcalc = icount/totalFalseIdentity;
    fnmrcalc = gcount/totalTrueIdentity;
    fmr = [fmr, fmrcalc];
    fnmr = [fnmr, fnmrcalc];
end

%Plotting the ROC Curve
plot(fnmr,fmr);
xlabel('False Match Rate');
ylabel('False Non Match Rate');
title('ROC Curve');
