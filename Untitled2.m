
[P F] = subdir('C:\Users\boltz\Desktop\biometrics\iriscode\testdatabase');
A = F{1,1};
path = P{1,1}
cd(path);
C=A{1,1};
seqid = strings;
id = fopen(C);

for k=1:length(C)
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
destination='C:\Users\boltz\Desktop\biometrics\iriscode\testdatabase2'
movefile(fullFileName,destination);