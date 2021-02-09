clear all
close all

%% Select files randomly and create a training set and a test set

Dest1  = 'E:\AI_data\Other\Test';
Dest2  = 'E:\AI_data\Other\Train';
Folder = 'E:\AI_data\Other';
FileList = dir(fullfile(Folder, '*.mat'));
len = numel(FileList);
count = fix(len*0.2);
Index    = randperm(numel(FileList), len);

%% copy files in the new folders
for k = 1:len
    
  if k <= count
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest1);
    
  else
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest2);
    
  end
end