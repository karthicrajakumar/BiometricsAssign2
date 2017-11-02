

%This code pullls one left eye photo from each source subfolder and 
%copy's it to the probe folder 
 [P F] = subdir('C:\Users\boltz\Desktop\biometrics\iriscode\2008-03-11_13');
 destination='C:\Users\boltz\Desktop\biometrics\iriscode\LG-2200-2008-gallery';
 folderName = [];


%Loop that isolates the text file
for k = 1:300
 
A = F{1,k};
path = P{1,k}
cd(path);
C=A{1,1};
seqid = strings;
id = fopen(C);
%Scans txt file for left eye
for j=1:665
    new=fgetl(id);
    fprintf(1, 'Now reading line  %s\n', new);
    ifseqid = contains(new,'sequenceid');
    ifeye = contains(new, 'Left');

    if ifseqid
        seqid = new;
        fprintf(1, 'Now reading inside if  %s\n', new);
    end
    if ifeye
        fprintf(1, 'Now reading if eye  %s\n', new);
        break;
    end
end
%Isolates the file name and copies it to the destination folder
filename = strsplit(seqid, 'g');
asd = filename{1,2};
baseFileName = [asd '.tiff'];
  fullFileName = fullfile(path, strtrim(baseFileName));
  fprintf(1, 'Now reading %s\n', fullFileName);
copyfile(fullFileName,destination);
%this code creates a list of foldernames for reference 
folderNameSplit= strsplit(asd,'d');
folderName = [folderName, folderNameSplit(1,1)];
end



