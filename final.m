% Specify the folder where the files live.
myFolder= 'C:\Users\boltz\Desktop\biometrics\iriscode\LG-2200-2010-probe';
% Check to make sure that folder actually exists.  Warn user if it doesn't.
if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.tiff');
%matrix to store all hamming distance scores
matrix =eye(220);

% Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1: length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'First Loop: Now reading%s\n', fullFileName);
  [template1,mask1]=createiristemplate(fullFileName);   
  
  %Change to gallery folder to compare 1 probe to all the gallery photos
  myFolder='C:\Users\boltz\Desktop\biometrics\iriscode\LG2200-2008-gallery';
  filePattern = fullfile(myFolder, '*.tiff');
  theFiles = dir(filePattern);
  for j = 1: length(theFiles) 
    baseFileName = theFiles(j).name;
    fullFileName = fullfile(myFolder, baseFileName);
    fprintf(1, 'Second Loop: Now reading%s\n', fullFileName);
    [template2, mask2] = createiristemplate(fullFileName);
    
    %The matchscores are saved in a matrix which would be used for final calculations
    matrix(k,j) = gethammingdistance(template1, mask1, template2, mask2, 1);
  end 
  %Change back to probe
  myFolder='C:\Users\boltz\Desktop\biometrics\iriscode\LG-2200-2010-probe';
  filePattern = fullfile(myFolder, '*.tiff');
  theFiles = dir(filePattern);
  fprintf(1, 'First Loop: Now reading changed path %s\n', fullFileName);
end
%Saving the matrix
matrix2200=matrix(1:220,1:88);

