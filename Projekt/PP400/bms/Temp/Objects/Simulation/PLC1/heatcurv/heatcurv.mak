$(AS_CPU_PATH)/heatcurv.br: \
	$(AS_PROJECT_PATH)/Logical\MainStation\HeatingSystem\heatcurv\heatcurv.dat
	@"$(AS_BIN_PATH)/BR.AS.DataObjectBuilder.exe"   "$(AS_PROJECT_PATH)/Logical/MainStation/HeatingSystem/heatcurv/heatcurv.dat" -o "$(AS_CPU_PATH)/heatcurv.br" -T SG4 -v V1.00.0 -s MainStation.HeatingSystem.heatcurv

