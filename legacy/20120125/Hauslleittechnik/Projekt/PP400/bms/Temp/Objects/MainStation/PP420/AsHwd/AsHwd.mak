$(AS_CPU_PATH)/ashwd.br: \
	$(AS_PROJECT_PATH)/Physical/MainStation/Hardware.hc \
	$(AS_INSTALL_PATH)/Upgrades/Modified.txt
	@"$(AS_BIN_PATH)/BR.AS.ConfigurationBuilder.exe"  "$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/Hardware.hc" -v V1.00.0 -S PP420 -o "$(AS_CPU_PATH)/ashwd.br" -T SG4 -B V3.00 -P "$(AS_PROJECT_PATH)" -zip -s PP420 -hwd -secret "$(AS_PROJECT_PATH)_br.as.configurationbuilder.exe"
