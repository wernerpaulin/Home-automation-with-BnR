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

DSOFLAGS=-P $(AS_PROJECT_PATH) -l $(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr -cv $(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo -pal '$(PALFILE_MainHM)'
LIB_SHARED=$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/vcshared.vca

#
# Shared Runtime Options
#
VCRS_OBJECT=$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/vcrt_s.vco
VCRS_SOURCE=$(AS_PROJECT_PATH)/Logical/VCShared/Package.vcp

# All Shared Source Objects
VCR_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr 

TXTGRP_SHARED_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmState_long.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/DateTimeFormats.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AcknowledgeState_long.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AcknowledgeState_short.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmState_short.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/BypassState_long.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/BypassState_short.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmEvent_long.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmEvent_short.txtgrp 

VCUG_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Length.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Mass.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Volume.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Power.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Memory.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Pressure.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Temperatures.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Time.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Percentage.vcug 

ALCFG_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/AlarmSystem.alcfg 

ALGRP_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/SystemAlarms.algrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/AlarmBMS.algrp 

DPO_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Local.dpo \
	$(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Internal.dpo 

DSO_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Local.dso \
	$(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Internal.dso 

DPT_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/VCShared/DataSources/DataPointList.dpt 

CVINFO_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo 



# UnitGroups
VCUG_OBJECTS_MainHM = $(addprefix $(AS_CPU_PATH)/VCShared/vcug., $(notdir $(VCUG_SOURCES_MainHM:.vcug=.vco)))

$(AS_CPU_PATH)/VCShared/vcug.Length.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Length.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/vcug.Mass.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Mass.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/vcug.Volume.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Volume.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/vcug.Power.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Power.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/vcug.Memory.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Memory.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/vcug.Pressure.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Pressure.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/vcug.Temperatures.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Temperatures.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/vcug.Time.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Time.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/vcug.Percentage.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Percentage.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


#UnitGroups END




# AlarmGroups
ALGRP_OBJECTS_MainHM = $(addprefix $(AS_CPU_PATH)/VCShared/algrp., $(notdir $(ALGRP_SOURCES_MainHM:.algrp=.vco)))

$(AS_CPU_PATH)/VCShared/algrp.SystemAlarms.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/SystemAlarms.algrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/algrp.AlarmBMS.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/AlarmBMS.algrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


#AlarmGroups END




# AlarmSystem
ALCFG_OBJECTS_MainHM = $(addprefix $(AS_CPU_PATH)/VCShared/alcfg., $(notdir $(ALCFG_SOURCES_MainHM:.alcfg=.vco)))

$(AS_CPU_PATH)/VCShared/alcfg.AlarmSystem.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/AlarmSystem.alcfg
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


#AlarmSystem END




# Text Groups
TXTGRP_SHARED_OBJECTS_MainHM = $(addprefix $(AS_CPU_PATH)/VCShared/txtgrp., $(notdir $(TXTGRP_SHARED_SOURCES_MainHM:.txtgrp=.vco)))

$(AS_CPU_PATH)/VCShared/txtgrp.AlarmState_long.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmState_long.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/txtgrp.DateTimeFormats.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/DateTimeFormats.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/txtgrp.AcknowledgeState_long.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AcknowledgeState_long.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/txtgrp.AcknowledgeState_short.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AcknowledgeState_short.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/txtgrp.AlarmState_short.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmState_short.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/txtgrp.BypassState_long.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/BypassState_long.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/txtgrp.BypassState_short.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/BypassState_short.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/txtgrp.AlarmEvent_long.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmEvent_long.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(AS_CPU_PATH)/VCShared/txtgrp.AlarmEvent_short.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmEvent_short.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


#Text Groups END


#
# Datapoint List
#
DPT_OBJECTS=$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/dpt.DataPointList.vco
$(DPT_OBJECTS) : $(AS_PROJECT_PATH)/Logical/VCShared/DataSources/DataPointList.dpt $(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Local.dpo $(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Internal.dpo 
	 $(VCC) -f '$<' -o '$@' $(DSOFLAGS) $(VCCFLAGS_MainHM) -p MainHM

#
# Datapoint Objects
#
$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/dpt.Local.vco: $(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Local.dso $(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Local.dpo
	 $(VCC) -f '$<' -o '$@' $(DSOFLAGS) $(VCCFLAGS_MainHM) -p MainHM

$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/dpt.Internal.vco: $(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Internal.dso $(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Internal.dpo
	 $(VCC) -f '$<' -o '$@' $(DSOFLAGS) $(VCCFLAGS_MainHM) -p MainHM

DPO_OBJECTS=$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/dpt.Local.vco $(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/dpt.Internal.vco 


#
# Building the Shared Runtime Options
#
$(VCRS_OBJECT) : $(VCRS_SOURCE)
	$(VCC) -f '$<' -o '$@' -ct shared -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -sl  $(VCCFLAGS_MainHM) -p MainHM

#
# The Shared Module
#
SHARED_MODULE=$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/vcshared.br
SHARED_CCF=$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/vcshared.ccf
DEL_SHARED_CCF=Z:\Hauslleittechnik\Projekt\PP400\bms\Temp\Objects\$(AS_CONFIGURATION)\$(AS_PLC)\VCShared\vcshared.ccf.lfl

$(SHARED_MODULE) : $(SHARED_CCF)
	 $(MODGEN) -m $(VCSTARTUP) -v V1.00.0 -f '$<' -o '$@' -d vcgclass -profile 'False'

$(VCUG_OBJECTS_MainHM): $(VC_LANGUAGES_MainHM)
$(TXTGRP_SHARED_OBJECTS_MainHM): $(VC_LANGUAGES_MainHM)
$(ALGRP_OBJECTS_MainHM): $(VC_LANGUAGES_MainHM)
$(ALCFG_OBJECTS_MainHM): $(VC_LANGUAGES_MainHM)

$(SHARED_CCF): $(VCRS_OBJECT) $(VCR_OBJECTS_MainHM) $(VCUG_OBJECTS_MainHM) $(ALGRP_OBJECTS_MainHM) $(ALCFG_OBJECTS_MainHM) $(DPT_OBJECTS) $(DPO_OBJECTS) $(TXTGRP_SHARED_OBJECTS_MainHM) $(CVINFO_OBJECTS_MainHM)
	-@CMD if exist /Q "$(DEL_SHARED_CCF)" /C DEL /F /Q "$(DEL_SHARED_CCF)" 2>nul
	 @$(VCFLGEN) '$@.lfl' '$(VCR_OBJECTS_MainHM:.vco=.vco,)'
	 @$(VCFLGEN) '$@.lfl' '$(VCUG_OBJECTS_MainHM:.vco=.vco,)'
	 @$(VCFLGEN) '$@.lfl' '$(ALGRP_OBJECTS_MainHM:.vco=.vco,)'
	 @$(VCFLGEN) '$@.lfl' '$(ALCFG_OBJECTS_MainHM:.vco=.vco,)'
	 @$(VCFLGEN) '$@.lfl' '$(TXTGRP_SHARED_OBJECTS_MainHM:.vco=.vco,)'
	 @$(VCFLGEN) '$@.lfl' '$(DPO_OBJECTS:.vco=.vco,)'
	 @$(VCFLGEN) '$@.lfl' '$(DPT_OBJECTS:.vco=.vco,)'
	 @$(VCFLGEN) '$@.lfl' '$(VCRS_OBJECT)'
	 $(LINK) '$@.lfl' -o '$@' -lib '$(LIB_SHARED)' -P '$(AS_PROJECT_PATH)' -m 'shared resources' -profile 'False' -warningLevel2 -name MainHM


$(LIB_SHARED): $(SHARED_CCF)
