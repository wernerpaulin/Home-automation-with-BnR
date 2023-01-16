$(AS_CPU_PATH)/lin_out.br: \
	$(AS_PROJECT_PATH)/Logical\MainStation\HeatingSystem\lin_out\lin_out.dat
	@"$(AS_BIN_PATH)/BR.AS.DataObjectBuilder.exe"   "$(AS_PROJECT_PATH)/Logical/MainStation/HeatingSystem/lin_out/lin_out.dat" -o "$(AS_CPU_PATH)/lin_out.br" -T SG4 -v V1.00.0 -s MainStation.HeatingSystem.lin_out

