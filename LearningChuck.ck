[[59, 51, 54], [52, 56, 59], [49, 52, 56], [54, 57, 49]]@=> int ChordNotes[][];
[4, 4, 4, 4]@=> int chordLength[];
[35, 28, 25, 30]@=> int BassNotes[];
[0.5, 0.25, 0.5, 0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.25, 1.0, 1.0, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25, 0.5, 0.25, 0.5, 0.5, 2.0, 0.25, 0.25, 0.5, -0.25]@=> float MelodyLength[];
[90, 82, 87, 88, 90, 92, 94, 92, 94, 95, 94, 95, 90, 83, 82, 90, 88, 90, 88, 80, 82, 83, 85, 87, 85, 87, 83, 88, 80, 87, 95, 90, 92, 85, 87, 83]@=> int MelodyNotes[];
[4.0, 4.0, 4.0, 4.0]@=> float BassLength[];
1=> int extender;
"none" => string environment;

int done;

{   NRev reverb => dac;
    SinOsc s => ADSR env => reverb ;
    0.5 => s.gain;
    0.1 => reverb.mix;
   for(0 => int i; i < MelodyNotes.cap();i++)
        {
        Std.mtof(MelodyNotes[i]) => s.freq;
            float duration;
            1.0 => duration;
            //<<< duration>>>;
            (50::ms, duration::second, 1, duration::second) => env.set;
             env.keyOn();
            100::ms => now;
            env.keyOff();
            env.releaseTime() => now;
            0.5::second => now; 
        
            }
         
     } 