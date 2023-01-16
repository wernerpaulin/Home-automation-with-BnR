export AS_PLC := PP420
export AS_CPU_PATH := $(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)
export AS_ACTIVE_CONFIG_PATH := $(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)
export WIN32_AS_CPU_PATH := $(WIN32_AS_TEMP_PATH)\Objects\$(AS_CONFIGURATION)\$(AS_PLC)
export WIN32_AS_ACTIVE_CONFIG_PATH := $(WIN32_AS_PROJECT_PATH)\Physical\$(AS_CONFIGURATION)\$(AS_PLC)


CpuMakeFile: \
$(AS_CPU_PATH)/ashwd.br \
$(AS_CPU_PATH)/asfw.br \
$(AS_CPU_PATH)/sysconf.br \
$(AS_CPU_PATH)/arconfig.br \
$(AS_CPU_PATH)/bmslib.br \
$(AS_CPU_PATH)/bmslib.xref \
$(AS_CPU_PATH)/hs_con.br \
$(AS_CPU_PATH)/hs_con.xref \
$(AS_CPU_PATH)/ip_con.br \
$(AS_CPU_PATH)/ip_con.xref \
$(AS_CPU_PATH)/hmi_sup.br \
$(AS_CPU_PATH)/hmi_sup.xref \
$(AS_CPU_PATH)/rcp_cpy.br \
$(AS_CPU_PATH)/rcp_cpy.xref \
$(AS_CPU_PATH)/alarm.br \
$(AS_CPU_PATH)/alarm.xref \
$(AS_CPU_PATH)/statistics.br \
$(AS_CPU_PATH)/statistics.xref \
$(AS_CPU_PATH)/rcp_def.br \
$(AS_CPU_PATH)/heatcurv.br \
$(AS_CPU_PATH)/lin_heat.br \
$(AS_CPU_PATH)/lin_in.br \
$(AS_CPU_PATH)/lin_out.br \
$(AS_CPU_PATH)/MainHM.br \
vcPostBuild_MainHM \
$(AS_CPU_PATH)/PW35.br \
$(AS_CPU_PATH)/iomap.br \
$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/Transfer.lst

$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/Transfer.lst: \
	$(AS_CPU_PATH)/ashwd.br \
	$(AS_CPU_PATH)/asfw.br \
	$(AS_CPU_PATH)/sysconf.br \
	$(AS_CPU_PATH)/arconfig.br \
	$(AS_CPU_PATH)/bmslib.br \
	$(AS_CPU_PATH)/hs_con.br \
	$(AS_CPU_PATH)/ip_con.br \
	$(AS_CPU_PATH)/hmi_sup.br \
	$(AS_CPU_PATH)/rcp_cpy.br \
	$(AS_CPU_PATH)/alarm.br \
	$(AS_CPU_PATH)/statistics.br \
	$(AS_CPU_PATH)/rcp_def.br \
	$(AS_CPU_PATH)/heatcurv.br \
	$(AS_CPU_PATH)/lin_heat.br \
	$(AS_CPU_PATH)/lin_in.br \
	$(AS_CPU_PATH)/lin_out.br \
	$(AS_CPU_PATH)/MainHM.br \
	$(AS_CPU_PATH)/PW35.br \
	$(AS_CPU_PATH)/iomap.br \
	$(AS_PROJECT_PATH)/Physical/MainStation/PP420/Cpu.sw \
	$(AS_PROJECT_PATH)/Physical/MainStation/PP420/MainStationOnly.sw \
	$(AS_CPU_PATH)/WebServ.br \
	$(AS_CPU_PATH)/ArSdm.br \
	$(AS_CPU_PATH)/ArSdmSvg.br \
	$(AS_CPU_PATH)/ArSdmSvp.br \
	$(AS_CPU_PATH)/ArSdmHtm.br
	@"$(AS_BIN_PATH)/BR.AS.FinalizeBuild.exe" "$(AS_PROJECT_PATH)/bms.apj" -t "$(AS_TEMP_PATH)" -o "$(AS_BINARIES_PATH)" -c "$(AS_CONFIGURATION)" -i "C:/Program Files/BrAutomation/AS30080" -S PP420  -pil   -C "/RT=1000  /DAIP=10.43.43.1 /CKDA=0 /REPO=11159 /ANSL=1" -D "/IF=tcpip /LOPO=11159 /SA=217"

#nothing to do (just call module make files)

include $(AS_CPU_PATH)/iomap/iomap.mak
include $(AS_CPU_PATH)/PW35/PW35.mak
include $(AS_CPU_PATH)/MainHM/MainHM.mak
include $(AS_CPU_PATH)/lin_out/lin_out.mak
include $(AS_CPU_PATH)/lin_in/lin_in.mak
include $(AS_CPU_PATH)/lin_heat/lin_heat.mak
include $(AS_CPU_PATH)/heatcurv/heatcurv.mak
include $(AS_CPU_PATH)/rcp_def/rcp_def.mak
include $(AS_CPU_PATH)/statistics/statistics.mak
include $(AS_CPU_PATH)/alarm/alarm.mak
include $(AS_CPU_PATH)/rcp_cpy/rcp_cpy.mak
include $(AS_CPU_PATH)/hmi_sup/hmi_sup.mak
include $(AS_CPU_PATH)/ip_con/ip_con.mak
include $(AS_CPU_PATH)/hs_con/hs_con.mak
include $(AS_CPU_PATH)/bmslib/bmslib.mak
include $(AS_CPU_PATH)/arconfig/arconfig.mak
include $(AS_CPU_PATH)/sysconf/sysconf.mak
include $(AS_CPU_PATH)/AsFw/AsFw.mak
include $(AS_CPU_PATH)/AsHwd/AsHwd.mak

.DEFAULT:
#nothing to do (need this target for prerequisite files that don't exit)
