$(AS_CPU_PATH)/iomap.br: \
	$(AS_PROJECT_PATH)/physical/$(AS_CONFIGURATION)/$(AS_PLC)/iomap.iom \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/Hardware.hc \
	$(AS_PROJECT_PATH)/physical/mainstation/pp420/cpu.sw \
	$(AS_PROJECT_PATH)/physical/$(AS_CONFIGURATION)/$(AS_PLC)/simulationonly.sw \
	$(AS_CPU_PATH)/ChannelConfiguration.xml 
	@"$(AS_BIN_PATH)/BR.AS.IOMapBuilder.exe" "$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/IoMap.iom"  -m "$(AS_CPU_PATH)/ConfigInfo.cfi" -g "$(AS_TEMP_PATH)/Objects/Declarations.lst" -x "$(AS_CPU_PATH)/ChannelConfiguration.xml" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -X "$(AS_CPU_PATH)" -o "$(AS_CPU_PATH)/iomap.br" -T SG4 -B V3.00 -P "$(AS_PROJECT_PATH)" -s PLC1

-include $(AS_CPU_PATH)/Force.mak 
