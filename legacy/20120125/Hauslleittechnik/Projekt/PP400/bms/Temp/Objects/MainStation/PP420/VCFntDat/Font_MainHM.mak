######################################################
#                                                    #
# Automatic generated Makefile for Visual Components #
#                                                    #
#                  Do NOT edit!                      #
#                                                    #
######################################################

VCC=@$(AS_BIN_PATH)/Br.Vc.pc.exe
LINK=@$(AS_BIN_PATH)/BR.VC.Link.exe
MODGEN=@$(AS_BIN_PATH)/BR.VC.modgen.exe
VCPL=@$(AS_BIN_PATH)/BR.vc.pl.exe
VCHWPP=@$(AS_BIN_PATH)/br.vc.hwpp.exe
VCDEP=@$(AS_BIN_PATH)/br.vc.depend.exe
VCFLGEN=@$(AS_BIN_PATH)/br.vc.lfgen.exe
VCREFHANDLER=@$(AS_BIN_PATH)/BR.VC.CrossReferenceHandler.exe
VCXREFEXTENDER=@$(AS_BIN_PATH)/BR.AS.CrossRefVCExtender.exe
RM=CMD /C DEL
PALFILE_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Palette.vcr
VCCFLAGS_MainHM=-server -proj MainHM -vc '$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/VCObject.vc' -prj_path '$(AS_PROJECT_PATH)' -temp_path '$(AS_TEMP_PATH)' -cfg $(AS_CONFIGURATION) -plc $(AS_PLC) -cpu_path '$(AS_CPU_PATH)'
VCFIRMWARE=V3.63.8
VCFIRMWAREPATH=C:\Program Files\BrAutomation\AS30080\AS\VC\Firmware\V3.63.8\SG4
VCFIRMWAREPATHPOSTBUILD=C:/Program Files/BrAutomation/AS30080/AS/VC/Firmware/V3.63.8/SG4

VCSTARTUP='$(VCFIRMWAREPATH)\vcstart.br'
VCSTPOST='$(VCFIRMWAREPATH)\vcstpost.br'
TARGET_FILE_MainHM=$(AS_CPU_PATH)/MainHM.br
OBJ_SCOPE_MainHM=MainStation
PRJ_PATH_MainHM=$(AS_PROJECT_PATH)
SRC_PATH_MainHM=$(AS_PROJECT_PATH)/Logical/$(OBJ_SCOPE_MainHM)/MainHMI
TEMP_PATH_MainHM=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/MainHM
TEMP_PATH_ROOT_MainHM=$(AS_TEMP_PATH)
VC_LIBRARY_LIST_MainHM=$(TEMP_PATH_MainHM)/libraries.vci
VC_XREF_BUILDFILE_MainHM=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/vcxref.build
VC_XREF_CLEANFILE=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/vcxref.clean
VC_LANGUAGES_MainHM=$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr
CPUHWC='$(TEMP_PATH_MainHM)/cpuhwc.vci'
TTFFLAGS_MainHM= -P $(AS_PROJECT_PATH) -l $(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr -cv $(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo

#
# Font ARIAL
#
ifneq ($(VC_FONT_ARIAL),1)
VC_FONT_ARIAL=1
$(AS_CPU_PATH)/VcFntDat/ARIAL.vco:$(AS_CPU_PATH)/VcFntDat/ARIAL.vci
	 $(VCC) -f '$<' -o '$@' $(TTFFLAGS_MainHM) $(VCCFLAGS_MainHM)

$(AS_CPU_PATH)/VcFntDat/ARIAL.ccf:$(AS_CPU_PATH)/VcFntDat/ARIAL.vco
	 $(LINK) '$^' -o '$@' -warningLevel2 -m ARIAL.ttf -name MainHM -profile 'False'

$(AS_CPU_PATH)/arial.br:$(AS_CPU_PATH)/VcFntDat/ARIAL.ccf
	 $(MODGEN) -m $(VCSTARTUP) -f '$<' -o '$@' -d vcgclass -v V1.00.0 -profile False
endif

#
# Font ARIALBD
#
ifneq ($(VC_FONT_ARIALBD),1)
VC_FONT_ARIALBD=1
$(AS_CPU_PATH)/VcFntDat/ARIALBD.vco:$(AS_CPU_PATH)/VcFntDat/ARIALBD.vci
	 $(VCC) -f '$<' -o '$@' $(TTFFLAGS_MainHM) $(VCCFLAGS_MainHM)

$(AS_CPU_PATH)/VcFntDat/ARIALBD.ccf:$(AS_CPU_PATH)/VcFntDat/ARIALBD.vco
	 $(LINK) '$^' -o '$@' -warningLevel2 -m ARIALBD.ttf -name MainHM -profile 'False'

$(AS_CPU_PATH)/arialbd.br:$(AS_CPU_PATH)/VcFntDat/ARIALBD.ccf
	 $(MODGEN) -m $(VCSTARTUP) -f '$<' -o '$@' -d vcgclass -v V1.00.0 -profile False
endif

FONT_MODULES_MainHM=$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/arial.br $(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/arialbd.br 
