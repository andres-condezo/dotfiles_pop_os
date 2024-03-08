import os, sys
import glob
import re
import argparse

dir = sys.argv[1]

srts = glob.glob(dir + "/*.srt")
for srt in srts:
    with open(srt, encoding="utf8", mode="r") as r:
        c = r.readlines()
        fulltime = re.compile("\d{2}:\d{2}:\d{2},\d{3} --> \d{2}:\d{2}:\d{2},\d{3}")
        indexre = re.compile("\d+\n")
        c = [s for s in c if not re.findall(fulltime, s) and not re.findall(indexre, s) and not s == "\n"]
        text = '\n'.join(c)

    with open(srt, encoding="utf8", mode="w") as w:
        w.write(text)
