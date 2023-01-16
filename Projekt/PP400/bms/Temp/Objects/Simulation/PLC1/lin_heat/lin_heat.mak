$(AS_CPU_PATH)/lin_heat.br: \
	$(AS_PROJECT_PATH)/Logical\MainStation\HeatingSystem\lin_heat\lin_heat.dat
	@"$(AS_BIN_PATH)/BR.AS.DataObjectBuilder.exe"   "$(AS_PROJECT_PATH)/Logical/MainStation/HeatingSystem/lin_heat/lin_heat.dat" -o "$(AS_CPU_PATH)/lin_heat.br" -T SG4 -v V1.00.0 -s MainStation.HeatingSystem.lin_heat

