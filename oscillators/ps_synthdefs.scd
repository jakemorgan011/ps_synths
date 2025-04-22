
SynthDef(\ps_tri, {|out, sustain=1, pan, accelerate, freq, fm_freq = 3, fm_amnt = 1 |
	var env = EnvGen.ar(Env.linen(0.2, 0.98, 0.01, 1, -3), timeScale:sustain, doneAction:2);
	var sound = LFTri.ar(freq * Line.kr(1,1+accelerate, sustain));
	var fm = SinOsc.ar(fm_freq) * fm_amnt;
	sound = sound*fm;
	Out.ar(out, DirtPan.ar(sound, ~dirt.numChannels, pan, env));
}).add;


SynthDef(\ps_sin, {|out, sustain=1, pan, accelerate, freq, fm_freq = 3, fm_amnt = 1 |
	var env = EnvGen.ar(Env.linen(0.2, 0.98, 0.01, 1, -3), timeScale:sustain, doneAction:2);
	var sound = SinOsc.ar(freq * Line.kr(1,1+accelerate, sustain));
	var fm = SinOsc.ar(fm_freq) * fm_amnt;
	sound = sound*fm;
	Out.ar(out, DirtPan.ar(sound, ~dirt.numChannels, pan, env));
}).add;

SynthDef(\ps_tri_perc, {|out, sustain=1, pan, accelerate, freq |
	var env = EnvGen.ar(Env.perc(0.1, 0.999, 1, -4), timeScale:sustain, doneAction:2);
	var sound = LFTri.ar(freq * Line.kr(1,1+accelerate, sustain));
	Out.ar(out, DirtPan.ar(sound, ~dirt.numChannels, pan, env));
}).add;