function TempoTemplateMatching(audiotoestimate) %function that actually estimates the tempo
     
    [x, fs] = audioread(audiotoestimate); %building on the template matching from HW4
    fft_size = 2^14;
    noverlap = floor(fft_size/1.1);
    [S, F, T] = spectrogram( x, hanning(fft_size), noverlap, fft_size, fs );
    S = abs(S);
    bpms = [80 85 90 95 100 105 110 115 120 125 130 135 140 145 150 155 160 165 170 175 180 185 190 195 200 205 210 215 220 ];
    figure(1); %Displays figure 1
    imagesc( S.^0.5);
    set(gca, 'YDir', 'normal' );  
    saveas(gca,'Specto1.png') %saves spectogram as PNG
    accuracy = [];
    
    for i = 1:29 %tests again click tracks of BPMs by 5s from 80 to 220
       
        soundfilename = int2str(bpms(i:i));%grabs correct wav file
        fileextension = ".wav";
        soundfilewhole = strcat(soundfilename,fileextension);
        [y, fs2] = audioread(soundfilewhole);
        if length(y) < length(x)
           y(numel(x)) = 0;
        end
        y = y(1:length(x));
        [S, F, T] = spectrogram( y, hanning(fft_size), noverlap, fft_size, fs ); 
        S = abs(S);
        y = y(1:length(x));
        figure(2); %makes a spectogram of t
        imagesc( S.^0.5);
        set(gca, 'YDir', 'normal' );  
    %     xlabel('Frames');
    %     ylabel('Bins');
        saveas(gca,'Specto2.png')
        ref = imread("Specto1.png");
        clicktrack = imread("Specto2.png"); 
        [ssimval2,ssimmap] = ssim(clicktrack,ref); %using the ssim the 
        % contents of the 2 graphs are compared, the closer they are the closer to 1 ssimval
        accuracy = [accuracy ssimval2]; %creates a list of how close the pictures were
    
    end
    
    [a,b] =max(accuracy); %whichever was closet is output
    disp("estimated tempo is (within 11 bpm)")
    disp(bpms(b:b))
    disp ("or a half")
    disp(bpms(b:b)/2)
    accuracy = [];


    %Below here are some failed other concepts I had, mostly finished and
    %explained in the readme

    
%     for i = 1:29
%        
%         soundfilename = int2str(bpms(i:i));
%         fileextension = ".wav";
%         soundfilewhole = strcat(soundfilename,fileextension);
%         [y, fs2] = audioread(soundfilewhole);
%         if length(y) < length(x)
%     %         difference = length(x)-length(y);
%     %         e = zeros(1,difference);
%     %         y = horzcat(y,e');
%            y(numel(x)) = 0;
%         end
%         y = y(1:length(x));
%         y = y+x;
%         [S, F, T] = spectrogram( y, hanning(fft_size), noverlap, fft_size, fs );
%         S = abs(S);
%         y = y(1:length(x));
%         figure(2); %Displays figure 1
%         imagesc( S.^0.5);
%         set(gca, 'YDir', 'normal' );  
%     %     xlabel('Frames');
%     %     ylabel('Bins');
%         saveas(gca,'Specto2.png')
%         ref = imread("Specto1.png");
%         clicktrack = imread("Specto2.png"); 
%         [ssimval2,ssimmap] = ssim(clicktrack,ref);
%         accuracy = [accuracy ssimval2];
%     
%     end
%         [a,b] =max(accuracy);
%         bpms(b:b)
%         accuracy = [];
%     for i = 1:29
%        
%         soundfilename = int2str(bpms(i:i));
%         fileextension = ".wav";
%         soundfilewhole = strcat(soundfilename,fileextension);
%         [y, fs2] = audioread(soundfilewhole);
%         if length(y) < length(x)
%     %         difference = length(x)-length(y);
%     %         e = zeros(1,difference);
%     %         y = horzcat(y,e');
%            y(numel(x)) = 0;
%         end
%         y = y(1:length(x));
%         y = y+wn;
%         [S, F, T] = spectrogram( y, hanning(fft_size), noverlap, fft_size, fs );
%         S = abs(S);
%         y = y(1:length(x));
%         figure(2); %Displays figure 1
%         imagesc( S.^0.5);
%         set(gca, 'YDir', 'normal' );  
%     %     xlabel('Frames');
%     %     ylabel('Bins');
%         saveas(gca,'Specto2.png')
%         ref = imread("Specto1.png");
%         clicktrack = imread("Specto2.png"); 
%         [ssimval2,ssimmap] = ssim(clicktrack,ref);
%         accuracy = [accuracy ssimval2];
%     
%     end
%         [a,b] =max(accuracy);
%         bpms(b:b)
end
