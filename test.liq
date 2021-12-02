#!../liquidsoap ../../libs/stdlib.liq
#!/usr/bin/env liquidsoap
log.level.set(1)
settings.decoder.priorities.mad.set(1000)

played = ref([])
total = 10

def on_track(m)
  f = m['filename']
  print("Song: #{f} (#{float(list.length(!played)) / float(total) * 100.}%)")
  if list.mem(f, !played) then
    print("It seems that we have already played this file!...")
    # exit(1)
  end
  played := list.add(f, !played)
end

def on_reload(_)
  print("Reloading.")
  played := []
end

s = playlist(on_reload=on_reload, reload=1, reload_mode="rounds", "files")
s.on_track(on_track)
output.dummy(fallible=true, s)
