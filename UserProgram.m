function UserProgram %a short program to allow user interaction with my algorithm
disp("In quotes input the name of a 30 sound file you would like to estimate the tempo of")
x = input('Or if you would like to see the training data estimated type "train" including the quotes >');
traintempos = [129.5 167.5 153 126 205.5 82 113.5 158 129 122.5 140 54 180 130 186 80.5 91.5 121.5 188 22.05];

if x == "train" %allows user to both see demonstration with train and input their own files
    for q = 1:20 %runs training data from MIREX
        number = int2str(q);
        fileextension = ".wav";
        trainfilewhole = strcat("train",number,fileextension);
        disp(trainfilewhole)
        TempoTemplateMatching(trainfilewhole)
        disp("Actual tempo is")
        disp(traintempos(q:q))
    end
else
    TempoTemplateMatching(x) %runs user inputted data
end