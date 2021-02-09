clear all
close all

%% read filenames and labels
% read filenames from dorectory
D = dir('*.mat');

% read the labels
reference = readtable('REFERENCE.csv',"ReadVariableNames",false);

%% read the samples
for i = 1:length(D)
    filename = convertCharsToStrings(D(i).name);
    signal = open(filename);
    V{i} = signal.val;
end

%% organize the samples in own folders
for i = 1:numel(V)
    t = V{i};
    if char(reference.Var2(i)) == 'N'
        filename = ['A',num2str(i),'.mat'];
        f = fullfile('g:\','AI_data','Normal',filename);
        save(f,'t');
        
    elseif char(reference.Var2(i)) == 'O'
        filename = ['A',num2str(i),'.mat'];
        f = fullfile('g:\','AI_data','Other',filename);
        save(f,'t');
        
    elseif char(reference.Var2(i)) == 'A'
        filename = ['A',num2str(i),'.mat'];
        f = fullfile('g:\','AI_data','AF',filename);
        save(f,'t');
        
    else 
        filename = ['A',num2str(i),'.mat'];
        f = fullfile('g:\','AI_data','Noisy',filename);
        save(f,'t');  
    end
end




