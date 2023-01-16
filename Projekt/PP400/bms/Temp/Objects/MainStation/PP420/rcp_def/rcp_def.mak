$(AS_CPU_PATH)/rcp_def.br: \
	$(AS_PROJECT_PATH)/Logical\MainStation\rcp_def\rcp_def.dat
	@"$(AS_BIN_PATH)/BR.AS.DataObjectBuilder.exe"   "$(AS_PROJECT_PATH)/Logical/MainStation/rcp_def/rcp_def.dat" -o "$(AS_CPU_PATH)/rcp_def.br" -T SG4 -v V1.00.0 -s MainStation.rcp_def

