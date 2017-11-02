% Specify the folder where the files live.
myFolder = 'C:/Users/boltz/Desktop/biometrics/iriscode/testdatabase';
P = SUBDIR ('myFolder');
Q = SUBDIR ('P');
[R F] = SUBDIR('Q');



% Check to make sure that folder actually exists.  Warn user if it doesn't.
if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.tiff');
matrix =eye();
 [P F] = subdir('C:\Users\boltz\Desktop\biometrics\iriscode\testdatabase');

 % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1: length(theFiles)
 
A = F{1,k};
cd(P{1,k});
C=A{1,1};
seqid = strings;
id = fopen(C);

    baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
 % Now do whatever you want with this file name,
 % such as reading it in as an image array with imread()
    templatename=baseFileName(1:end-5);
    maskname=baseFileName(1:end-5);
    templatename=strcat(templatename,'template.mat');
    maskname=strcat(maskname,'mask.mat');
   [template1,mask1]=createiristemplate(fullFileName);
    
    matrix(k,k)=gethammingdistance(template1, mask1, template1, mask1, 1);
 for j = k+1: length(theFiles) 
    baseFileName = theFiles(j).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
   [template2, mask2] = createiristemplate(fullFileName);
  matrix(k,j) = gethammingdistance(template1, mask1, template2, mask2, 1);

 end 
 %ajorMatrix = [majorMatrix; matrix];
end



