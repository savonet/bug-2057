#!/usr/bin/env liquidsoap
log.level.set(1)
settings.decoder.priorities.mad.set(1000)

played = ref([])

def track(m)
  f = m['filename']
  print(newline=false, "song: #{f} (#{float(list.length(!played)) / 10.}%)\r")
  if list.mem(f, !played) then
    print("already present among #{list.length(!played)}")
    shutdown()
  end
  played := list.add(f, !played)
end
def reload(_)
  print("Reloading!")
  played := []
end

s = playlist(on_reload=reload, "files")
s.on_track(track)
output.dummy(fallible=true, s)