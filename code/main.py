# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys
from time import strftime, localtime
#import petri_net1

from PySide2.QtGui import QGuiApplication
from PySide2.QtGui import QWindow
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QTimer, QObject, Slot, Signal

class Places(QObject):
    setToken = Signal(int)
    def __init__(self, tokens, name):
        self.tokens = tokens
        self.name = name
        QObject.__init__(self)
        self.timer = QTimer()
        self.timer.setInterval(100)
        self.timer.timeout.connect(self.displayToken)
        self.timer.start()

    def displayToken(self):
        self.setToken.emit(self.tokens)

    @Slot(int)
    def reset(self, newToken):
      self.tokens = newToken

class Arc:
    def __init__(self, place, amount_fired):
        self.place = place
        self.amount_fired = 1

class inArc(Arc):
    def activate(self):
        self.place.tokens -= self.amount_fired
    def isEnabled(self):
        return self.place.tokens >= self.amount_fired

class outArc(Arc):
    def activate(self):
        self.place.tokens += self.amount_fired

class Transition(QObject):
    firesig = Signal(bool)
    def __init__(self, outArcs, inArcs, name):
        """
        Args:
            1. outArcs: List
            2. inArcs: List
        """
        self.set_of_outArcs = set(outArcs)
        self.set_of_inArcs = set(inArcs)
        self.arcs = self.set_of_outArcs.union(self.set_of_inArcs)
        self.name = name
        QObject.__init__(self)

    @Slot()
    def fire(self):
        enabled = all(arc.isEnabled() for arc in self.set_of_inArcs)
        if(enabled):
            for arc in self.arcs:
                arc.activate()
        return enabled #Just for Debugging


class Petri_Nets:
    def __init__(self, transitions, places):
        self.set_of_trans = transitions
        self.set_of_places = places

    def run(self, fire_seqs):
        for state in fire_seqs:
            state.fire()
            tokens = [str(p.tokens) for p in self.set_of_places]
            print(" - ".join(tokens))
    
    def reset(self):
        for item in self.set_of_places:
            item.tokens = 0
def main():
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    #Net1
    #Define places
    free1 = Places(1, "free")
    docu1 = Places(0, "docu")
    busy1 = Places(0, "busy")

    #Define transitions
    start1 = Transition([outArc(busy1, 1)], [inArc(free1,1)], "start")
    change1 = Transition([outArc(docu1, 1)], [inArc(busy1,1)], "change")
    end1 = Transition([outArc(free1, 1)], [inArc(docu1,1)], "end")

    #Link from Python to QML file
    #For places
    engine.rootContext().setContextProperty("pfree1", free1)
    engine.rootContext().setContextProperty("pdocu1", docu1)
    engine.rootContext().setContextProperty("pbusy1", busy1)

    #For transitions
    engine.rootContext().setContextProperty("tstart1", start1)
    engine.rootContext().setContextProperty("tchange1", change1)
    engine.rootContext().setContextProperty("tend1", end1)

    #Net2
    #Define places
    wait2 = Places(3, "wait")
    inside2 = Places(0, "inside")
    done2 = Places(0, "done")

    start2 = Transition([outArc(inside2, 1)], [inArc(wait2,1)], "start")
    change2 = Transition([outArc(done2,1)], [inArc(inside2,1)], "change")

    #Link from Python to QML file
    #For places
    engine.rootContext().setContextProperty("pwait2", wait2)
    engine.rootContext().setContextProperty("pinside2", inside2)
    engine.rootContext().setContextProperty("pdone2", done2)

    #For transitions
    engine.rootContext().setContextProperty("tstart2", start2)
    engine.rootContext().setContextProperty("tchange2", change2)

    #Net3
    #Define places
    free = Places(1, "free")
    docu = Places(0, "docu")
    busy = Places(0, "busy")

    wait = Places(3, "wait")
    inside = Places(0, "inside")
    done = Places(0, "done")

    #Define transitions
    start = Transition([outArc(inside, 1), outArc(busy, 1)], [inArc(wait,1), inArc(free,1)], "start")
    change = Transition([outArc(done,1), outArc(docu, 1)], [inArc(inside,1), inArc(busy,1)], "change")
    end = Transition([outArc(free, 1)], [inArc(docu,1)], "end")
    net3 = Petri_Nets([start, change, end], [wait, inside, busy, docu, done, free])
    #Link from Python to QML file
    #For places
    engine.rootContext().setContextProperty("pfree", free)
    engine.rootContext().setContextProperty("pdocu", docu)
    engine.rootContext().setContextProperty("pbusy", busy)

    engine.rootContext().setContextProperty("pwait", wait)
    engine.rootContext().setContextProperty("pinside", inside)
    engine.rootContext().setContextProperty("pdone", done)
    engine.rootContext().setContextProperty("tnet3", net3)
    #For transitions
    engine.rootContext().setContextProperty("tstart", start)
    engine.rootContext().setContextProperty("tchange", change)
    engine.rootContext().setContextProperty("tend", end)

    engine.load(os.fspath(Path(__file__).resolve().parent / "main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
main()
