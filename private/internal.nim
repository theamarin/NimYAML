#            NimYAML - YAML implementation in Nim
#        (c) Copyright 2016 Felix Krause
#
#    See the file "copying.txt", included in this
#    distribution, for details about the copyright.

template internalError*(s: string) =
  when not defined(release):
    let ii = instantiationInfo()
    echo "[NimYAML] Error in file ", ii.filename, " at line ", ii.line, ":"
    echo s
    when not defined(JS):
      echo "[NimYAML] Stacktrace:"
      try: writeStackTrace()
      except: discard
    echo "[NimYAML] Please report this bug."
    quit 1
template yAssert*(e: typed) =
  when not defined(release):
    if not e:
      let ii = instantiationInfo()
      echo "[NimYAML] Error in file ", ii.filename, " at line ", ii.line, ":"
      echo "assertion failed!"
      when not defined(JS):
        echo "[NimYAML] Stacktrace:"
        try: writeStackTrace()
        except: discard
      echo "[NimYAML] Please report this bug."
      quit 1