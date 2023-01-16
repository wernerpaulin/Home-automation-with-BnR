$(AS_CPU_PATH)/lin_in.br: \
	$(AS_PROJECT_PATH)/Logical\MainStation\HeatingSystem\lin_in\lin_in.dat
	@"$(AS_BIN_PATH)/BR.AS.DataObjectBuilder.exe"   "$(AS_PROJECT_PATH)/Logical/MainStation/HeatingSystem/lin_in/lin_in.dat" -o "$(AS_CPU_PATH)/lin_in.br" -T SG4 -v V1.00.0 -s MainStation.HeatingSystem.lin_in

