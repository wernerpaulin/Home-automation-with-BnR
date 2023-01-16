SG3_COMPILER=$(AS_BIN_PATH)/BR.VC.SG3Compiler.exe
VC_BUILD_OPTIONS_PW35=-X xref

VC_XREF_BUILDFILE_Visu=Z:/Hauslleittechnik/Projekt/PP400/bms/Temp/Objects/MainStation/PP420/PW35/vcxref.build
VCREFHANDLER=@$(AS_BIN_PATH)/BR.VC.CrossReferenceHandler.exe
VCXREFEXTENDER=@$(AS_BIN_PATH)/BR.AS.CrossRefVCExtender.exe

$(AS_CPU_PATH)/PW35.br: $(AS_PROJECT_PATH)/Logical/Basement/PW35/Visu.pwc $(AS_TEMP_PATH)/Objects/MainStation/PP420/PW35/vcobject.dip $(VC_XREF_BUILDFILE_Visu) $(AS_PROJECT_PATH)/Logical/Globals/Global.typ $(AS_PROJECT_PATH)/Logical/Globals/Global.var $(AS_PROJECT_PATH)/Logical/MainStation/hmi_sup/hmi_sup.var
	@$(SG3_COMPILER) PW35 -a 'Z:/Hauslleittechnik/Projekt/PP400/bms/Temp/Objects/MainStation/PP420/PW35/vcobject.dip' -c MainStation -g 'Z:/Hauslleittechnik/Projekt/PP400/bms/Temp/Objects/Declarations.lst' -H 'Z:/Hauslleittechnik/Projekt/PP400/bms/Physical/MainStation/Hardware.hc' -m 'Z:/Hauslleittechnik/Projekt/PP400/bms/Temp/Objects/MainStation/PP420/ConfigInfo.cfi' -o 'PW35' -P 'Z:/Hauslleittechnik/Projekt/PP400/bms/' -postBuild '' -s Basement -S PP420 -t 'Z:/Hauslleittechnik/Projekt/PP400/bms/Temp/' -T SG4 -v V1.00.0 -V V3.63.8 $(VC_BUILD_OPTIONS_PW35)
	@$(VCREFHANDLER) -T SG3 -X 'Z:/Hauslleittechnik/Projekt/PP400/bms/Temp/Objects/MainStation/PP420/PW35/PW35.xrefvc' -P 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/Basement/PW35/Visu.pwc' -exp 'Z:/Hauslleittechnik/Projekt/PP400/bms/Temp/Conversion/PW35/Export' -var '$(AS_CPU_PATH)/PW35/varfile.xml' -dec '$(AS_CPU_PATH)/PW35/Declaration.dep' -dep 'PW35' -o 'Z:/Hauslleittechnik/Projekt/PP400/bms/Temp/Objects/MainStation/PP420/PW35/PW35.xrefvc' -verbose False
	@$(VCXREFEXTENDER) 'Z:/Hauslleittechnik/Projekt/PP400/bms/Temp/Objects/MainStation/PP420/PW35/PW35.xrefvc' -o '$(AS_CPU_PATH)/PW35.xref' -P '$(AS_PROJECT_PATH)/' -c '$(AS_CONFIGURATION)' -S '$(AS_PLC)' -t '$(AS_TEMP_PATH)' 

PW35: PW35.br

$(AS_CPU_PATH)/PW35.xref: $(AS_CPU_PATH)/PW35.br

	@echo Compiling Object PW35 from BasementPW35
