%Vary the threshold value
%each separate thresold value calculate 
    %the fmr and fnmr
%plot the graph

totalFalseIdentity = length(iarray);
totalTrueIdentity = length(garray);
count=0
fmr = [];
fnmr = [];
for i=0:99
    count = count + 0.01;
    icount = 0;
    gcount = 0;
    fprintf('count value is %d\n', count);
    for j=1:totalFalseIdentity
        if iarray(1,j) <= count
            icount = icount + 1;
        end
    end
    for j=1:totalTrueIdentity
        if garray(1,j) >= count
            gcount = gcount + 1;
        end
    end
    fmrcalc = icount/totalFalseIdentity;
    fnmrcalc = gcount/totalTrueIdentity;
    fmr = [fmr, fmrcalc];
    fnmr = [fnmr, fnmrcalc];
end

plot(fnmr,fmr);
xlabel('False Match Rate');
ylabel('False Non Match Rate');
title('ROC Curve');