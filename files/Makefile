all: files

files: song.mp3
	for i in `seq 1000 1008`; do if [ ! -e $$i.mp3 ]; then ln -s song.mp3 $$i.mp3; fi; done

song.mp3:
	ffmpeg -f lavfi -i "sine=frequency=440:duration=1" -ac 2 $@

clean:
	rm -f *.mp3
