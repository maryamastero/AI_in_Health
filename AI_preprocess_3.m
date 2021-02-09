clear all
close all

%% Data agumentation

ref = 4040; % number of normal samples
M = 16; % number of workers

%% Process each folder separately
% D1 = dir('E:\AI_data\AF\Train\*.mat');
% D2 = dir('E:\AI_data\Noisy\Train\*.mat');
% D3 = dir('E:\AI_data\Normal\Train\*.mat');
% D4 = dir('E:\AI_data\Other\Train\*.mat');

D1 = dir('E:\AI_data\AF\Test\*.mat');
D2 = dir('E:\AI_data\Noisy\Test\*.mat');
D3 = dir('E:\AI_data\Normal\Test\*.mat');
D4 = dir('E:\AI_data\Other\Test\*.mat');

filepath = 'E:\AI_data\';

% set the sample length 
sample_length = 300*9;

%% load the timeseries
parfor (i = 1:length(D1),M)
    
    filename = convertCharsToStrings(D1(i).name);
    loadname = fullfile(filepath,'AF','Test',filename);
    signal = open(loadname);
    V1{i} = signal.t;
end

parfor (i = 1:length(D2),M)
    filename = convertCharsToStrings(D2(i).name);
    loadname = fullfile(filepath,'Noisy','Test',filename);
    signal = open(loadname);
    V2{i} = signal.t;
end

parfor (i = 1:length(D3),M)
    filename = convertCharsToStrings(D3(i).name);
    loadname = fullfile(filepath,'Normal','Test',filename);
    signal = open(loadname);
    V3{i} = signal.t;
end

parfor (i = 1:length(D4),M)
    filename = convertCharsToStrings(D4(i).name);
    loadname = fullfile(filepath,'Other','Test',filename);
    signal = open(loadname);
    V4{i} = signal.t;
end

%% augment by taking the subsamples
parfor (i = 1:numel(D1),M)
    m = mod(i,length(V1));
    if m == 0
      m = length(V1); 
    end
    s = V1{m};
    len_s = length(s);
    max_start = len_s - sample_length;
    start = randi([1,max_start]);
    ending = start + sample_length -1;
    V1A{i} = s(start:ending);
    
end

parfor (i = 1:numel(D2),M)
    m = mod(i,length(V2));
    if m == 0
      m = length(V2); 
    end
    s = V2{m};
    len_s = length(s);
    max_start = len_s - sample_length
    start = randi([1,max_start])
    V2A{i} = s(start:(start+sample_length))
end

% take a subsample from each of the signals
parfor (i = 1:numel(D3),M)
    m = mod(i,length(V3));
    if m == 0
      m = length(V3); 
    end
    s = V3{i};
    len_s = length(s);
    max_start = len_s - sample_length
    start = randi([1,max_start])
    V3A{i} = s(start:(start+sample_length))
end

parfor (i = 1:numel(D4),M)
    m = mod(i,length(V4));
    if m == 0
      m = length(V4); 
    end
    s = V4{m};
    len_s = length(s);
    max_start = len_s - sample_length
    start = randi([1,max_start])
    V4A{i} = s(start:(start+sample_length))
end

%% Save the augmented subsamples to disk
save('E:\AI_data\test\AF.mat', 'V1A');
save('E:\AI_data\test\Noisy.mat', 'V2A');
save('E:\AI_data\test\Normal.mat', 'V3A');
save('E:\AI_data\test\Other.mat', 'V4A');
