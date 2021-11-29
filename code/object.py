from PySide2.QtCore import QTimer, QObject, Slot, Signal
import main

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
        self.settoken.emit(self.tokens)

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
        self.timer = QTimer()
        self.timer.setInterval(100)
        self.timer.timeout.connect(self.fire)
        self.timer.start()

    @Slot(str)
    def fire(self, name):
        enabled = all(arc.isEnabled() for arc in self.set_of_inArcs)
        print("fire")
        if(enabled and name == self.name):
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
