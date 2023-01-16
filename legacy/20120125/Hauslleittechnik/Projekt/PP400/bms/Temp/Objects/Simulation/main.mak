CYGWIN=nontsec
export PATH := C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem
export AS_COMPANY_NAME :=  
export AS_USER_NAME := Administrator
export AS_PATH := C:/Program\ Files/BrAutomation/AS30080
export AS_BIN_PATH := C:/Program Files/BrAutomation/AS30080/Bin-en
export AS_PROJECT_PATH := Z:/Hauslleittechnik/Projekt/PP400/bms
export AS_PROJECT_NAME := bms
export AS_SYSTEM_PATH := C:/Program\ Files/BrAutomation/As/System
export AS_VC_PATH := C:/Program\ Files/BrAutomation/AS30080/As/VC
export AS_TEMP_PATH := Z:/Hauslleittechnik/Projekt/PP400/bms/Temp
export AS_CONFIGURATION := Simulation
export AS_BINARIES_PATH := Z:/Hauslleittechnik/Projekt/PP400/bms/Binaries
export AS_GNU_INST_PATH := C:/Program\ Files/BrAutomation/AS30080/As/GnuInst/V4.1.1
export AS_GNU_BIN_PATH := $(AS_GNU_INST_PATH)/bin
export AS_INSTALL_PATH := C:/Program\ Files/BrAutomation/AS30080
export WIN32_AS_PATH := C:\\Program Files\\BrAutomation\\AS30080
export WIN32_AS_BIN_PATH := C:\\Program Files\\BrAutomation\\AS30080\\Bin-en
export WIN32_AS_PROJECT_PATH := Z:\\Hauslleittechnik\\Projekt\\PP400\\bms
export WIN32_AS_SYSTEM_PATH := C:\\Program Files\\BrAutomation\\As\\System
export WIN32_AS_VC_PATH := C:\\Program Files\\BrAutomation\\AS30080\\As\\VC
export WIN32_AS_TEMP_PATH := Z:\\Hauslleittechnik\\Projekt\\PP400\\bms\\Temp
export WIN32_AS_BINARIES_PATH := Z:\\Hauslleittechnik\\Projekt\\PP400\\bms\\Binaries
export WIN32_AS_GNU_INST_PATH := C:\\Program Files\\BrAutomation\\AS30080\\As\\GnuInst\\V4.1.1
export WIN32_AS_GNU_BIN_PATH := $(WIN32_AS_GNU_INST_PATH)\\bin
export WIN32_AS_INSTALL_PATH := C:\\Program Files\\BrAutomation\\AS30080

.suffixes:

ProjectMakeFile:

	@"$(AS_BIN_PATH)/BR.AS.AnalyseProject.exe" "$(AS_PROJECT_PATH)/bms.apj" -t "$(AS_TEMP_PATH)" -c "$(AS_CONFIGURATION)" -o "$(AS_BINARIES_PATH)"  

	@$(AS_GNU_BIN_PATH)/mingw32-make.exe -r -f 'Z:/Hauslleittechnik/Projekt/PP400/bms/Temp/Objects/$(AS_CONFIGURATION)/PLC1/#cpu.mak' -k

