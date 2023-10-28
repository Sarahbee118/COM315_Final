Final Project for Digital Audio Processing (COM315) at Connecticut College 
By Sarah Rigg

My idea was to create a program that used the idea of template matching to a click track determine Tempo. 
My reasoning for this was 2 fold. 
1. Most of the sources I found did autocorrelation to estimate tempo. 
Since we also used autocorrelation to find frequency it also made sense to me that you could use template matching 
for determining tempo as well.
2. Since spectograms show energy in a song over time I reasoned that that energy would be highest on the beats of the tempo, 
a click track which only has energy on those beats would be similar.

The program compares the spectogram of the audio sample (around 30 seconds in length) to click tracks of 4/4 tempos of BPMs of 80 to 220
with each subsequent file increasing by 5, I'll call them blocks.


The data I used to test my program was the same data tempo estimating algorithms would be tested on before sending to MIREX. 
Found here: https://www.music-ir.org/mirex/wiki/2021:Audio_Tempo_Estimation

My results can be found in the Results.csv file included. To summarize it estimated within 11 (2 blocks away + 1 to help with odd numbers being cut in half)
on either the actual estimate, a double, or a halve about 35% of the time. These results are not amazing but they are not so bad as to be insignifigant.
(note one song had a BPM that was lower than 80, however 80 was the estimated tempo so it was determined as correct)

A few personal songs, with heavy precussion, were tested and they also were withing the 11 bpm tolerance. 




Two other ideas, which the code for still remains in my project, that didn't pan out was attempting to combine the click track with either white noise or the sample itself. 
The idea behind this was the observation that results seemed to skew towards the max value which the assumed reason for was that it simply had the most audio within it. 
The hope was that if the tempo of the click track was correct it would blend in better with the sample, however neither of these appeared to work and continued to output the
same result no matter the track. I thought it worth mentioning here just so more context on the creative process could be given.

White noise and click tracks made by me in Audacity. 
