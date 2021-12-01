#!/usr/bin/env liquidsoap
log.level.set(1)
settings.decoder.priorities.mad.set(1000)

played = ref([])

def track(m)
  f = m['filename']
  print("song: #{f} (#{float(list.length(!played)) / 10.}%)")
  if list.mem(f, !played) then
    print("already present among #{list.length(!played)}")
    shutdown()
  end
  played := list.add(f, !played)
end
s = playlist("files")
s.on_track(track)
output.dummy(fallible=true, s)