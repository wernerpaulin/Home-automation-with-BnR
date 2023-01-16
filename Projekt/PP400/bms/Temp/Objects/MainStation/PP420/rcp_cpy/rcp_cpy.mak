$(AS_CPU_PATH)/rcp_cpy.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/rcp_cpy/rcp_cpy.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/rcp_cpy/rcp_cpy.ox" -o "$(AS_CPU_PATH)/rcp_cpy.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4 -B V3.00 -extConstants -d "runtime: V* - V*" -r Cyclic2 -p 2 -s MainStation.rcp_cpy -L "asstring: V*, astime: V*, bmslib: V*, brsystem: V*, Convert: V*, DataObj: V*, FileIO: V*, LoopConR: V2.71.2, Operator: V*, Runtime: V*, sys_lib: V*, VcScrSht: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/rcp_cpy/rcp_cpy.ox: \
	$(AS_CPU_PATH)/rcp_cpy/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/rcp_cpy/a.out" -o "$(AS_CPU_PATH)/rcp_cpy/rcp_cpy.ox" -T SG4 -r Cyclic2   -G V4.1.1 -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/rcp_cpy/a.out: \
	$(AS_CPU_PATH)/rcp_cpy/rcp_cpy.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link -o "$(AS_CPU_PATH)/rcp_cpy/a.out" "$(AS_CPU_PATH)/rcp_cpy/rcp_cpy.o"  -G V4.1.1  -specs=I386specs -Wl,-q,-T,SG4.x -nostdlib "-Wl,$(AS_GNU_INST_PATH)/i386-elf/lib/libasiec.a" -T SG4 "-Wl,$(AS_TEMP_PATH)/Archives/SG4/libbmslib.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libConvert.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libRuntime.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libOperator.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libDataObj.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libasstring.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libastime.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libbrsystem.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libsys_lib.a" "-Wl,C:/Program Files/BrAutomation/AS30080/As/VC/Firmware/V3.63.8/SG4/libVisapi.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libFileIO.a" "-Wl,$(AS_PROJECT_PATH)/Logical/Libraries/LoopConR/SG4/libLoopConR.a" "-Wl,C:/Program Files/BrAutomation/AS30080/As/VC/Firmware/V3.63.8/SG4/libVcScrSht.a" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/rcp_cpy.xref: \
	$(AS_CPU_PATH)/rcp_cpy/rcp_cpy.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/rcp_cpy/rcp_cpy.xrefo" -o "$(AS_CPU_PATH)/rcp_cpy.xref"

$(AS_CPU_PATH)/rcp_cpy/rcp_cpy.o: \
	$(AS_PROJECT_PATH)/Logical/MainStation/rcp_cpy/rcp_cpy.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/DataObj/DataObj.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/bmslib/bmslib.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/DataObj/DataObj.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/asstring/asstring.fun \
	$(AS_PROJECT_PATH)/Logical/MainStation/rcp_cpy/rcp_cpy.var \
	$(AS_PROJECT_PATH)/Logical/Globals/Global.var \
	$(AS_PROJECT_PATH)/Logical/Globals/Global.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.typ \
	$(AS_PROJECT_PATH)/Logical/Globals/Alarms.var \
	$(AS_PROJECT_PATH)/Logical/Globals/Alarms.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/MainStation/rcp_cpy/rcp_cpy.st" -o "$(AS_CPU_PATH)/rcp_cpy/rcp_cpy.o"  -O "$(AS_CPU_PATH)/rcp_cpy/rcp_cpy.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

