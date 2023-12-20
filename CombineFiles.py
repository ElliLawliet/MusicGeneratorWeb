filenames = ['MusicArray.ck', 'play_midi.ck']
with open('LearningChuck.ck', 'w') as outfile:
    for fname in filenames:
        with open(fname) as infile:
            for line in infile:
                outfile.write(line)