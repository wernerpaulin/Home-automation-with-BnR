$(AS_CPU_PATH)/bmslib.br: \
	$(AS_PROJECT_PATH)\Logical\Libraries\bmslib\IEC.lby \
	$(AS_CPU_PATH)/bmslib/bmslib.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/bmslib/bmslib.ox" -o "$(AS_CPU_PATH)/bmslib.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4 -B V3.00 -extConstants -d "runtime: V* - V*" -r Library -R "BMS support functions"  -s Libraries.bmslib -L "asstring: V*, astime: V*, bmslib: V*, brsystem: V*, Convert: V*, DataObj: V*, FileIO: V*, LoopConR: V2.71.2, Operator: V*, Runtime: V*, sys_lib: V*, VcScrSht: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/bmslib/bmslib.ox: \
	$(AS_CPU_PATH)/bmslib/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/bmslib/a.out" -o "$(AS_CPU_PATH)/bmslib/bmslib.ox" -T SG4 -r Library   -G V4.1.1 -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/bmslib/a.out: \
	$(AS_CPU_PATH)/bmslib/bmslib.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link -o "$(AS_CPU_PATH)/bmslib/a.out" "$(AS_CPU_PATH)/bmslib/bmslib.o"  -G V4.1.1  -specs=I386specs -Wl,-q,-T,SG4.x -nostdlib "-Wl,$(AS_GNU_INST_PATH)/i386-elf/lib/libasiec.a" -T SG4 "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libConvert.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libRuntime.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libOperator.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libDataObj.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libasstring.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libastime.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libbrsystem.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libsys_lib.a" "-Wl,C:/Program Files/BrAutomation/AS30080/As/VC/Firmware/V3.63.8/SG4/libVisapi.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/V0300/SG4/libFileIO.a" "-Wl,$(AS_PROJECT_PATH)/Logical/Libraries/LoopConR/SG4/libLoopConR.a" "-Wl,C:/Program Files/BrAutomation/AS30080/As/VC/Firmware/V3.63.8/SG4/libVcScrSht.a" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/bmslib.xref: \
	$(AS_CPU_PATH)/bmslib/bmslib.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/bmslib/bmslib.xrefo" -o "$(AS_CPU_PATH)/bmslib.xref"

$(AS_CPU_PATH)/bmslib/bmslib.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/bmslib/bmslib.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/bmslib/bmslib.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/DataObj/DataObj.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/DataObj/DataObj.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/asstring/asstring.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/DataObj/DataObj.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/bmslib/bmslib.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/bmslib/bmslib.st" -o "$(AS_CPU_PATH)/bmslib/bmslib.o"  -O "$(AS_CPU_PATH)/bmslib/bmslib.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

