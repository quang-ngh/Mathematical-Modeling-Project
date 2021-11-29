"""
from object import *
print("Okey dokey")

#Define places
wait = Places(3, "wait")
inside = Places(0, "inside")
done = Places(0, "done")

#Define transitions
start = Transition([outArc(inside, 1)], [inArc(wait,1)], "start")
change = Transition([outArc(done,1)], [inArc(inside,1)], "change")

engine.rootContext().setContextProperty("wait", wait)
engine.rootContext().setContextProperty("tran", start)
engine.rootContext().setContextProperty("inside", inside)
engine.rootContext().setContextProperty("tran", change)
engine.rootContext().setContextProperty("done", done)
"""


#Define Petri net
#net = Petri_Nets([start, change],[wait, inside,done])
