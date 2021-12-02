#!/usr/bin/env liquidsoap
log.level.set(1)
settings.decoder.priorities.mad.set(1000)

played = ref([])
total = 10

def on_track(m)
  f = m['filename']
  print("song: #{f} (#{float(list.length(!played)) / float(total) * 100.}%)")
  if list.mem(f, !played) then
    print("already present among #{list.length(!played)}")
    exit(1)
  end
  played := list.add(f, !played)
end

def on_reload(_)
  print("Reloading!...")
  played := []
end

s = playlist(on_reload=on_reload, reload=1, reload_mode="rounds", "files")
s.on_track(on_track)
output.dummy(fallible=true, s)
