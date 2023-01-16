Date				Version		Comment
??.06.2002	V0.00			irrigation system ready for operation
07.10.2002	V1.00			Heating system ready for operation
03.11.2002	V1.01			Eco functions implemented
27.12.2002	V1.02			new Trend Library, new statistical information (temperature, heating)
											Raw value check of temperature sensores packed into a function
											No acknowledge necessary for temperature alarms -> self recovery without operator
											CX408 Life Guarding
											EX270 Life Guarding
											DatObjCreate: take care about ERR_FUB_BUSY where ever it is used
03.02.2003	V1.03			message if closed loop is active
											Topology: Animation of communication 
											Save heating minutes at 23:59 to ensure to be on same day
											Frame for all trend charts
											leading temperature renamed to feed temperature (incl. term "flow pipe")
											Average Temperature for day trend
											antifreeze protection for heating circuit
24.05.2003	V1.04			communication animation
											GFont2x2 changed: ° symbol
											NewDataObject() for statistical data
											Command "change picture" instead of "prev. or next picture" used
											(not supported any more by VisComp)
21.10.2003	V1.05			picture 30.5 and 30.6 exchanged
											anual trend colors changed
											DHCP server activated for online communication
											new node number of target: 11 -> 1
25.12.2003	V1.06			Mixer will be referenced every day at midnight
											PID controller: Kp=6, Tn=200s
											Livingroom eco function: hysteresis high/low = 0.2/0.3
											plausibility check of heating programm names 
											plausibility check of irrigation segment names 
											new anti windup method used
											visualization of mixer homing procedure improved
											continous PID input calculation
											irrigation output enable
											average temperature of a year
											total heating hours of a year
											outside temperature on the front page
											additional min/max temperatures for year trend
05.06.2004	V1.07			ip_mgr: no valve check anymore due to new valves
											remote operator panel "cellar 04" support (PP35)
											cellar04_V1_00: irrigation plant control
29.06.2004	V1.08			ip_mgr: water level messages implemented
											water pressure and humidity sensors disabled (not used)
											

											