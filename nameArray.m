
%the code to pull the names of the folder 
 [P F] = subdir('/home/karthic/Desktop/Assignments/biometrics/iris/matlab-code/images/lg4000');
 folderName = [];

files = {};
%Loop that isolates the text file
for k = 1:300
 
A = F{1,k};
path = P{1,k}
cd(path);
C=A{1,1};
seqid = strings;
id = fopen(C);
%Isolates the file name and copies it to the destination folder
filename = strsplit(C, '.');
filename = filename(1,1);
filename = filename{1};
filename = str2num(filename);
files = [files, filename];

end
files = transpose(files);



