
[P F] = subdir('C:\Users\boltz\Desktop\biometrics\iriscode\2010-04-27_29');
A = F{1,1};
path = P{1,1}
cd(path);
C=A{1,1};
seqid = strings;
id = fopen(C);

for k=1:250
    new=fgetl(id);
    ifseqid = contains(new,'sequenceid');
    ifeye = contains(new, 'Left');

    if ifseqid
        seqid = new;
    end
    if ifeye
        break;
    end
end

filename = strsplit(seqid, '0');
asd = filename{1,2};

imagename = ['0' asd '.tiff'];
fullFileName = fullfile(path, strtrim(imagename));
destination='C:\Users\boltz\Desktop\biometrics\iriscode\LG-4000-2010'
movefile(fullFileName,destination);