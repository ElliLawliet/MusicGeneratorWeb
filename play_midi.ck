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