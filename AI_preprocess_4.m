close all
clear all

%% wavelet transform parameters

% sampling frequency
fs = 300;
% number of workers
M = 16;

%% load the data
% D1 = load('E:\AI_data\Augmented\AF.mat');
% D2 = load('E:\AI_data\Augmented\Noisy.mat');
% D3 = load('E:\AI_data\Augmented\Normal.mat');
% D4 = load('E:\AI_data\Augmented\Other.mat');

D1 = load('E:\AI_data\Test\AF.mat');
D2 = load('E:\AI_data\Test\Noisy.mat');
D3 = load('E:\AI_data\Test\Normal.mat');
D4 = load('E:\AI_data\Test\Other.mat');



%% Calculate and save the scalograms
% AF
parfor (k = 1:numel(D1.V1A),M)
    f11 = figure('visible','off');
   
    sig = fill_outliers(D1.V1A{k});

    sig = sig.^2;

    sig = normalize(sig,'range',[-1,1]);

    %sig = diff(sig);

    sig = resample(sig,2,1);
    
    [wt,f] = cwt(sig,600);
    t = 0:numel(sig)-1;
    hp = pcolor(t,f,abs(wt));
    hp.EdgeColor = 'none';
    xlabel('Seconds');
    set(gca,'yscale','log')
    ylabel('Hz');
    title('EEG Scalogram')
    colormap('jet');
    axis off;
    
    set(gca,'position',[0 0 1 1],'units','normalized');
    set(gcf,'PaperUnits','inches','PaperPosition',[0 0 1.707 1.707]);
    
    fname = 'E:\AI_test\AF';
    formatSpec = "AF_filtered_scalogram_%d.png";
    str = sprintf(formatSpec,k);
    filename = fullfile(fname,str);
    saveas(gcf,filename,'png');
    export_fig filename -r100 -a1;
    close(f11);
    
    if mod(k,100) == 0
        disp('AF: ') 
        disp(k)
    end
end

% Noisy
parfor (k = 1:numel(D2.V2A),M)
    f11 = figure('visible','off');
    sig = fill_outliers(D2.V2A{k});

    sig = sig.^2;

    sig = normalize(sig,'range',[-1,1]);

    %sig = diff(sig);

    sig = resample(sig,2,1);
    
    [wt,f] = cwt(sig,600);
    t = 0:numel(sig)-1;
    hp = pcolor(t,f,abs(wt));
    hp.EdgeColor = 'none';
    xlabel('Seconds');
    set(gca,'yscale','log')
    ylabel('Hz');
    title('EEG Scalogram')
    colormap('jet');
    axis off;

    set(gca,'Position',[0 0 1 1],'units','normalized');
    set(gcf,'PaperUnits','inches','PaperPosition',[0 0 1.707 1.707]);
    fname = 'E:\AI_test\Noisy';
    formatSpec = "Noisy_filtered_scalogram_%d.png";
    str = sprintf(formatSpec,k);
    filename = fullfile(fname,str);
    saveas(gcf,filename,'png');
    export_fig filename -r100 -a1;
    close(f11);
    
    if mod(k,100) == 0
        disp('Noisy: ') 
        disp(k)
    end
end

% Normal
parfor (k = 1:numel(D3.V3A),M)
    f11 = figure('visible','off');
    
    sig = fill_outliers(D3.V3A{k});

    sig = sig.^2;

    sig = normalize(sig,'range',[-1,1]);

    %sig = diff(sig);

    sig = resample(sig,2,1);
    
    [wt,f] = cwt(sig,600);
    t = 0:numel(sig)-1;
    
    hp = pcolor(t,f,abs(wt));
    hp.EdgeColor = 'none';
    xlabel('Seconds');
    set(gca,'yscale','log')
    ylabel('Hz');
    title('EEG Scalogram')
    colormap('jet');
    axis off;

    set(gca,'Position',[0 0 1 1],'units','normalized');
    set(gcf,'PaperUnits','inches','PaperPosition',[0 0 1.707 1.707]);
    fname = 'E:\AI_test\Normal';
    formatSpec = "Normal__filtered_scalogram_%d.png";
    str = sprintf(formatSpec,k);
    filename = fullfile(fname,str);
    saveas(gcf,filename,'png');
    export_fig filename -r100 -a1;;
    close(f11);
    
    if mod(k,100) == 0
        disp('Normal: ')
        disp(k)
    end
end

% Other
parfor (k = 1:numel(D4.V4A),M)
    f11 = figure('visible','off');
    
    sig = fill_outliers(D4.V4A{k});

    sig = sig.^2;

    sig = normalize(sig,'range',[-1,1]);

    %sig = diff(sig);

    sig = resample(sig,2,1);
    
    [wt,f] = cwt(sig,600);
    t = 0:numel(sig)-1;
    
    hp = pcolor(t,f,abs(wt));
    hp.EdgeColor = 'none';
    xlabel('Seconds');
    set(gca,'yscale','log')
    ylabel('Hz');
    title('EEG Scalogram')
    colormap('jet');
    axis off;

    set(gca,'Position',[0 0 1 1],'units','normalized');
    set(gcf,'PaperUnits','inches','PaperPosition',[0 0 1.707 1.707]);
    fname = 'E:\AI_test\Other';
    formatSpec = "Other_filtered_scalogram_%d.png";
    str = sprintf(formatSpec,k);
    filename = fullfile(fname,str);
    saveas(gcf,filename,'png');
    export_fig filename -r100 -a1;
    close(f11);
    
    if mod(k,100) == 0
        disp('Other: ')
        disp(k)
    end
end