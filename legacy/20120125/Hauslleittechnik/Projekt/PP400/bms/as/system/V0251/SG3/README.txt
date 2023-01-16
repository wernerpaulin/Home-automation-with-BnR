	------------------------------------------------------------------------
README fuer RPSSW                   B&R Automation Software (C) B&R 2004
------------------------------------------------------------------------

"commserv.br" nachladen auf: IF100,IF101,ME910,ME913,ME915
                             ME960,ME963,ME965
                             CP430,CP470,CP770
"update.br" nachladen auf  : CP430,CP470,CP770,C221,IF100,IF101,AC701

#########################################################################
# ACHTUNG: CP200/CP210 nur mehr mit ME915 wegen Systemflash-Groesse !!! #
#########################################################################
Auszug aus dem Mail von Manfred Mitterbuchner vom 20.06.2000:

Zur Systemflash-Problematik habe ich mich mit Manfred Kuecher beraten und wir sind zu folgendem Ergebnis gekommen:

CP200, CP210: Ab RPSSW V2.24 wird nur mehr der AWS ME915 unterstützt, da dieser 512kB System Flash zur Verfügung stellt.

CPx70/CP430,IF100,ME91x,ME96x: Bei allen diesen Betriebssystemen wird der COMMSERV aus dem Basissystem entfernt
                               und zum Nachladen zur Verfuegung gestellt. Es werden nur mehr Fehlerkorrekturen
                               durchgefuehrt - Erweiterungen werden durch zusaetzliche Module realisiert.

-------------------------------------------------------------------------
#########################################################################
#########################################################################
-------------------------------------------------------------------------
!!! I N F O R M A T I O N !!!!
-------------------------------------------------------------------------
Folgende CPUs werden ab der ß-Verison X8.00 wegen kleinem
SYSROM (256KB SYSROM) nicht mehr unterstuetzt:

 - CP430
 - CP470
 - CP770
 - CP100 (mit ME910, ME913)
 - CP104 (mit ME910, ME913)
 - CP200 (mit ME910, ME913, ab V2.24 nur mehr mit ME915)
 - CP210 (mit ME910, ME913)
 - CP152 (mit ME96x)
 - CP153 (mit ME96x)
 - ME910
 - ME913
 - IF100
 - IF101
 - AC701
 - QBAUE
 - ME960
 - ME963
 - ME965
 - MP100 (mit ME910, ME913)

Diese CPUs werden in einen MINIMALEN Wartungszustand uebergefuehrt.
Etwaige Fehlerkorrekturen werden von Fall zu Fall nach Absprache
mit dem Management durchgefuehrt.
Versionsbezeichnung fuer ß-Versionen : von X7.00 bis einschliesslich X7.99
Versionsbezeichnung fuer V-Versionen : von V2.41 bis einschliesslich V2.45
--------------------------------------------------------------------------
Fuer alle anderen CPUs (mit 512KB SYSROM) wird folgende Versionsstrategie
verfolgt:
Versionsbezeichnung fuer ß-Versionen : von X8.00 bis einschliesslich X9.99
Versionsbezeichnung fuer V-Versionen : von V2.46 bis einschliesslich V2.59
--------------------------------------------------------------------------
##########################################################################
##########################################################################
--------------------------------------------------------------------------
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Version V2.51 vom xx.12.2009 entspricht Version X8.10                 +
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Version X8.10 vom 02.12.2009:
-----------------------------
- Basissystem:
     - A+P 220155: PV_xgetadr liefert Status 3092 seit AR 2.50 auf SG3


Version X8.09 vom 09.10.2009:
-----------------------------
 - Basissystem:
      - A+P 211100: Trace Zeitstempel Korrektur (dbtracer)

 - Libraries:
    - CAN_LIB:
        - A+P 213685: Neuer Fub CANxMulQueue

    - IOConfig:
	- A+P 213990: IOC2003 liefert Status 5556 wenn lokale Variablen im User-RAM abgelegt werden

    - sys_lib:
        - A+P 134380: Funktionsdeklarationen für TIM_musec() und TIM_ticks() ist um einen Dummy Parameter zu erweitern

    - ppdpr:
        - A+P 211595: PPDPR Lib wird am PP nicht gefunden


Version X8.08 vom 02.07.2009:
-----------------------------
 - Basissystem:
      - A+P 206965: PV Init Value Behandlung korrigiert

 - Libraries:
   - runtime:
      - A+P 132400: Profibus Norm - Standarddatentypen in Hilfe unvollständig beschrieben


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Version V2.50 vom 05.05.2009 entspricht Version X8.07 inkl:                 +
+ A+P 152195, A+P 174506, A+P 192930 und A+P 202680                           +
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

 - Libraries:
   - DRV_mbus:
      - A+P 152195: DRV_mbus verursacht Pagefault
      - A+P 174506: PageFault bei Open-Aufruf mit pDevice = 0
      - A+P 192930: MBSlave() Timeout nicht angezeigt		
    - AsTCP:
      - A+P 202680: Beschreibung bei TcpClose falsch

Version X8.07 vom 24.03.2009:
-----------------------------

 - Basissystem:
	- A+P 188300: InaClient (AsIMA) funktioniert nicht mehr, Verbindungsprobleme beim Routen, ... -> INA2000C

 - Systemmodule:
    - inaiqdrv.br
	  - A+P 158711: Update der gelinkten PVs funktioniert nur für die "erste" Verbindung

    - commserv.br:
	  - A+P 155141: Update der gelinkten PVs funktioniert nur für die "erste" Verbindung
	  - A+P 157891, 176976, 177006: NULL-Pointer Ueberpruefung fuer INAcreate()

 - LIBRARIES:
	- AsSem:
	  -A+P 193305: Neue Library AsSem
	- AsARCfg:
	  - A+P 195720: Beschreibung im Library Dialog fehlt / ist uneinheitlich
	- AsArcnet:
	  - A+P 195720: Beschreibung im Library Dialog fehlt / ist uneinheitlich
	- AsIMA:
	  - A+P 195720: Beschreibung im Library Dialog fehlt / ist uneinheitlich
  	- AsTpu:
	  - A+P 195720: Beschreibung im Library Dialog fehlt / ist uneinheitlich
    - canio:
      - A+P 196000, 189225: Swapping bei Long Variablen korrigiert
	- commserv:
	  siehe Systemmodul commserv.br
  	- DM_lib:
	  - A+P 195720: Beschreibung im Library Dialog fehlt / ist uneinheitlich
	- DRV_3964:
	  - A+P 171821: S39SClose liefert keinen Status zurück wenn der FUB gut geht
	- DRV_mn:
	  - A+P 174511: NULL-Pointer Ueberpruefung (device) bei MNSOpen() und MNMOpen()
	- InaClnt:
	  - A+P 188896: Pointer Eingabe-Parameter werden nicht auf NULL-Pointer überprüft (InaClnt)
  	- powerlnk:
	  - A+P 195720: Beschreibung im Library Dialog fehlt / ist uneinheitlich
	- sys_lib:
	  - A+P 193715: Fehler im Headerfile
	  - A+P 193745: Deklaration von ST_info stimmt nicht mit Hilfe überein
	  - A+P 200140: lt. Hilfe und AS3.0 Library Declaration gibt es keine Konstanten

Version X8.06 vom 17.11.2008:
-----------------------------
 - Basissystem:

- Systemmodule:
   - gcloader.br: A+P 184400: Null Pointerabfrage, wenn eine Task keinen Cyclic Code hat
   - DBTRACER: A+P 179231: Bei 10 Zeichen langen Modulnamen wird im Break der Stackpointer überschrieben

 - LIBRARIES:
   - AsTCP:
    - A+P 189761: TcpIoctl  "Non-blocking Mode" Erweiterung für SG4/SGC Targets

   - CAN_lib:
    - A+P 175511: Unimplememented Instruction durch Funktionspointer Aufruf (MCpy) in der Callback (gcc GOT Referenz)

   - AsArProf:
    - A+P 174621: LogIdleShow liefert 65535 im Init-Up

    - AsETH
      - A+P 182050: FBK inet_addr() aus EthSock Library sollte in die neuen Ethernet Libraries uebernommen werden

   - DRV_mbus:
    - A+P 131360, 180365: Define "_FORCE_68K_PACKED_" fuer packed.h hinzugefuegt

   - Convert:
    - A+P 126180: Convert Library beinhaltet keinen FUB zum Swappen von REAL-Werten

   - standard:
     - A+P 179245: REPLACE() liefert bei negativer Länge (error)+string
     - A+P 176395: Die Ausschaltverzögerung beim TOF ist um 10ms zu lange

   - ToolChain:
	- A+P 173745: Header Files werden falsch erstellt
    - INTERN: LIB_VERSION für das binary.lby (AR ungebundene Libs) wieder aktiviert

        - A+P 188810: Teilprojekt: Verwendung von neuen SG3 AR Versionen in aelteren AS Versionen (Config.xml)


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Version V2.49 vom 17.04.2008 entspricht Version X8.05 inkl. A+P 175511      +
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

 - Libraries:
   - CAN_Lib:
     - A+P 175511: Unimplememented Instruction durch Funktionspointer Aufruf (MCpy) in der Callback (gcc GOT Referenz)

Version X8.05 vom 10.04.2008:
-----------------------------

 - Basissystem:
   - Exceptionbehandlung: Allg_ER_write() ersetzt durch ER_write_string(); BR-Modulnamen am Target ermitteln und eintragen (EXER_RTS.C)

 - Systemmodule:
   - ina2000c:
    - A+P 155805: Erweiterung des INA-Routingpfades (Unterstueztung X20CS10x0)
    - A+P 171621: Fehler No L2 Buffer
   - DBTRACER: Behandlung bei Stepin und Stepout  von Funktionsaufrufen korrigiert
    - A+P 175741: AS3.071 Debugger Online Mode beenden löscht alle Breakpoints am Target
    - A+P 175970: Tracer Daten werden nicht angezeigt

 - Libraries:
   -DPMaster,FB_lib
     - Neuer Fub DPMPutMessage. Mit diesem Fub ist es möglich, selbst asynchrone Nachrichten an die Karte zu schreiben. Die Übergabe der Nachricht erfolgt über den
       Fub-Eingang "Message". Die Struktur dieser Message ist im File "FBDevLib.h" deklariert (MSG_STRUC). Der Fub ist solange aufzurufen bis der
       Status 0 zurückgegeben wurde. Er wartet nicht auf eine Antwort!
     - Neuer Fub DPMGetMessage. Mit diesem Fub ist es möglich, selbst Nachrichten von der Karte zu lesen. Die Nachricht wird über den Parameter "Message" an die
       Applikation übergeben. Die Struktur dieser Message ist im File "FBDevLib.h" deklariert (MSG_STRUC). Der Fub ist solange aufzurufen bis der
       Status 0 zurückgegeben wurde.
   - CAN_Lib:
     - A+P 133825: Page Fault bei CANexcep korrigiert
   - runtime:
     - INTERN: Fehlerkonstante ERR_NOTIMPLEMENTED hinzugefügt
   - sys_lib:
     - A+P 169850: Bit2Byte() wandelt ein Bit zuviel um
   - AsUDP:
     - A+P 171576: UdpOpen gibt bei Fehler den Ident nicht mehr frei
   - AsTCP:
     - A+P 171586: TcpOpen gibt nicht bei jedem Fehlerfall den Ident frei
   - DM_lib:
     - A+P 171751: Keine Kontrolle vom Parameter name beim FUB DMstore


Version X8.04 vom 05.11.2007:
-----------------------------

 - Basissystem:
   - A+P 156350, 141335: fehlerhafte Indexberechnung fuer die SpsTask-Tabelle
   - A+P 141145: AR - PPx5: Unterstützung für Flash > 2MB


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Version V2.48 vom 19.03.2007 entspricht Version X8.03 ausser Versionsnummer +
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Version X8.03 vom 12.03.2007:
-----------------------------

 - Basissystem:
   - A+P 153666: FOC_delete() / "unforce all" korrigiert
   - CPUs mit kleinem SYSROM (256kB) entfernt (siehe Information oben)
   - A+P 151090: Image wiederherstellen funktioniert nicht immer


Version X8.02 vom 29.01.2007:
-----------------------------

 - Basissystem:
   - A+P 151065: AROUTER Verbindungsunterbrechungen,
                 wenn mehrere Verbindungen über die selbe serielle Schnittstelle aktiv sind


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Version V2.47 vom 19.01.2007 entspricht Version X8.01 ausser Versionsnummer +
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Version X8.01 vom 11.01.2007:
-----------------------------

 - Basissystem:
   - A+P 150090: PPMAN Verbindungsproblem DPR-INA Kommunikation
   - Wieder eigenen Stack fuer alle InitUPs verwenden (sysman).
   - A+P 147555: Workaround fuer verlorenen TX-IR auf PP01x (PP15/35)
     implementiert, aber NICHT aktiviert. (Modul FBASE mit WA wird bei
     Bedarf nachgeliefert).
   - A+P 150490: Buserror nach Warmstart bei CP476 mit ME010.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Version V2.46 entspricht Version X8.00 ausser Versionsnummer +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Version X8.00 vom 28.11.2006:
-----------------------------

 - Basissystem:
   - Unterstuetzung ASYFUMA - Systrap + Insttrap.
   - A+P 148125: Dauerbooten durch MEMCARD

-------------------------------------------------------------------------
#########################################################################
#########################################################################
-------------------------------------------------------------------------
!!! I N F O R M A T I O N !!!!
-------------------------------------------------------------------------
Folgende CPUs werden ab der ß-Verison X8.00 aus Groessenproblemen im
SYSROM (256KB SYSROM) nicht mehr unterstuetzt:

 - CP430
 - CP470
 - CP770
 - ME910
 - ME913
 - IF100
 - IF101
 - AC701
 - QBAUE
 - ME960
 - ME963
 - ME965

Diese CPUs werden in einen MINIMALEN Wartungszustand uebergefuehrt.
Etwaige Fehlerkorrekturen werden von Fall zu Fall nach Absprache
mit dem Management durchgefuehrt.
Versionsbezeichnung fuer ß-Versionen : von X7.00 bis einschliesslich X7.99
Versionsbezeichnung fuer V-Versionen : von V2.41 bis einschliesslich V2.45
--------------------------------------------------------------------------
Fuer alle anderen CPUs (mit 512KB SYSROM) wird folgende Versionsstrategie
verfolgt:
Versionsbezeichnung fuer ß-Versionen : von X8.00 bis einschliesslich X9.99
Versionsbezeichnung fuer V-Versionen : von V2.46 bis einschliesslich V2.59
--------------------------------------------------------------------------
##########################################################################
##########################################################################
--------------------------------------------------------------------------

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Version V2.40 entspricht Version X6.50 ausser Versionsnummer +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Version X6.50 vom 20.03.2006:
-----------------------------

 - Basissystem:
   - A+P 131480: Keine Reaktion auf Tasten (CP200,...). Task-User-Register 3 des
     "Sysman" wurde faelschlicherweise zum Merken der Stack-Speicheradresse fuer
     TK-InitUps verwendet. Urspruenglich dient Task-User-Register 3 zum enablen/disablen
     der 2010 Keys. Stackspeicher wird nun in Task-User-Register 4 des "Sysman" gemerkt.
   - A+P 133375, 109510: Modemmanager muss Speicher fuer Treiber-Puffer im Falle
     der CP2x0 unbedingt aus MEMCL_TREIBER allocieren.
   - A+P 130925 (ALITRAP): Behandlung zerstoerter L7-Daten
   - A+P 130925: INA-Frame Laengenueberpruefung im AROUTER wieder eingefuehrt

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Version V2.39 entspricht Version X6.44 ausser Versionsnummer +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Version X6.44 vom 27.09.2005:
-----------------------------

 - Basissystem:
   - A+P 79735: dbtracer.br-1.61: Zeitstempelkorrektur für HS# Taskklassen im Trace


Version X6.43 vom 13.09.2005:
-----------------------------

 - Basissystem:
   - A+P 122810: Dbtracer-LineCoverage: Fehler bei Anzeige von mehr als 30 Zeilen korrigiert


Version X6.42 vom 12.07.2005:
-----------------------------

 - Basissystem:
   - A+P 121425: Probleme mit X6.41 (ungueltiger Commserv-Stand)


Version X6.41 vom 17.06.2005:
-----------------------------

 - PP01x:
   - Arouter mit Modemunterstuetzung hinzugefuegt

 - CP476:
   - A&P 120005: Online Kommunikation nur nach Kaltstart (ME050)

Version X6.40 vom 13.06.2005:
-----------------------------

 - LS251:
   - A+P 111005: Kommunikationsprobleme (PVI) ueber LS251 DPR korrigiert.
                 Fehlende Transmit-Timeoutbehandlung in "Fbase LS251-DPR" eingebaut.


##############################################################
# 12.05.2005: V2.38 entspricht X6.35 bis auf Versionsnummern #
##############################################################

Version X6.35 vom 03.05.2005:
-----------------------------

 - Basissystem:
   - A+P 116375: Empfangszähler für CANinfo FUB
   - A+P 116341: Lost-Zähler für CANinfo FUB

Version X6.34 vom 01.04.2005:
-----------------------------

 - Basissystem:
   - A+P 104355: CAN2000 Statistikdaten für CANinfo FUB


Version X6.33 vom 09.03.2005:
-----------------------------

 - Basissystem:
   - A+P 106620: Exception beim Loschen eines Datenobjekts im InitUp
                 Beim Install / Deinstall (Module, PVs) darf die Prioritaet des aufrufenden Tasks
                 nur im zyklischen Betrieb herabgesetzt werden. Mit der Abfrage von SG_bootphase auf 0
                 ist das nicht gewaehrleistet, da beim Exekutieren der InitUPs von zyklischen Task
                 (im Taskklassenkontext) die SG_bootphase bereits 0 ist
                 (-> Abfrage von SG_CycledStarted statt SG_Bootphase), siehe auch A+P 45345 und A+P 45335

Version X6.32 vom 23.02.2005:
-----------------------------

 - Basissystem:
   - A+P 108680: keine Laengenueberpruefung von INA-Frames (Vermeidung von
                 Problemen bei Verbindung ueber Modem)

Version X6.31 vom 07.12.2004:
-----------------------------

 - CP476:
   - A+P 106705: falsche Moduladresse bei 2003 (CP476), neuer IO2003 Manager von O. Wagner
                 (siehe auch A+P 43795 von SG3 Version X6.30)

Version X6.30 vom 22.11.2004:
-----------------------------

 - Basissystem:
   - A+P 43795:  2003-IO Exception Moduladresse wird im Dezimal Format am Exception Vektor für den FUB IO_info abgelegt
   - A+P 82180:  zykTS IRQ-Level nur um 1 verringern (von Level 6 auf Level 5), damit bei unterbrechbarer
                 SSTK (Prioritaet low, IRQ-Level 3) keine Mehrfachaktivierung des zykTS und somit
                 Fehler 6002 (totaler Zeitengpass im System) auftritt (bei Aktivierung des UART-IRQs auf Level 5).
   - A+P 100215: PP41-Boot-9199 ($fbcpu)
                 Timer IRQ Vector 48 darf im Boot nicht auf den Default Exceptionhandler gesetzt werden

##############################################################
# 09.09.2004: V2.37 entspricht X6.21 bis auf Versionsnummern #
##############################################################

Version X6.21 vom 30.08.2004:
-----------------------------

 - Basissystem:
   - A+P 98015: Unterstuetzung 3IF681.86 (SMC) (ser. IF)

 - DBTRACER:
   - A+P 79221: Beim Setzen eines temporären Breaks nach einer Trap Instruction wird die Speicherklasse nun
                überprüft (! ROM/FLASH)
   - A+P 24860/24870: Dbtracer-Korrektur der Triggerbedingung für den Trace
   - A+P 24885: Korrektur der Triggerbedingung für den Trace

Version X6.20 vom 09.07.2004:
-----------------------------

 - Basissystem:

   - A+P 95780: Powerfail bewirkt KS durch Fehler 7035 "Memcard neu gesteckt"


##############################################################
# 21.06.2004: V2.36 entspricht X6.15 bis auf Versionsnummern #
##############################################################

Version X6.15 vom 08.06.2004:
-----------------------------
 - Basissystem:

   - A+P 95470: Automation Runtime X6.14: 3601/3039 nach Kaltstart mit 4EX101.01
                (Aenderung in sysload.68k)

   - CP430, CP470, CP770, IF100, IF101:
     - SYSMAN-Korrektur von Version X6.14 (7KB tmp. Stackbereich wird nur mehr einmal allokiert)
       fuer oben aufgelistete CPUs wieder entfernt (wegen Codegroesse)!!

Version X6.14 vom 27.05.2004:
-----------------------------
 - Basissystem:

   - HWTRAP: Bitmap Speicherverwaltung - im Hochlauf wird immer von vorne nach einem freien Bereich gesucht.
   - SYSMAN: 7kB tmp. Stackbereich wird nur mehr einmal allokiert.

   - A+P 92706: neuen IO2003 Manager (PP01x) uebernehmen (Sourceadaption)
   - A+P 92775: Bootprobleme der XP152.60-2:
                Configuration Register CS7 (0xFFFFFFDC) + DRAM Configuration Register
                (0xFFFFFFE0 und 0xFFFFFFE4) mit 0 initialisieren.

Version X6.13 vom 08.04.2004:
-----------------------------
 - Basissystem:
   A+P 79141:
   A+P 82215: PP15-Eigener CAN2000 mit Interruptlevel=6, da sonst der CAN-Interrupt unterbrochen wird
   A+P 90675: EX101 wird beim HW Upload nicht erkannt
   A+P 91890: franzoesische Texte in "sysconf.ini" hinzugefuegt

Version X6.12 vom 10.03.2004:
-----------------------------
 - Basissystem:

   A+P 89155: STARTUP
              Aufgrund fehlender Ueberpruefungen der Sysconf-Einstellungen benoetigen die Systemverwaltungstabellen
              bzw. die Base-Pointer mehr Speicher wie im SYS_RAM zur Verfuegung steht. Wird jetzt durch
              den Fehlereintrag 6440 und Booten im Diagnose-Mode abgefangen.

Version X6.11 vom 20.02.2004:
-----------------------------
 - Version X6.11 fuer EX101 SETUP


Version X6.10 vom 30.01.2004:
-----------------------------
 - Basissystem:
   A+P 86571: GCLOADER.BR-Unterstützung des GOT-Eintrags Typ 0x87 "Import Library" bei zykl. Tasks
              Wird erst ab AS 3.0 unterstützt

 - C220:
   A+P 81460: Im BOOT wird anstatt des DefaultExceptionHandler ein DummyExceptionHandler eingehaengt.
              Notwendig fuer alle 68302-CPU's, C220 hinzugefuegt.

##############################################################
# 19.12.2003: V2.35 entspricht X6.00 bis auf Versionsnummern #
##############################################################

Version X6.00 vom 02.12.2003:
-----------------------------
 - Basissystem:

   - A+P 83535: SYS_SERV
     Loeschen von B&R-Modulen fuer CP260, IF260 und CP476 korrigiert, Fehler seit X5.92


##############################################################
# 12.11.2003: V2.34 entspricht X5.93 bis auf Versionsnummern #
##############################################################

Version X5.93 vom 12.11.2003:
-----------------------------
 - Basissystem:
   - A+P 76240: INACAN wird erst aktiv, wenn das Cyclic System gestartet ist (!SG_CyclicStarted)

Version X5.92 vom 28.10.2003:
-----------------------------
 - Basissystem:
   - DBTRACER, PROFILER, COMMSERV: INA Security Level Erweiterung

 - CP260, IF260 und CP476
   - APPLADER, COMMSERV, SYSERV, VARZUG: INA Security Level Erweiterung

Version X5.91 vom 03.09.2003:
-----------------------------
 - Basissystem:
     - LS251: Virtuelle SSTK unterbrechbar, falls im Studio so eingestellt.
              Analog wie bei A&P 76595 und A&P 51425.

     - A&P 71025, 77445: Pagefault beim Download und Löschen von Tasks, wenn PVs mit einem Namen
                         laenger 32 Zeichen gelinkt sind. --> UpdateLinkedPVs()

Version X5.90 vom 21.07.2003:
-----------------------------
 - Basissystem:
    - A&P 76595: Virtuelle SSTK (PL) bei CP260 war nicht unterbrechbar
                 CPU_cfg_adapt in htl_cpu.c geaendert


##############################################################
# 30.06.2003: V2.33 entspricht X5.84 bis auf Versionsnummern #
##############################################################

Version X5.84 vom 30.06.2003:
-----------------------------
 - Basissystem:
   - A&P 15436: HW-Trap: TIM_Musec lieferte -1 fuer LS251
   - A&P 73560: HW-Konfiguration: HWCFG-Tabelle wurde ueberschrieben


Version X5.83 vom 20.05.2003:
-----------------------------
 - Basissystem:
   - BOOT: Codeoptimierung im Boot-Modul, damit fuer 2003-CPUs Konfiguration wieder ins
           SYSROM geladen werden kann (min. 752 Byte freier SYSROM-Speicher erforderlich).

Version X5.82 vom 14.05.2003:
-----------------------------

 - A+P 15591 (IO-2003 Manager):
   Eigener IO2003-Manager fuer PP01x CPUs (PP15) -> "iopp01x.br", damit PP01x spezifische Aenderungen
   und Erweiterungen keine Auswirkungen fuer die restlichen IO2003 Module haben ("io2003ma.br").

Version X5.81 vom 06.05.2003:
-----------------------------
 - Basissystem:
   - A&P 13941: Maximalwert beim Parameter "Timer"
   - A&P 70520: BOOT: (NMIExceptionhandler)
     zusaetzliche Abfrage der SG_bootphase (0xFF) um richtigen Hochlaufgrund (WARMSTART)
     einzutragen. Notwendig aufgrund der Korrektur in X5.40.

Version X5.80 vom 21.03.2003:
-----------------------------

 - PP01x:
   - Unterstuetzung von 2 HEX-Knotenschaltern
   - TIMER IRQ-LEVEL (zykTS) von 6 auf 3 verringern -> unter SSTK (IRQ-Level 6) und unter CAN (IRQ-Level 4)
   - IO2003 Manager: QSPI Control Register 0 (SPCR0 Register):
     Serial Clock Baud Rate von 1.33Mhz auf 4Mhz geaendert (0x8202)
   - CAN Controller Port 2 auf 0xFD015E (Input/Output Configuration Bits):
     Port 0-7 als Input setzen
   - FBASE UART:
     FIFO Groesse fuer DISPLAY-UART von 16Byte auf 128Byte erhoeht
     IRQ-Handler fuer UART (FBS_IRhandler) -> bei IRQ-Verriegelung wieder alten IRQ-Level setzen

 - IO_PP00:
   - Neuer IOManager (Io2003ma.br):
     Rueckbau des Auslesen des Display Befehlsfifo auf konsistente Bildung des Leseoffsets
     Einbindung neuer Kontrollertypen, speichern der Kontrastwerte und Optimierungen durch P. Kronberger


##############################################################
# 31.01.2003: V2.32 entspricht X5.76 bis auf Versionsnummern #
##############################################################

Version X5.76 vom 31.01.2003:
-----------------------------
 - Basissystem:
   - Developer Version fuer V2.32

Version X5.75 vom 20.01.2003:
-----------------------------

   - SYSMAN: SM-Action.c - Die SystemVWTabelle wird nicht mehr zyklisch kontrolliert, da die
             Kontrolle fehlerhaft ist. (siehe A&P 64010).
	     Anstelle der SystemVW Tabelle werden die Systemstrukturen kontrolliert.

   - IO_PP00:
     - Neuer IOManager (Io2003ma.br): Erhoehen des Stackspeichers des IO-Managers auf 2KB


Version X5.74 vom 17.12.2002:
-----------------------------
 - Basissystem:
   - CAN2000: Transmit Queue Update nach dem Löschen von COB's (A&P 50320)

Version X5.73 vom 03.12.2002:
-----------------------------
 - Basissystem:
   - IO_PP00:
     - Neuer IOManager (Io2003ma.br):
       Wenn eine horizontale Linie bis zum Ende des Bildschirms gezeichnet
       werden soll, fehlen die letzten 4 Pixel!

Version X5.72 vom 06.11.2002:
-----------------------------
 - Basissystem:
   - INSTTRAP: Beschraenkung von max. 64 Systemtasks beim Ausfuehren der InitUPs aufgehoben (A&P 59690)

   - IO_PP00:
     - Neuer IOManager (Io2003ma.br):
       Aenderung fuer AVL mit Tastenstruktur ohne Entprellung (struct s_tastatur Element taste_raw)

 - PP01x:
   - Unterstuetzung der PP01x CPU (PP015)

Version X5.71 vom 15.10.2002:
-----------------------------
 - Basissystem:
   - CAN2000: BusOff Behandlung korrigiert (Alignmentfehler zwischen C und ASM Sourcen) A&P 58070,
   - A&P 58365: Modem Konfiguration fehlendes Carriage Return

   - IO_PP00:
     - Neuer IOManager (Io2003ma.br):
       Wenn eine Zeile laenger als der Bildschirm ist, dann wird sie zwar korrekt abgeschnitten,
       allerdings ist das erste Zeichen in der naechsten Zeile dadurch beeintraechtigt.

Version X5.70 vom 27.09.2002:
-----------------------------
 - Basissystem:
   - A&P 58030: durchgaengige Unterstuetzung von Elementnamen mit 32 Zeichen + NULL-Terminierung
   - A&P 50430: geaenderte Statusmeldung bei PVx_token()
   - FBASE: neuer Typ (6) - Arcnet

##############################################################
# 19.09.2002: V2.31 entspricht X5.61 bis auf Versionsnummern #
##############################################################

Version X5.61 vom 19.09.2002:
-----------------------------
 - Basissystem:
   - HWTRAP:   RTC_settime() Erweiterung zur Unterdrueckung des Logbuch-Eintrages

Version X5.60 vom 21.08.2002:
-----------------------------
 - Basissystem:
   - AROUTER:
     A&P 57635: keine INA Kommunikation ohne IF6xx in IF260
   - APPLADER: Setze den Z_MO_upload State wieder auf Z_MO_ready vor dem letzen UL_term_resp (RIETER)

##############################################################
# 08.08.2002: V2.30 entspricht X5.53 bis auf Versionsnummern #
##############################################################

Version X5.53 vom 06.08.2002:
-----------------------------
 - Basissystem:
   - INSTTRAP:
     SY_install (Install von Systemtask) - System Globale in die MEMCL_USER,
     wenn das bit4=1 im MT_RT_mode (Fehler 13176)
   - APPLADER: MT_RT_mode bit4=1 (Fehler 13176)

Version X5.52 vom 16.07.2002:
-----------------------------
 - Basissystem:
   - STARTUP, PSOS:
     In der Funktion "RegionExtInit" wird im Fehlerfall (Datenlänge=0)
     der Diagnose Mode eingeleitet (Fehler NegriBossi-VC/Hochlaufloop)

   - COMMSERV, INACLIENT, INAIQDRV:
     Unterstützung von Event-PVs für InaClient hinzugefügt

   - APPLADER:
     - Wird während dem Upload der Upload-Modul gelöscht, so wird ein PVI-Fehler gemeldet und nicht mit dem
       Fatal Fehler 3000 gestoppt
     - Stack von 2048 auf 2560 erhöht
     - 3802 Problem Applader V2.29:
       Ein mehrfaches SM_free von gleichen Speicherblöcken in der MEMCL_OS hat
       scheinbar den Fehler 3802 ausgelöst. Die Download Abbruch Behandlung von B&R Modulen wird jetzt im
       InitUp in der INIT-Phase1 des Applader inklusive einer Plausibilitaetskontrolle für die SM_free
       Freigabe durchgeführt. Bei meinem E-Test konnte kein 3802 Fehler mehr festgestellt werden.
       Ein ausführlicher Integrationstest muß aber noch durchgeführt werden.
     - Applader globale Struktur  (116 Byte) wird von der MEMCL_OS in die MEMCL_USER gelegt,
       damit ein DL Abbruch im Init kontrolliert werden kann.

   - INAIQDRV, LOCIQDRV:
     A&P 13046: Absturz bei Verwendung von inaMEMPV und inaWRITE

   - INAIQDRV:
     A&P 13126: Pagefault bei INAaction

   - IO_PP00:
     - Neuer IOManager (Io2003ma.br): Fehlerkorrekturen fuer Rieter

Version X5.51 vom 05.06.2002:
-----------------------------
 - Basissystem:
   - AROUTER:
     A&P 10641 INA Buffer Management Error

   - BROPSYS Idle Stack von 768 auf 1024 erhöht (PP41-Rieter)

Version X5.50 vom 04.04.2002:
-----------------------------
 - Basissystem:
   - MODEMMANAGER:
     CP210 wird nun auch vom MM unterstützt - Speicherallokierung MEMCL_TREIBER für alle M68K Targets.
     Fuer CP210 wieder Modemunterstuetzung (Arouterm.br)

   - COMMSERV, INAIQDRV, LOCIQDRV:
     - A&P 44560: durchgängige Unterstützung des Datentyp TIME
     - A&P 10551: Formatrichtige Übertragung zwischen unterschiedlichen Targettypen von Strukturen und Strukturarrays
                  durch Struktur-Kopier-Tabellen.
     - Objekt-Verwaltung von ca.1000 auf 8000 Objekte erhöht (Linken von PVs über InaClient-Library)

   - INACLNT:
     - A&P 45320: geänderte Identüberprüfung

##############################################################
# 15.03.2002: V2.29 entspricht X5.44 bis auf Versionsnummern #
##############################################################

Version X5.44 vom 15.03.2002:
-----------------------------
   - CP430, CP470, CP770:
     APPLADER Fehlerkorrektur A&P 51835 (siehe RPSSW X5.43) wurde wegen mangelndem SYSROM Speicher
     wieder rueckgaengig gemacht !!!
     Fuer diese CPUs wird ein eigener Applader generiert (applacp4.br)

   - FBTYP2:
     Aufgrund der Anforderung, dass bei CPUs mit Speicherplatzproblemen im SYSROM (CP430, CP470, CP770)
     trotzdem das Nachladen eines Sysconf-Moduls ins SYSROM funktionieren muss, wird der FBTYP2 mit der
     Microtec Option -Os -g (Groessenoptimierung) uebersetzt (bisher wurde mit -O -g uebersetzt), damit
     im SYSROM genuegend freier Speicher fuer das Nachladen eines Sysconf-Moduls vorhanden ist.
     !!! WELCHE AUSWIRKUNGEN DIESE COMPILE-AENDERUNG VERURSACHEN KANN IST NICHT BEKANNT !!!

   - CP210:
     Die Modemunterstuetzung (arouterm.br) auf der CP210 wurde wieder gestrichen,
     da es Probleme bei der Schnittstelleninitialisierung gibt.

Version X5.43 vom 04.03.2002:
-----------------------------
   - Basissystem:
        - SYSMAN: Aussprung fuer "TcHook-Library" implementiert.
        - A&P 52045, 52050: Anzahl der HS-TKs fuer PP41 und CP476 im Rule File auf 2 erhoeht.
        - APPLADER: A&P 51835: Ein allokierter Speicher für Downloadmodule welcher im Falle
                               eines Powerfail liegen bleibt, wird im nächsten Hochlauf wieder frei
                               gegeben (Zusätzlicher Code 424 Byte !)
   - IF260:
        - A&P 51425: RIO SSTK war bei IF260 nicht unterbrechbar,auch wenn sie als unterbrechbar
                     konfiguriert war

    - PP41:
        - Neuer IOManager (Io2003ma.br):
          - Aenderung in der Displayerkennung, d.h. es wird ein neuer Displaycontroller erkannt
            (den sogenannten B&R-Controller).
          - Ruecklesbarkeit des eingestellten Kontrastwertes aus einem E²-Prom.

    - MODEMUNTERSTUETZUNG:
      Von folgenden CPUs wird die Modemkommunikation (Arouter + Default Sysconf Module) unterstuetzt:
       - CP100 (nur mit ME915!!!)
       - CP104 (nur mit ME915!!!)
       - CP152 (mit ME96x)
       - CP153 (mit ME96x)
       - CP200 (ab RPSSW V2.24 nur mehr mit ME915!!!)
       - CP210 (ab RPSSW V2.24 nur mehr mit ME915!!!)
       - CP260
       - CP474
       - CP476
       - CP774
       - IF152
       - IF260 (nur mit "ONLINE" Schnittstelle auf IF6xx im SubSlot 1, erste Schnittstelle)
       - IP151
       - IP152
       - IP161
       - IP350
       - ME915
       - ME960
       - ME963
       - ME965
       - PP00
       - PP21
       - PP41
       - XP152 (nur "grosse" XP152[XP152.2])

      Von folgenden CPUs wird die Modemkommunikation per Default NICHT unterstuetzt:
       - AC701
       - C200
       - CP430 (zu wenig SYSROM Speicher!)
       - CP470 (zu wenig SYSROM Speicher!)
       - CP770 (zu wenig SYSROM Speicher!)
       - IF100 (zu wenig SYSROM Speicher!)
       - IF101 (zu wenig SYSROM Speicher!)
       - LS251
       - ME910 (zu wenig SYSROM Speicher!)
       - ME913 (zu wenig SYSROM Speicher!)
       - MP100
       - QBAUE

Version X5.42 vom 25.02.2002:
-----------------------------
   - Basissystem:
     - ASPROFILER: Korrekturen Task Zustaende Loggen.
     - A&P 7723: Powerlink HS-TK2 fuer 2003 CPUs ermoeglicht indem die Begrenzung in htl_cpu.c
                 adaptiert wurde.

     - sysconf.ini:
       IFs fuer IF100 und IF101 (2010) hinzugefuegt

Version X5.41 vom 20.02.2002:
-----------------------------
    - Basissystem:
        - ASPROFILER: Neue Version 2 -> Task Zustaende loggen,
                      Genauigkeit in TicksPerMsec messen anstatt Ticks PerUsec.

        - AROUTER: Fehlerkorrektur 50780, 50380: AR_PushInfo Verriegelung erweitert.

        - AROUTER: AROUTER mit Modemunterstuetzung. Es werden 2 Arouter BR-Module generiert:
                - arouter.br  (Modul wie bisher)
                - arouterm.br (Arouter mit Modemerkennung im Hochlauf)
        - INA2000s: A&P 48660: INAClient-Verbindung über CAN kommt nach Verbindungsabbruch nicht mehr
               zustande. EOF-Kennung immer wieder in Frames eintragen, da FBCAN nach Timeout EOF
               mit 0 überschreibt.
    - PP41:
        - FBEX101:
            - A+P 49395: Interruptmerker auf 0xf02002 haelt nicht das, was die HW-Doku verspricht!
              Die SW kann auch ohne diesen Interruptmerker leben !

    - CP476, CP260:
        - Fuer diese beiden CPUs wird der neue Arouter mit Modemerkennung verwendet.
        !!! DEFAULT-SYSCONF Module mit Modemunterstuetzung !!!

Version X5.40 vom 24.01.2002:
-----------------------------
    - Basissystem:
      - BOOT:   NMIExceptionhandler:
                SG_bootphase wird im Powerfail NMI Handler auf den Wert 0xFF gesetzt,
                damit im Hochlauf frühe Exceptions richtig behandelt werden können (C221 Problem)
      - EXERMO:	SG_bootphase wird im Allgemeinen Handler auf den Wert 0 geprüft, damit im Hochlauf
                frühe Exceptions richtig behandelt werden können (C221 Problem)


##################################################################
# 12.12.2001: V2.28 entspricht X5.37 bis auf Versionsnummern     #
##################################################################

Version X5.37 vom 11.12.2001:
-----------------------------
    - Basissystem
		- ALITRAP: Schreib-Zugriff auf $3c8,$3ca für Lauzeitmessung wegen CP260 Flashbaustein entfernt


Version X5.36 vom 06.12.2001:
-----------------------------
    - Basissystem
        - SYSTRAP: Schreiben für Laufzeitmessung auf die Adresse $3c4 und $3c6 entfernt - Problem CP260 neue Flashbausteine
        - HWTRAP:  Schreiben für Laufzeitmessung auf die Adresse $3c0 und $3c2 entfernt - Problem CP260 neue Flashbausteine


Version X5.35 vom 20.11.2001:
-----------------------------
    - Basissystem CP200/CP210/CP260
        - Applader: DRAM Speicher freigeben, wenn während des Download eine Verbindungsunterbrechung auftritt

Version X5.34 vom 07.11.2001:
-----------------------------
    - Basissystem
        - Can2000: RTR Frames mit variabler Datenlaenge - CAN_LIB V2.02

Version X5.33 vom 29.10.2001:
-----------------------------
    - Basissystem
        - Arouter: Designfehler korrigiert (Transmit-Queue pro Device statt 1er Transmit-Queue).
        - Arouter A&P 44635: Fehler bei schnellem Wechsel einer phys. Verbingung (Kabel umstecken,
                        RS232-Umschaltbox,...) korrigiert.

Version X5.32 vom 19.10.2001:
-----------------------------
    - Basissystem
        - A&P 47030:    Warnung 4242 entfernt (uebriggebliebene Debugausgabe)
        - A&P 47010:    Analoge IOs bei CP476 funktionierten nicht mehr falls SSTK vorhanden.
                        Das Loeschen des IO2003_IOCYC_RDY Bits in sstaskkl.src wurde wieder
                        rueckgaengig gemacht, damit auch der CP476 IOManager wieder korrekt
                        funktioniert. (wurde wegen A&P 44240 eingefuehrt, ist aber eigentlich
                        nicht notwendig)

        - HWTRAP:       Bei CP200 und CP210 wurde fuer die Funktion DIS_string() ein Wartezyklus
                        eingefuehrt, damit alle Zeichen auf das Display geschrieben werden (dis_hd44.src).

Version X5.31 vom 03.10.2001:
-----------------------------
	- Basissystem
		- FBase PP: Kommunikation nicht mehr ueber IRQs, falls CPU dies verlangt (CP360)

Version X5.30 vom 12.09.2001:
-----------------------------
	- Basissystem
        - A&P 45335, A&P 45345 : Beim Modulinstall wird die Prioritaet des aufrufenden Tasks nur
                                 beim zyklischen Betrieb herabgesetzt, nicht im Hochlauf!
                                 Abfrage von "SG_CyclicStarted" anstatt
                                 von "SG_Bootphase" ! (Funktion "MO_install()")

#############################################################################
# 22.08.2001: V2.27 entspricht X5.25 bis auf Versionsnummern und den unten  #
#             beschriebenen Fehlerkorrekturen bzgl. IOManager               #
#############################################################################

Version V2.27 vom 22.08.2001:
-----------------------------
	- Basissystem
        - IOManager CP476: Fehler bei der Variablenadressierung bei Ueberschreiten der 64 k Grenze.
                           Verbesserte Verriegelung von Mehrfachaufrufen von IO_Cycle.
                           Setzen der Analogausgänge nach Warmstart auf den letztgültigen Wert
                           bis zum Initup.
                           Vermeiden des Busyfehlers der H8 Module nach Reset durch Wartezeit vor
                           dem Scannen der IO-Belegung.

        - IOManager PP:    Fehler bei der Variablenadressierung bei Ueberschreiten der 64 k Grenze.
                           Verbesserte Verriegelung von Mehrfachaufrufen von IO_Cycle.
                           Setzen der Analogausgänge nach Warmstart auf den letztgültigen Wert
                           bis zum Initup.


######################################################################################
# 17.08.2001: V2.27 entspricht X5.25 bis auf Versionsnummern (!!!Version gesperrt!!!)#
######################################################################################

Version X5.25 vom 17.08.2001:
-----------------------------
	- Basissystem
        - A&P 45390 : CPx74DBL verhaelt sich jetzt nicht mehr wie ein Sondermodulmanager (io2003.c)
        - Kommunikationsproblem bei 2010 CPUs behoben (ALI)


######################################################################################
# 07.08.2001: V2.27 entspricht X5.24 bis auf Versionsnummern (!Version gesperrt!)    #
######################################################################################

Version X5.24 vom 06.08.2001:
-----------------------------
	- Basissystem
                - A&P 43845 : Falls ein bestimmter Datenbereich an einer 64K Grenze liegt, kam es
                              zu einem "wilden" Pointer.
                              Neuer IO2003 Manager fuer CP476.
		- CAN2000:    1. Änderung beim Umkonfigurieren des Receive Buffer 15 im 82527 (Wartezeit für 82527)
			      2. Für das Senden von hochprioren CAN Objekten (eigener Buffer im 82527) wurde eine
			         Abfrage in der letzten Fehlerkorrektur übersehen (V2.26). Dadurch konnte es zum Fehler
				 8876 im Senden kommen.


Version X5.23 vom 27.05.2001:
-----------------------------
 !!! spezielle Version fuer Battenfeld (eigener CAN2000) auf Stand X5.22 !!!


Version X5.22 vom 25.07.2001:
-----------------------------
	- Basissystem
		- A&P 44575 : CANIO Inputs funktionierten seit Behebung von A&P 26905 (X5.05) nicht
                              mehr in SSTK.
        - A&P 44240 : Fehler durch doppelte Beauftragung von IO2003_cycle (io1003.c, sstaskkl.src)

        - INA2000: Speicher fuer L2 wird nur mehr aus MEMCL_OS allokiert.

Version X5.21 vom 25.07.2001:
-----------------------------
 !!! spezielle Version fuer Battenfeld (eigener CAN2000) !!!

Version X5.20 vom 15.05.2001:
-----------------------------
	- Basissystem
		- A&P 10136 : Unterstuetzung von unterschiedlichen Virtuellen Timern fuer SSTK#2 in HW-Trap
		  (RIOSSTK=PPSSTK=6, PowerLink-SSTK=7)
		- A&P 10141 : Ignorieren von CompactFlash MemCards -> Unterstuetzung durch ein AddOn-Modul
		  moeglich


##################################################################
# 24.04.2001: V2.26 entspricht X5.10 bis auf Versionsnummern     #
##################################################################

Version X5.10 vom 27.04.2001:
-----------------------------
	- LS251
		- rio_lib V5.11 (V-Version)

Version X5.09 vom 25.04.2001:
-----------------------------
	- PP21, PP41
		- A&P 42635 : Fehlercode 8827 bei Warmstart, wenn beide CAN-Controller verwendet werden

Version X5.08 vom 19.04.2001:
-----------------------------
	- Basissystem
		- A&P 42200 : Default-SYSCONF mit 2 parallelen Verbindungen
	- CP200, CP210
		- A&P 43175 : Zyklisches Booten nach Zerstoeren der Systemstrukturen
	- CP260
		- A&P 40740 : Fehlercode 7035 (MemCard gewechselt) statt 7110 (AWS gewechselt)
		- A&P 10036 : SSTK-Chitter / Systembus-Interrupt-Verzoegerung waechst bei mehr BasisIO-Kanaelen
	- PP21, PP41
		- A&P 40740 : Fehlercode 7035 (MemCard gewechselt) statt 7110 (AWS gewechselt)
	- CP476
		- A&P 40740 : Fehlercode 7035 (MemCard gewechselt) statt 7110 (AWS gewechselt)
		- IO2003-Manager V1.11 von Otto Wagner
			- Behebung des Adresserrors bei Hochlauffehlermeldung H8
			- Umgehung des Prozessorfehlers auf AT324 durch Reset des ANP-Moduls, wenn Modul nach
			  1.5 Sec nicht reagiert hat (mehrmals bis zu 10 Sekunden lang)
	- LS251
		- A&P 10036 : SSTK-Chitter waechst bei mehr Taskklassen
	- XP152
		- A&P 10036 : SSTK-Chitter waechst bei mehr BasisIO-Kanaelen

Version X5.07 vom 13.04.2001:
-----------------------------
	- Basissystem
		- A&P 20855 : Task wird nach Exception beim Download auch aus ROM geloescht
		- A&P 37300 : Kontrolle auf ZykTS Mehrfachaktivierung inkl. Systemzyklustoleranz
	- PP21, PP41
		- Fehlerkorrektur Kontrastverstellung (O.Wagner)
		- Ausgabe eines Inittextes (O.Wagner)

Version X5.06 vom 09.04.2001:
-----------------------------
	- Basissystem
		- A&P 20855 : Task blieb nach Exception beim Download im State IDL oder UNR haengen
		- A&P 19830 : Exception fuer EXC-Task bei der EXCTK-InitUP-Behandlung fuehrt zu 9199

Version X5.05 vom 06.04.2001:
-----------------------------
	- Basissystem
		- CAN2000 :	A&P:39660 : Fehlerkorrektur von CANwrite (status bleibt auf 1)
					A&P 8756 : CANqueue Reihenfolge Problem
		- A&P 26905 : Forcen der SSTK-Inputs unmittelbar nach IO-Behandlung am Ende der SSTK
		- A&P 26075 : Fehler 3000 nach Exception beim Overload
		- intern : GetHwCfg akzeptiert jetzt EXERMO ab V1.40 und auch Betaversionen V00.00
	- 2005-CPU mit EX350
		- A&P 9981 : Fehler 3700 nach Exception mit EX350 beim Overload
	- CP260, LS251
		- A&P 35710 : Kopie von B&R-Modulen muss immer im DRAM liegen, kein Mapping ins USERRAM
		- A&P 35445 : Buserror nach Warmstart, weil B&R-Modulkopie nicht im DRAM war
	- CP200, CP210
		- COMMSERV im Basissystem enthalten
		- A&P 35710 : Kopie von B&R-Modulen muss immer im DRAM liegen, kein Mapping ins USERRAM
		- A&P 35445 : Buserror nach Warmstart, weil B&R-Modulkopie nicht im DRAM war
	- LS251
		- A&P 35065 : LS079 CAN-Node (IF4) = LS251-CAN-Node (IF2) + 1

Version X5.04 vom 30.03.2001:
-----------------------------
	- Basissystem
		- A&P 36130 : Anzahl der AVT-Eintrage im Default-Konfigurationsmodul erhoeht
			- CPU mit 256 kB SRAM : 200 AVT-Eintraege --> 768 Bytes weniger USERRAM frei
			  (CP430, CPx70, CPx74, XP152, IF100, IF101, AC701, BauerTableau, C221)
			- CPU mit mind. 512 kB SRAM bzw mit AWS: 500 AVT-Eintraege -> 5568 Bytes weniger USERRAM frei
			  (CP476, PPxx, CP260, IF260, IP161, IP151, IF152, IP152, IP350, LS251, CP200, CP210,
			   CP10x / ME91x, CP15x / ME96x)
		- A&P 37300 : Kontrolle auf Mehrfachaktivierung des Zyklischen Taskschedulers --> Fehlercode 6002
	- CPUs 2005/2010
		- A&P 15918: RemoteIO Slave-Timeoutzeit bei HW-Konfigurationskennung nicht mehr additiv,
		  sondern bezogen auf den Hochlaufstart warten
	- CP430, CP470, CP770
		- A&P 26535 : Fehler 5573 "IO Konfigurationsaenderung", wenn zuerst kein IO-Modul, beim
		  Warmstart aber mindestens 1 IO-Modul gesteckt ist

Version X5.03 vom 26.03.2001:
-----------------------------
	- Basissystem
		- Checksummen fuer Module mit "MSPEC2_NO_CS_CHECK" nicht kontrollieren (Boot)
	- CP200, CP210
		- A&P 39105: SSTK#2 laeuft auch nach Aenderung der SS-Zykluszeiten
	- CP100, CP104
		- A&P 39105: SSTK#2 laeuft auch nach Aenderung der SS-Zykluszeiten

Version X5.02 vom 21.03.2001:
-----------------------------
	- Basissystem
		- A&P 41935: IO-Daten nicht behandelt bei "sehr viel IO" mit EX350 (CP260, IF260, IP161, IP151)
		  bzw. bei "sehr viel IO" ohne EX350 (CP260, IF260, IP161), sowohl mit als auch ohne
		  optimierte IO-Behandlung
		- A&P 9811 : Kaltstart, wenn EX350 gewechselt wurde
		- A&P 9806 : Powerfail-Behandlung : Wartezeit mit Aufziehen des Watchdog, 
          Vereinheitlichung LS251
		  ACHTUNG: Damit wird auch auf der "alten LS251" ohne Netzteil mit Powerfail-Logik
		  nach 300 msec der Watchdog nicht mehr aufgezogen --> falls in dieser Zeit die
		  Spannung am PC noch nicht eingebrochen ist, bootet die LS251 mit WARMSTART !
		- A&P 9821 : Vereinheitlichung der Warmstartbehandlung von DRAM-CPUs und Nicht-DRAM-CPUs
		- A&P 9831 : Hochlauf nach Powerfail im Logbuch eintragen
		- Default-SYSCONF-Module mit Systemversion V2.26 (bisher V2.30)
	- CP430, CPx70, CPx74
		- A&P 40900 : ANP inaktiv / nicht vorhanden beim Speichern im Flash

Version X5.01 vom 09.03.2001:
-----------------------------
	- Basissystem
		- Default-SYSCONF-Module immer mit akt. Datum und akt. Version (V0.00.0 bei Beta) stempeln
		- A&P 9726 : Fehlercode 14, wenn sich mehrere NonCyclic-Tasks selbst loeschen
		- A&P 41735 : ST_tmp_suspend(ITSELF) funktionierte nach DA_create nicht mehr wegen der
		  Korrektur von A&P 40845 (X5.00)
	- CP476
		- A&P 9826 : ME050 neu (MemCard + IF6xx + Hilscher-Modul) : HW-Erkennung, IF6xx CAN + Seriell
		- A&P 34075 : Knotennummer der IF671 = Knotennummer der CPU + 1
	- CP260
		- A&P 40740 : Fehler 7110 "AWS wurde gewechselt" nach Powerfail-Warmstart mit Tausch der MemCard,
		  nicht mehr Fehler 3010 + Diagnose
	- CP200, CP210
		- A&P 40740 : Fehler 7110 "AWS wurde gewechselt" nach Powerfail-Warmstart mit Tausch des AWS,
		  nicht mehr Fehler 3010 + Diagnose
	- PP21,PP41
		- A&P 34075 : Knotennummer der IF671 = Knotennummer der CPU + 1

Version X5.00 vom 21.02.2001:
-----------------------------
	- Basissystem
		- A&P 40845 : Fehlende Verriegelung bei InitUP-Behandlung von Cyclic-Tasks ueber mehrere
		  Taskklassen --> Exception moeglich, falls InitUP den pSOS-Task blockiert
		- SYSMAN-Modul immer mit akt. Datum und akt. Version (V0.00.0 bei Beta) stempeln
		- intern: pSOS-Modul wird ueber Autobuild erzeugt (binaergleich)
	- CP476
		- A&P 40255 : Globale SYS2003 Struktur liefert falsche Werte (IO-Manager V1.10 von O.Wagner)
	- CP474,CP774
		- A&P 9816 : CPx74DBL statt bisherigem IO2003-Manager im Basissystem enthalten
	- Libraries
		- Rtk68k nicht mehr bei RPSSW-Uebergabe enthalten --> getrennte Uebergabe (Library)
	- System
		- Default-SYSCONF-Module immer mit akt. Datum und akt. Version (V0.00.0 bei Beta) stempeln


##################################################################
# 22.01.2000: V2.25 entspricht X4.85 bis auf Versionsnummern     #
##################################################################

Version X4.85 vom 22.01.2001:
-----------------------------
	- CP476
		- ME010 mit Modulkennung 1 (bisher 0 --> ungueltig in AS-HWC)

Version X4.84 vom 15.01.2001:
-----------------------------
	- PP21,PP41
		- FEHLER: MemCard-Typ wurde nach Warmstart immer unterschiedlich gemeldet
		- HWC-Familie 2003 fuer IO-Module
		- HWC-Kennungen fuer ME000 (0x02000000) und EX101 (4221) geaendert
		- Defaultkonfigurationsfiles und RUL-Files fuer PP21/PP41 inkl. SYSCONF.INI Adaption
		- IO-Manager : Wenn die Adresse einer Bitmap im Bereich 4 Byte oder die Adresse eines
		  Charaktersatzes im Bereich 8 Byte vor einer 64k Grenze liegt, wird die Adresse der
		  Bitinformationen falsch berechnet und damit falsche Daten ausgegeben.
		  Ist bis jetzt noch nicht aufgetreten. (O.Wagner, 12.01.2001)

Version X4.83 vom 09.01.2001:
-----------------------------
	- Basissystem
		- A&P 38090 : Korrektur in der "integrierten alten Funktionalitaet fuer Disablen von BasisIO"
		  (es wird nur das alte Format in "spsio.br" unterstuetzt, die Funktion ist nur aktiv, wenn
		  spsioman.br nicht geladen ist --> Beruecksichtigung der Laenge des neuen spsio-Formates
		  beim Weiterschalten --> eigentlich kann dieser Fehler hier wegen der Sortierung gar nicht
		  auftreten, denn das alte Format mit SPSIO-Typ = $00 ist immer kleiner als das neue Format)
		- Fehlercode 6403 mit B&R-Moduladresse als Info im Fehlerlogbuch
	- PP21,PP41
		- MemCard jetzt konsistent zu CP476 (Attribut-Daten liegen auf Offset 1), Programmieren und
		  Loeschen der MemCard auf neuer PowerPanel-HW moeglich
		- HWTRAP: Name von "HIC3" auf "PP00" geaendert
		- GETHWCFG mit Produktkennung fuer PP21 / PP41 (sofern die HW eine solche Kennung ungleich
		  0 und ungleich 0xFFFFFFFF liefert), Modulkennung fuer Display (Familie PANEL) und
		  MemCard (Familie ZUBEHOER) sowie fuer Tastaturen (Basiskennung 0x01000000)
		- "pp00_x48.s13" als neuer Name fuer RPSSW-Basissystem des PowerPanels (bisher "hic3_x48.s12")
		- SYSCONF.INI: Name von "HIC3" auf "PP00" geaendert, Familie 3000
		- Defaultkonfigurationsmodul @cfpp00.br mit Name "PP00" (bisher @cfhic3.br mit "HIC3")
		  @cfpp00.rul statt bisherigem @cfhic3.rul
		- EX101 mit IF6xx-CAN und IF6xx-Seriell OK (SW-Fehlerkorrektur Interruptbehandlung)
		- A&P 39345 : ANP-Schnittstellenmodule (IF311, ...) werden jetzt unterstuetzt

Version X4.82 vom 15.12.2000:
-----------------------------
	- HIC3
		IO-Manager: Auf Grund von Aenderungen in der Contrastkennlinie der Charaterdisplays wurde
		es erforderlich die Kontrastberechnung anzupassen.
		Im Zuge der Umstellung erfolgte auch die Umstellung des Projektes auf den neuen
		C-Compiler von Hitachi (O.Wagner, V1.24.0, 05.12.2000)
	- CAN2000
		CAN-Station geht nach Kaltstart in den Service-Mode wegen Buserror (A&P 38110)

Version X4.81 vom 01.12.2000:
-----------------------------
	- RPSSW Basissystem
		- CAN2000
			Exception beim Anmelden von Identifiern im Hochlauf bei hoher CAN-Last (A&P 38110)
	- LS251
		- Fehlerkorrektur FBASE-DPR-LS251 (Interrupt disabled bei Re-Open)
	- gcloader.br (V1.31)
		- Fehler 3039 mit Name der fehlenden AVT-Funktion als Extended Info im Fehlerlogbuch
	- SYSLOAD.68K
		- Fehlercode 9999 durch "sinnvolle" Codes fuer Loader ersetzt

Version X4.80 vom 20.10.2000:
-----------------------------
	- RPSSW Basissystem
		-	PPMAN: PP_ident, PP_trigger, PP_ready FUB auch fuer Automation Studio exportieren
			--> Voraussetzung fuer Verwendung der Library "ppdpr" V1.01
		-	INSTTRAP: Beim Installieren / Deinstallieren von B&R-Modulen bzw. PVs wird jetzt
			temporaer die Prioritaet auf 0x11 gesenkt, damit alle anderen Task hoeherprior sind,
			die auf eine Aenderung von SG_OV_Version bzw. SG_PV_Version "warten"


##################################################################
# 10.10.2000: V2.24 entspricht X4.76 bis auf Versionsnummern     #
##################################################################

Version X4.76 vom 10.10.2000:
-----------------------------
	- RPSSW Basissystem
	  -	CP476 IO-Manager
		-	geblockte ANP Module auf Steckplatz 2-4 Modul 0, wenn auf ANP1 kein Modul steckt
		-	ANP Inaktiv bei Umschalten eines IF Moduls im Zusammenhang mit DI153
		-	Zeitmessung des IO Zyklus überarbeitet
		-	AVT Einträge für CM471 Variante Automation Studio.

Version X4.75 vom 29.09.2000:
-----------------------------
	- RPSSW Basissystem
      - COMMSERV: Unterstuetzung von PVI/Ina2000 Event-PVs
	  			  inkl. Fehlerkorrekturen (A&P 36340 + FLOAT-PVs)
      - IO2003: keine IO-Exception bei Ausfall eines Digital-Moduls (A&P 32750)
      - LS251: Fehlerkorrektur FBASE-DPR-LS251 (Frames gingen verloren)
      - RPSSW-Update: Fehler 7497, wenn System-Flash zu klein ist
	  - CP476 / HWTRAP: richtige Erkennung ME050-xx fuer HW-Konfiguration
        (siehe "http://bratgrazpdc1/Technical Info/RPSSW/CP476/Specification/CP476_RPSSW.htm")
      - ME960/ME963/ME965 (CP152, CP153) : Modul "commserv.br" nicht mehr im Basissystem enthalten,
        weil zu wenig Platz im SystemFlash (INA-Event-PV) (Absprache mit MM/MK fuer V2.24!)
      - C221: "c220man" Korrektur fuer Verwendung im AS (gleiches IF wie PG2000) -> V1.51
	  - HIC3: erste ß-Version mit IO-Manager von O.Wagner;
	          AI902 Unterstuetzung (2.CAN-Schnittstelle)

    - AS-SYSTEM:
      - cycload.68k, sysload.68k und gcloader.br in RPSSW-Uebergabe enthalten, nicht
        mehr bei Automation Studio-Uebergabe
      - gcloader.br:
          - Unterstuetzung HIC3 (kein IN/IN', wie bei 2003)
          - Speicher fuer Inputkopiertabellen (IN/IN') wieder freigeben beim Entfernen
          - Check der freien AVT-Eintraege : Verwaltungseintrag beruecksichtigen
      - COMMSERV mit INA-EVENT-PVs (siehe oben)

	- AS-LIBRARY:
      - COMMSERV mit INA-EVENT-PVs (siehe oben)

    #######################################
    ##### 1.Autobuild-Stand der RPSSW #####
    #######################################


Version X4.74 vom 21.07.2000:
-----------------------------
	- CP476, CPx74: FBASE-CPU: Korrektur fuer Unterstuetzung der AI901
	- CP476: IO2003: Fehlerkorrektur fuer ME4xx, langsamere IDLE-Behandlung (V1.05 von O.Wagner)
	- HIC3 : Erste ß-Version ohne IO-Manager, Basis fuer Otto Wagner (eigene F&E Uebergabe)

Version X4.73 vom 12.07.2000:
-----------------------------
	- BOOT: Spurious-Interrupt nicht mit Defaulthandler ueberschreiben (A&P 8286)
	- INSTTRAP: interne Erweiterungen fuer HIC3
	- GETHWCFG: SG_cpuinfo Behandlung gestrichen (V1.10, intern)
	- CAN2000: interne Erweiterung fuer HIC3

Version X4.72 vom 07.07.2000:
-----------------------------
	- CPx74, CP476 : FBASE-CPU: "Serielle Kommunikation" zu AI901 moeglich

Version X4.71 vom 06.07.2000:
-----------------------------
	- BOOT: Spurious-Interrupt auch in Bootphase ignorieren (A&P 8286)
	- INSSTRAP: Interne Tabellen nach IO-Installfehler bereinigen (A&P 32750)
	- INA2000S: Neu generierte Version nach AR-Umstellungen, M68K unveraendert
	- COMMSERV: EH_fatal(0) bei INA2000-Buserror/Adresserror gestrichen interne
				Versionsnummer V2.30.1 (A&P 8246)


Version X4.70 vom 16.06.2000:
-----------------------------
	- AROUTER: Autobuild-Stand
	- FBASE-CPU: Autobuild-Stand
		A&P 32765: Timeoutbehandlung Compilerproblem fuehrt zu Zugriff auf falschen
				   Speicher (CPx70, CPx74, CP476, CP260, IF260, LS251, IP151/IP152/IP350/IF152, IP161)
	- LS251 : FBASE-DPRLS251: Autobuild-Stand
	- CP476 : FBASE-ME020: Autobuild-Stand
	- CP476 : IO2003-Manager: CM471-Node auch im Diagnose-Mode als Node der CPU uebernehmen
				(O.Wagner, 12.05.2000)

#####################################################################
# 25.05.2000: V2.22 abgeschlossen -> Basis fuer X4.70 (V2.24)		#
#             Anmkerung: V2.23 = LS251 spez.Fehlerkorrekturversion	#
#####################################################################
