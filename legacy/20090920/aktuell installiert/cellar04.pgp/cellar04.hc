 
[hardwarekonfig]
wurzel: 8
[8.1]
spi: OBJEKTID=9
{8.3}
klasse: "HC_Moduluebersicht.Class"
name: _PRJ-Moduluebersicht
[17.1]
[17.100]
moduladr: 0
modulname: CPU
steckplatzgrp: "sysbus"
steckplatzinfo: NUMMER=1, MODULID=102, FLAGS=1
steckplatzgrp: "iobus"
steckplatzinfo: NUMMER=1, MODULID=103, FLAGS=3
steckplatzinfo: NUMMER=2, MODULID=103, FLAGS=2
steckplatzinfo: NUMMER=3, MODULID=103, FLAGS=2
steckplatzinfo: NUMMER=4, MODULID=103, FLAGS=2
anschlussgrp: "ser1"
anschlussinfo: NUMMER=1, MODULID=0, FLAGS=0
anschlussgrp: "ser3"
anschlussinfo: NUMMER=1, MODULID=0, FLAGS=0
anschlussgrp: "canio2"
anschlussinfo: NUMMER=1, MODULID=0, FLAGS=0
[17.101]
[17.106]
comparam_canio2: BAUD=250000, IDLEN=11
inaparam_canio2: NODENO=0, NODECOUNT=32, BASEID=1598, FORCE
ioparam_canio2: HANDLING=17, IOTIMEOUT=1000, SLAVETIMEOUT=8000, REPCOUNT=3, ANPCOUNT=80, PRI=1
ioparam2_canio2: IDLETIMEDI=640, IDLETIMEAI=640, IDLETIMEDO=640, IDLETIMEAO=640, INHIBITTIMEDI=5, INHIBITTIMEAI=20
[17.109]
comparam_ser3: 57600,e,8,1, TYPE="RS232", RIT=5, FORCE
inaparam_ser3: FORCE
modemparam_ser3: 57600,n,8,1, RIT=255
modeminit_ser3: STRING=ATS0=1
comparam_ser1: 115200,e,8,1, TYPE="RS232", RIT=5, FORCE
inaparam_ser1: FORCE
modemparam_ser1: 57600,n,8,1, RIT=255
modeminit_ser1: STRING=ATS0=1
{17.108}
klasse: "4PP035.0300-01"
[102.1]
[102.100]
moduladr: 1
modulname: Display
art: SUBKOMPONENTE
{102.101}
klasse: "4PP035030001dis"
[103.1]
[103.100]
moduladr: 1
modulname: IO
art: SUBKOMPONENTE
{103.101}
klasse: "4PP035030001io"
[9.1]
spi: OBJEKTID=17
{9.2}
klasse: "HC_SPS.Class"
familie: 3000
