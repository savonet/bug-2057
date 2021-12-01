all: files

files: song.mp3
	for i in `seq 1000 1998`; do if [ ! -e $$i.mp3 ]; then ln -s song.mp3 $$i.mp3; fi; done

song.mp3:
	ffmpeg -f lavfi -i "sine=frequency=440:duration=0.3" -ac 2 $@
