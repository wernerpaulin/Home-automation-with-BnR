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
# include Shared and Font Makefile (only once)
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCFntDat/Font_MainHM.mak
ifneq ($(VCINC),1)
	VCINC=1
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/VCShared.mak
endif

DEPENDENCIES_MainHM=-d vcgclass -profile 'False'
DEFAULT_STYLE_SHEET_MainHM=Source[local].StyleSheet[Color]
SHARED_MODULE=$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/vcshared.br
LFNTFLAGS_MainHM=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)'
BDRFLAGS_MainHM=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)'

# Local Libs
LIB_LOCAL_OBJ_MainHM=$(TEMP_PATH_MainHM)/localobj.vca

# KeyMapping flags
KEYMAP_SOURCES_MainHM=
KEYMAP_OBJECTS_MainHM=

# All Source Objects
TXTGRP_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TextGroups/HeaderGroup.txtgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TextGroups/OnOff.txtgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TextGroups/SummerWinter.txtgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TextGroups/ActiveInactive.txtgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TextGroups/RecipeFileNames.txtgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TextGroups/WebFiles.txtgrp 

FNINFO_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Fonts/DefaultFont.fninfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Fonts/Arial9px.fninfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Fonts/Arial9pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Fonts/Arial10pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Fonts/Arial12px.fninfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Fonts/Arial9pxValue.fninfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Fonts/Arial12pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Fonts/Arial10px.fninfo 

BMINFO_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA1.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA2.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA3.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadVGA_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA2_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA3_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA1_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadVGA.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/NumPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/NumPad.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AcknowledgeReset.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmActive.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmBypassOFF.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmBypassON.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmInactive.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmLatched.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmNotQuit.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmQuit.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Reset.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ResetAcknowledge.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Triggered.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ListPadHor.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ListPadHor_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ListPadVer.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ListPadVer_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/backward_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/backward_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/global_area_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/global_area_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/forward_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/forward_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/control_button_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/control_button_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/right_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/right_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/left_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/left_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/up_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/down_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/multi_up_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/multi_up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/multi_down_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/multi_down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ProgressBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/down_active_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/down_pressed_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/up_active_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/global_area_gradient_upside.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/global_area_gradient_downside.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/frame_header.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/up_pressed_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/EditPadVGA.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/EditPadVGA_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneNumPad_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneListPadVer_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPad_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPadQVGA1_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPadQVGA1_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPadQVGA2_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPadQVGA3_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneEditpadQVGA2_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneEditPadQVGA3_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneEditPadVga_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneEditPadVga_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneListPadHor_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneListPadHor_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneListPadVer_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneNumPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/GLOBAL_BAR_TOP.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/GLOBAL_BAR_BOTTOM.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/TempUp_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/TempDown_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/TempSteady_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/CONTROL_CHECKBOX_ON.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/CONTROL_CHECKBOX_OFF.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_orig.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/TempTrend_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_cfg_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Cfg_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_32.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_32_bw.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_bw_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Down_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Minus_32.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Minus_orig.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Plus_32.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Plus_orig.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Up_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/exit_32.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/exit_32_bw.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/exit_orig.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/disk_32.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/disk_orig.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/folder_32.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/folder_orig.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/water_drop_32.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/water_drop_orig.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/water_drop_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/analyze_orig.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Stethoscope_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Stethoscope_orig.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/analyze_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ok_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/not_ok_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/blank24_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/set_time_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/display_cal_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/bms_topology.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/screen_cleaner_orig.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/screen_cleaner_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/folder_24.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/disk_24.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/water_cfg_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/bms_cfg_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/warning_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/fire_diag_ico.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/hls.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmInactiveNew.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmActiveNew.bminfo \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/hls_logo.bminfo 

BMGRP_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/AlphaPadQVGA.bmgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/NumPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/AlphaPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/AlarmEvent.bmgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/AlarmState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/BypassState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/AcknowledgeState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/NavigationPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/Borders.bmgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/TemperatureTendency.bmgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/CheckBox.bmgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/HeatingMode.bmgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/OutOfHome.bmgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/OkNotOk.bmgrp \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/AlarmStateNew.bmgrp 

PAGE_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_HS_OVERVIEW.page \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_HS_CFG.page \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_POWERUP.page \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_IS_OVERVIEW.page \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_HS_DIAG.page \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_BMS_CFG.page \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_SCREEN_CLEAN.page \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_IS_CFG.page \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_ALARM.page \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_SDM.page 

LAYER_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Layers/Global.layer 

VCS_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/StyleSheets/Gray.vcs \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/StyleSheets/Color.vcs 

BDR_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Raised.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Sunken.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Etched.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Bump.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/SunkenOuter.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/RaisedInner.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Flat_black.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Flat_grey.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/BackwardActive.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/BackwardPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ControlActive.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ControlPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/DownActiveControl.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/DownPressedControl.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ForwardActive.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ForwardPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/GlobalAreaActive.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/GlobalAreaPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/MultiScrollDownActive.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/MultiScrollDownPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/MultiScrollUpActive.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/MultiScrollUpPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ProgressBarBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollDownActive.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollDownPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollUpActive.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollUpPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollLeftActive.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollLeftPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollRightActive.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollRightPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/UpActiveControl.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/UpPressedControl.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/FrameHeader.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Flat_orange.bdr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Flat_greyDark.bdr 

TPR_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TouchPads/NumPad.tpr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TouchPads/AlphaPadQVGA.tpr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TouchPads/AlphaPad.tpr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TouchPads/NavigationPad_ver.tpr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TouchPads/NavigationPad_hor.tpr \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TouchPads/EditPad.tpr 

TDC_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendData.tdc 

TRD_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataYearTempHigh1.trd \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataYearTempLow1.trd \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataYearHeat1.trd \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataYearHeat2.trd \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataDayTempToday.trd \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataDayTempYesterday.trd \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataYearTempHigh2.trd \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataYearTempLow2.trd \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendData_Y.trd \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendData_e.trd 

TRE_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendYearTemp.tre \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendYearHeat.tre \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDayTemp.tre \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendClosedLoop.tre 

CLM_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/ColorMaps/OnOff.clm \
	$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/ColorMaps/Water.clm 

VCVK_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/VirtualKeys.vcvk 

VCR_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Palette.vcr 

# Hardware sources
PANEL_HW_OBJECT_MainHM=$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/MainHM/dis.Hardware.vco
PANEL_HW_SOURCE_MainHM=Z:/Hauslleittechnik/Projekt/PP400/bms/Physical/Simulation/Hardware.hc Z:/Hauslleittechnik/Projekt/PP400/bms/Physical/Simulation/PLC1/ArConfig.rtc Z:/Hauslleittechnik/Projekt/PP400/bms/Physical/Simulation/PLC1/Visual.vcm
DIS_OBJECTS_MainHM=$(PANEL_HW_OBJECT_MainHM) $(KEYMAP_OBJECTS_MainHM)
# Runtime Object sources
VCR_OBJECT_MainHM=$(TEMP_PATH_MainHM)/vcrt.vco
VCR_SOURCE_MainHM=$(SRC_PATH_MainHM)/package.vcp
# All Source Objects END


# Pages
PAGE_OBJECTS_MainHM = $(addprefix $(TEMP_PATH_MainHM)/page., $(notdir $(PAGE_SOURCES_MainHM:.page=.vco)))

$(TEMP_PATH_MainHM)/page.PAGE_HS_OVERVIEW.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_HS_OVERVIEW.page
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_MainHM)/StyleSheets/Color.vcs' -p MainHM


$(TEMP_PATH_MainHM)/page.PAGE_HS_CFG.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_HS_CFG.page
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_MainHM)/StyleSheets/Color.vcs' -p MainHM


$(TEMP_PATH_MainHM)/page.PAGE_POWERUP.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_POWERUP.page
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_MainHM)/StyleSheets/Color.vcs' -p MainHM


$(TEMP_PATH_MainHM)/page.PAGE_IS_OVERVIEW.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_IS_OVERVIEW.page
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_MainHM)/StyleSheets/Color.vcs' -p MainHM


$(TEMP_PATH_MainHM)/page.PAGE_HS_DIAG.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_HS_DIAG.page
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_MainHM)/StyleSheets/Color.vcs' -p MainHM


$(TEMP_PATH_MainHM)/page.PAGE_BMS_CFG.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_BMS_CFG.page
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_MainHM)/StyleSheets/Color.vcs' -p MainHM


$(TEMP_PATH_MainHM)/page.PAGE_SCREEN_CLEAN.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_SCREEN_CLEAN.page
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_MainHM)/StyleSheets/Color.vcs' -p MainHM


$(TEMP_PATH_MainHM)/page.PAGE_IS_CFG.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_IS_CFG.page
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_MainHM)/StyleSheets/Color.vcs' -p MainHM


$(TEMP_PATH_MainHM)/page.PAGE_ALARM.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_ALARM.page
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_MainHM)/StyleSheets/Color.vcs' -p MainHM


$(TEMP_PATH_MainHM)/page.PAGE_SDM.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Pages/PAGE_SDM.page
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_MainHM)/StyleSheets/Color.vcs' -p MainHM


#Pages END




# Stylesheets
VCS_OBJECTS_MainHM = $(addprefix $(TEMP_PATH_MainHM)/vcs., $(notdir $(VCS_SOURCES_MainHM:.vcs=.vco)))

$(TEMP_PATH_MainHM)/vcs.Gray.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/StyleSheets/Gray.vcs
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -P '$(AS_PROJECT_PATH)' -ds $(DEFAULT_STYLE_SHEET_MainHM) -p MainHM


$(TEMP_PATH_MainHM)/vcs.Color.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/StyleSheets/Color.vcs
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -P '$(AS_PROJECT_PATH)' -ds $(DEFAULT_STYLE_SHEET_MainHM) -p MainHM


#Stylesheets END




# Layers
LAYER_OBJECTS_MainHM = $(addprefix $(TEMP_PATH_MainHM)/layer., $(notdir $(LAYER_SOURCES_MainHM:.layer=.vco)))

$(TEMP_PATH_MainHM)/layer.Global.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Layers/Global.layer
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -ds $(DEFAULT_STYLE_SHEET_MainHM) -p MainHM


#Layers END




# Virtual Keys
VCVK_OBJECTS_MainHM = $(addprefix $(TEMP_PATH_MainHM)/vcvk., $(notdir $(VCVK_SOURCES_MainHM:.vcvk=.vco)))

$(TEMP_PATH_MainHM)/vcvk.VirtualKeys.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/VirtualKeys.vcvk
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM

$(VCVK_OBJECTS_MainHM): $(VC_LANGUAGES_MainHM)

#Virtual Keys END




# Touch Pads
TPR_OBJECTS_MainHM = $(addprefix $(TEMP_PATH_MainHM)/tpr., $(notdir $(TPR_SOURCES_MainHM:.tpr=.vco)))

$(TEMP_PATH_MainHM)/tpr.NumPad.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TouchPads/NumPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -prj 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/MainStation/MainHMI' -p MainHM


$(TEMP_PATH_MainHM)/tpr.AlphaPadQVGA.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TouchPads/AlphaPadQVGA.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -prj 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/MainStation/MainHMI' -p MainHM


$(TEMP_PATH_MainHM)/tpr.AlphaPad.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TouchPads/AlphaPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -prj 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/MainStation/MainHMI' -p MainHM


$(TEMP_PATH_MainHM)/tpr.NavigationPad_ver.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TouchPads/NavigationPad_ver.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -prj 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/MainStation/MainHMI' -p MainHM


$(TEMP_PATH_MainHM)/tpr.NavigationPad_hor.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TouchPads/NavigationPad_hor.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -prj 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/MainStation/MainHMI' -p MainHM


$(TEMP_PATH_MainHM)/tpr.EditPad.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TouchPads/EditPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM) -prj 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/MainStation/MainHMI' -p MainHM


#Touch Pads END




# Text Groups
TXTGRP_OBJECTS_MainHM = $(addprefix $(TEMP_PATH_MainHM)/txtgrp., $(notdir $(TXTGRP_SOURCES_MainHM:.txtgrp=.vco)))

$(TEMP_PATH_MainHM)/txtgrp.HeaderGroup.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TextGroups/HeaderGroup.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/txtgrp.OnOff.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TextGroups/OnOff.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/txtgrp.SummerWinter.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TextGroups/SummerWinter.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/txtgrp.ActiveInactive.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TextGroups/ActiveInactive.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/txtgrp.RecipeFileNames.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TextGroups/RecipeFileNames.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/txtgrp.WebFiles.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/TextGroups/WebFiles.txtgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


#Text Groups END




# BitmapGroups
BMGRP_OBJECTS_MainHM = $(addprefix $(TEMP_PATH_MainHM)/bmgrp., $(notdir $(BMGRP_SOURCES_MainHM:.bmgrp=.vco)))

$(TEMP_PATH_MainHM)/bmgrp.AlphaPadQVGA.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/AlphaPadQVGA.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bmgrp.NumPad.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/NumPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bmgrp.AlphaPad.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/AlphaPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bmgrp.AlarmEvent.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/AlarmEvent.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bmgrp.AlarmState.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/AlarmState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bmgrp.BypassState.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/BypassState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bmgrp.AcknowledgeState.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/AcknowledgeState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bmgrp.NavigationPad.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/NavigationPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bmgrp.Borders.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/Borders.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bmgrp.TemperatureTendency.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/TemperatureTendency.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bmgrp.CheckBox.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/CheckBox.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bmgrp.HeatingMode.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/HeatingMode.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bmgrp.OutOfHome.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/OutOfHome.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bmgrp.OkNotOk.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/OkNotOk.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bmgrp.AlarmStateNew.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/BitmapGroups/AlarmStateNew.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


#BitmapGroups END




# Bitmaps
BMINFO_OBJECTS_MainHM = $(addprefix $(TEMP_PATH_MainHM)/bminfo., $(notdir $(BMINFO_SOURCES_MainHM:.bminfo=.vco)))

$(TEMP_PATH_MainHM)/bminfo.AlphaPadQVGA1.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA1.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlphaPadQVGA2.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA2.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA2.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlphaPadQVGA3.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA3.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA3.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlphaPadVGA_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadVGA_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadVGA_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlphaPadQVGA2_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA2_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA2_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlphaPadQVGA3_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA3_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA3_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlphaPadQVGA1_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA1_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadQVGA1_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlphaPadVGA.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadVGA.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlphaPadVGA.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.NumPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/NumPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/NumPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.NumPad.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/NumPad.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/NumPad.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AcknowledgeReset.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AcknowledgeReset.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AcknowledgeReset.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlarmActive.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmActive.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmActive.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlarmBypassOFF.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmBypassOFF.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmBypassOFF.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlarmBypassON.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmBypassON.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmBypassON.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlarmInactive.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmInactive.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmInactive.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlarmLatched.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmLatched.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmLatched.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlarmNotQuit.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmNotQuit.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmNotQuit.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlarmQuit.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmQuit.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmQuit.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Reset.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Reset.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Reset.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.ResetAcknowledge.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ResetAcknowledge.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ResetAcknowledge.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Triggered.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Triggered.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Triggered.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.ListPadHor.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ListPadHor.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ListPadHor.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.ListPadHor_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ListPadHor_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ListPadHor_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.ListPadVer.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ListPadVer.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ListPadVer.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.ListPadVer_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ListPadVer_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ListPadVer_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.backward_active.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/backward_active.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/backward_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.backward_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/backward_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/backward_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.global_area_active.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/global_area_active.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/global_area_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.global_area_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/global_area_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/global_area_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.forward_active.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/forward_active.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/forward_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.forward_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/forward_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/forward_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.control_button_active.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/control_button_active.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/control_button_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.control_button_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/control_button_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/control_button_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.right_active.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/right_active.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/right_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.right_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/right_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/right_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.left_active.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/left_active.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/left_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.left_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/left_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/left_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.up_active.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/up_active.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/up_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.up_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/up_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.down_active.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/down_active.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/down_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.down_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/down_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.multi_up_active.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/multi_up_active.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/multi_up_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.multi_up_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/multi_up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/multi_up_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.multi_down_active.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/multi_down_active.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/multi_down_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.multi_down_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/multi_down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/multi_down_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.ProgressBorder.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ProgressBorder.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ProgressBorder.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.down_active_control.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/down_active_control.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/down_active_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.down_pressed_control.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/down_pressed_control.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/down_pressed_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.up_active_control.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/up_active_control.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/up_active_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.global_area_gradient_upside.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/global_area_gradient_upside.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/global_area_gradient_upside.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.global_area_gradient_downside.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/global_area_gradient_downside.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/global_area_gradient_downside.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.frame_header.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/frame_header.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/frame_header.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.up_pressed_control.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/up_pressed_control.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/up_pressed_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.EditPadVGA.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/EditPadVGA.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/EditPadVGA.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.EditPadVGA_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/EditPadVGA_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/EditPadVGA_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneNumPad_released.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneNumPad_released.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneNumPad_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneListPadVer_released.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneListPadVer_released.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneListPadVer_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneAlphaPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneAlphaPad_released.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPad_released.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPad_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneAlphaPadQVGA1_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPadQVGA1_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPadQVGA1_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneAlphaPadQVGA1_released.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPadQVGA1_released.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPadQVGA1_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneAlphaPadQVGA2_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPadQVGA2_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPadQVGA2_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneAlphaPadQVGA3_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPadQVGA3_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneAlphaPadQVGA3_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneEditpadQVGA2_released.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneEditpadQVGA2_released.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneEditpadQVGA2_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneEditPadQVGA3_released.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneEditPadQVGA3_released.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneEditPadQVGA3_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneEditPadVga_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneEditPadVga_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneEditPadVga_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneEditPadVga_released.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneEditPadVga_released.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneEditPadVga_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneListPadHor_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneListPadHor_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneListPadHor_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneListPadHor_released.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneListPadHor_released.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneListPadHor_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneListPadVer_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneListPadVer_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneListPadVer_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.zuneNumPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneNumPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/zuneNumPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.GLOBAL_BAR_TOP.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/GLOBAL_BAR_TOP.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/GLOBAL_BAR_TOP.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.GLOBAL_BAR_BOTTOM.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/GLOBAL_BAR_BOTTOM.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/GLOBAL_BAR_BOTTOM.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.TempUp_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/TempUp_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/TempUp_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.TempDown_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/TempDown_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/TempDown_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.TempSteady_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/TempSteady_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/TempSteady_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.CONTROL_CHECKBOX_ON.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/CONTROL_CHECKBOX_ON.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/CONTROL_CHECKBOX_ON.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.CONTROL_CHECKBOX_OFF.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/CONTROL_CHECKBOX_OFF.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/CONTROL_CHECKBOX_OFF.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Fire_orig.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_orig.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_orig.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.TempTrend_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/TempTrend_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/TempTrend_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Fire_cfg_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_cfg_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_cfg_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Cfg_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Cfg_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Cfg_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Fire_32.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_32.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Fire_32_bw.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_32_bw.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_32_bw.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Fire_bw_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_bw_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_bw_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Fire_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Fire_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Down_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Down_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Down_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Minus_32.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Minus_32.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Minus_32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Minus_orig.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Minus_orig.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Minus_orig.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Plus_32.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Plus_32.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Plus_32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Plus_orig.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Plus_orig.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Plus_orig.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Up_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Up_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Up_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.exit_32.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/exit_32.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/exit_32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.exit_32_bw.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/exit_32_bw.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/exit_32_bw.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.exit_orig.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/exit_orig.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/exit_orig.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.disk_32.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/disk_32.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/disk_32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.disk_orig.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/disk_orig.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/disk_orig.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.folder_32.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/folder_32.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/folder_32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.folder_orig.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/folder_orig.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/folder_orig.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.water_drop_32.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/water_drop_32.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/water_drop_32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.water_drop_orig.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/water_drop_orig.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/water_drop_orig.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.water_drop_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/water_drop_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/water_drop_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.analyze_orig.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/analyze_orig.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/analyze_orig.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Stethoscope_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Stethoscope_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Stethoscope_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.Stethoscope_orig.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Stethoscope_orig.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/Stethoscope_orig.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.analyze_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/analyze_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/analyze_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.ok_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ok_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/ok_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.not_ok_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/not_ok_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/not_ok_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.blank24_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/blank24_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/blank24_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.set_time_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/set_time_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/set_time_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.display_cal_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/display_cal_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/display_cal_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.bms_topology.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/bms_topology.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/bms_topology.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.screen_cleaner_orig.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/screen_cleaner_orig.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/screen_cleaner_orig.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.screen_cleaner_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/screen_cleaner_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/screen_cleaner_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.folder_24.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/folder_24.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/folder_24.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.disk_24.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/disk_24.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/disk_24.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.water_cfg_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/water_cfg_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/water_cfg_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.bms_cfg_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/bms_cfg_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/bms_cfg_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.warning_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/warning_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/warning_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.fire_diag_ico.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/fire_diag_ico.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/fire_diag_ico.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.hls.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/hls.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/hls.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlarmInactiveNew.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmInactiveNew.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmInactiveNew.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.AlarmActiveNew.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmActiveNew.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/AlarmActiveNew.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/bminfo.hls_logo.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/hls_logo.bminfo $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Bitmaps/hls_logo.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


#Bitmaps END




# Trend Configuration
TRE_OBJECTS_MainHM = $(addprefix $(TEMP_PATH_MainHM)/tre., $(notdir $(TRE_SOURCES_MainHM:.tre=.vco)))

$(TEMP_PATH_MainHM)/tre.TrendYearTemp.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendYearTemp.tre
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/tre.TrendYearHeat.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendYearHeat.tre
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/tre.TrendDayTemp.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDayTemp.tre
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/tre.TrendClosedLoop.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendClosedLoop.tre
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


#Trend Configuration END




# Trend Data
TRD_OBJECTS_MainHM = $(addprefix $(TEMP_PATH_MainHM)/trd., $(notdir $(TRD_SOURCES_MainHM:.trd=.vco)))

$(TEMP_PATH_MainHM)/trd.TrendDataYearTempHigh1.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataYearTempHigh1.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/trd.TrendDataYearTempLow1.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataYearTempLow1.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/trd.TrendDataYearHeat1.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataYearHeat1.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/trd.TrendDataYearHeat2.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataYearHeat2.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/trd.TrendDataDayTempToday.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataDayTempToday.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/trd.TrendDataDayTempYesterday.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataDayTempYesterday.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/trd.TrendDataYearTempHigh2.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataYearTempHigh2.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/trd.TrendDataYearTempLow2.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendDataYearTempLow2.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/trd.TrendData_Y.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendData_Y.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/trd.TrendData_e.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendData_e.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


#Trend Data END




# Trend Data Configuration
TDC_OBJECTS_MainHM = $(addprefix $(TEMP_PATH_MainHM)/tdc., $(notdir $(TDC_SOURCES_MainHM:.tdc=.vco)))

$(TEMP_PATH_MainHM)/tdc.TrendData.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Trends/TrendData.tdc
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


#Trend Data Configuration END




# ColorMap Table
CLM_OBJECTS_MainHM = $(addprefix $(TEMP_PATH_MainHM)/clm., $(notdir $(CLM_SOURCES_MainHM:.clm=.vco)))

$(TEMP_PATH_MainHM)/clm.OnOff.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/ColorMaps/OnOff.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


$(TEMP_PATH_MainHM)/clm.Water.vco: $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/ColorMaps/Water.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_MainHM)' $(VCCFLAGS_MainHM)  -p MainHM


#ColorMap Table END


#
# Borders
#
BDR_SOURCES_MainHM=$(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Raised.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Sunken.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Etched.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Bump.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/SunkenOuter.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/RaisedInner.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Flat_black.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Flat_grey.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/BackwardActive.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/BackwardPressed.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ControlActive.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ControlPressed.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/DownActiveControl.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/DownPressedControl.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ForwardActive.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ForwardPressed.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/GlobalAreaActive.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/GlobalAreaPressed.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/MultiScrollDownActive.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/MultiScrollDownPressed.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/MultiScrollUpActive.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/MultiScrollUpPressed.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ProgressBarBorder.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollDownActive.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollDownPressed.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollUpActive.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollUpPressed.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollLeftActive.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollLeftPressed.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollRightActive.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/ScrollRightPressed.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/UpActiveControl.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/UpPressedControl.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/FrameHeader.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Flat_orange.bdr $(AS_PROJECT_PATH)/Logical/MainStation/MainHMI/Borders/Flat_greyDark.bdr 
BDR_OBJECTS_MainHM=$(TEMP_PATH_MainHM)/bdr.Bordermanager.vco
$(TEMP_PATH_MainHM)/bdr.Bordermanager.vco: $(BDR_SOURCES_MainHM)
	$(VCC) -f '$<' -o '$@' -pkg '$(SRC_PATH_MainHM)' $(BDRFLAGS_MainHM) $(VCCFLAGS_MainHM) -p MainHM
#
# Logical fonts
#
$(TEMP_PATH_MainHM)/lfnt.de.vco: $(TEMP_PATH_MainHM)/de.lfnt
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_MainHM) $(VCCFLAGS_MainHM) -p MainHM
LFNT_OBJECTS_MainHM=$(TEMP_PATH_MainHM)/lfnt.de.vco 
#Panel Hardware
$(PANEL_HW_OBJECT_MainHM): $(PANEL_HW_SOURCE_MainHM) $(PALFILE_MainHM) $(VC_LIBRARY_LIST_MainHM) $(KEYMAP_SOURCES_MainHM)
	$(VCHWPP) -f '$<' -o '$(subst .vco,.vci,$@)' -n MainHMI -d MainHM -m '$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Visual.vcm' -pal '$(PALFILE_MainHM)' -c '$(AS_CONFIGURATION)' -p '$(AS_PLC)' -B V3.00.0 -L '' -verbose 'False' -profile 'False' -hw '$(CPUHWC)' -warninglevel 2
	$(VCC) -f '$(subst .vco,.vci,$@)' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -k '$(VCVK_SOURCES_MainHM)' $(VCCFLAGS_MainHM) -p MainHM

#Runtime Object
$(VCR_OBJECT_MainHM) : $(VCR_SOURCE_MainHM)
	$(VCC) -f '$<' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -sl de $(VCCFLAGS_MainHM) -rt  -p MainHM
# Local resources Library rules
LIB_LOCAL_RES_MainHM=$(TEMP_PATH_MainHM)/localres.vca
$(LIB_LOCAL_RES_MainHM) : $(TEMP_PATH_MainHM)/MainHM02.ccf

# Bitmap Library rules
LIB_BMP_RES_MainHM=$(TEMP_PATH_MainHM)/bmpres.vca
$(LIB_BMP_RES_MainHM) : $(TEMP_PATH_MainHM)/MainHM03.ccf
$(BMGRP_OBJECTS_MainHM) : $(PALFILE_MainHM) $(VC_LANGUAGES_MainHM)
$(BMINFO_OBJECTS_MainHM) : $(PALFILE_MainHM)

BUILD_FILE_MainHM=$(TEMP_PATH_MainHM)/BuildFiles.arg
$(BUILD_FILE_MainHM) : BUILD_FILE_CLEAN_MainHM $(BUILD_SOURCES_MainHM)
BUILD_FILE_CLEAN_MainHM:
	$(RM) /F /Q $(BUILD_FILE_MainHM) 2>nul
#All Modules depending to this project
PROJECT_MODULES_MainHM=$(AS_CPU_PATH)/MainHM01.br $(AS_CPU_PATH)/MainHM02.br $(AS_CPU_PATH)/MainHM03.br $(FONT_MODULES_MainHM) $(SHARED_MODULE)

# General Build rules

$(TARGET_FILE_MainHM): $(PROJECT_MODULES_MainHM) $(TEMP_PATH_MainHM)/MainHM.prj
	$(MODGEN) -m $(VCSTPOST) -v V1.00.0 -f '$(TEMP_PATH_MainHM)/MainHM.prj' -o '$@' $(DEPENDENCIES_MainHM) $(addprefix -d ,$(notdir $(PROJECT_MODULES_MainHM:.br=)))

$(AS_CPU_PATH)/MainHM01.br: $(TEMP_PATH_MainHM)/MainHM01.ccf
	$(MODGEN) -m $(VCSTARTUP) -v V1.00.0 -f '$<' -o '$@' $(DEPENDENCIES_MainHM)

$(AS_CPU_PATH)/MainHM02.br: $(TEMP_PATH_MainHM)/MainHM02.ccf
	$(MODGEN) -m $(VCSTARTUP) -v V1.00.0 -f '$<' -o '$@' $(DEPENDENCIES_MainHM)

$(AS_CPU_PATH)/MainHM03.br: $(TEMP_PATH_MainHM)/MainHM03.ccf
	$(MODGEN) -m $(VCSTARTUP) -v V1.00.0 -f '$<' -o '$@' $(DEPENDENCIES_MainHM)

# General Build rules END
$(LIB_LOCAL_OBJ_MainHM) : $(TEMP_PATH_MainHM)/MainHM01.ccf

# Main Module
$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/MainHM.vcm:
$(TEMP_PATH_MainHM)/MainHM.prj: $(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/MainHM.vcm
	$(VCDEP) -m '$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/MainHM.vcm' -s '$(AS_CPU_PATH)/VCShared/Shared.vcm' -p '$(AS_PATH)/AS/VC/Firmware' -c '$(AS_CPU_PATH)' -o MainHM -proj MainHM -fw '$(VCFIRMWAREPATH)' -hw '$(CPUHWC)'
	$(VCPL) $(notdir $(PROJECT_MODULES_MainHM:.br=,4)) MainHM,2 -o '$@' -p MainHM -vc 'MainHM' -verbose 'False' -fl '$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/MainHM.vcm' -vcr '$(VCR_SOURCE_MainHM)' -prj '$(AS_PROJECT_PATH)' -warningLevel2
	$(VCREFHANDLER) -X 'Z:/Hauslleittechnik/Projekt/PP400/bms/Temp/Objects/Simulation/PLC1/vcxref.build' -o '$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/' -verbose 'False' -profile 'False' -ds '$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/dpt.DataPointList.vcxref' -warninglevel 2
	$(VCXREFEXTENDER) '$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/MainHM/MainHM.xrefvc' -o '$(TEMP_PATH_ROOT_MainHM)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/MainHM.xref' -P '$(AS_PROJECT_PATH)/' -c '$(AS_CONFIGURATION)' -S '$(AS_PLC)' -t '$(AS_TEMP_PATH)' 

# 01 Module

DEL_TARGET01_LFL=Z:\Hauslleittechnik\Projekt\PP400\bms\Temp\Objects\Simulation\PLC1\MainHM\MainHM01.ccf.lfl
$(TEMP_PATH_MainHM)/MainHM01.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_MainHM) $(TEMP_PATH_MainHM)/MainHM03.ccf $(LIB_LOCAL_RES_MainHM) $(TEMP_PATH_MainHM)/MainHM02.ccf $(PAGE_OBJECTS_MainHM) $(VCS_OBJECTS_MainHM) $(VCVK_OBJECTS_MainHM) $(DIS_OBJECTS_MainHM) $(VCRT_OBJECTS_MainHM) $(TPR_OBJECTS_MainHM) $(TXTGRP_OBJECTS_MainHM) $(LAYER_OBJECTS_MainHM) $(VCR_OBJECT_MainHM) $(TDC_OBJECTS_MainHM) $(TRD_OBJECTS_MainHM) $(TRE_OBJECTS_MainHM)
	-@CMD if exist /Q "$(DEL_TARGET01_LFL)" /C DEL /F /Q "$(DEL_TARGET01_LFL)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)'
	@$(VCFLGEN) '$@.lfl' '$(LIB_BMP_RES_MainHM)'
	@$(VCFLGEN) '$@.lfl' '$(LIB_LOCAL_RES_MainHM)'
	@$(VCFLGEN) '$@.lfl' -mask .page -vcp 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/MainStation/MainHMI/Package.vcp' -temp '$(TEMP_PATH_MainHM)'
	@$(VCFLGEN) '$@.lfl' '$(VCS_OBJECTS_MainHM:.vco=.vco,)'
	@$(VCFLGEN) '$@.lfl' -mask .vcvk -vcp 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/MainStation/MainHMI/Package.vcp' -temp '$(TEMP_PATH_MainHM)'
	@$(VCFLGEN) '$@.lfl' '$(DIS_OBJECTS_MainHM:.vco=.vco,)'
	@$(VCFLGEN) '$@.lfl' '$(VCRT_OBJECTS_MainHM:.vco=.vco,)'
	@$(VCFLGEN) '$@.lfl' '$(TPR_OBJECTS_MainHM:.vco=.vco,)'
	@$(VCFLGEN) '$@.lfl' -mask .txtgrp -vcp 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/MainStation/MainHMI/Package.vcp' -temp '$(TEMP_PATH_MainHM)'
	@$(VCFLGEN) '$@.lfl' -mask .layer -vcp 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/MainStation/MainHMI/Package.vcp' -temp '$(TEMP_PATH_MainHM)'
	@$(VCFLGEN) '$@.lfl' '$(VCR_OBJECT_MainHM:.vco=.vco,)'
	@$(VCFLGEN) '$@.lfl' -mask .tdc -vcp 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/MainStation/MainHMI/Package.vcp' -temp '$(TEMP_PATH_MainHM)'
	@$(VCFLGEN) '$@.lfl' -mask .trd -vcp 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/MainStation/MainHMI/Package.vcp' -temp '$(TEMP_PATH_MainHM)'
	@$(VCFLGEN) '$@.lfl' '$(TRE_OBJECTS_MainHM:.vco=.vco,)'
	$(LINK) '$@.lfl' -o '$@' -p MainHM -lib '$(LIB_LOCAL_OBJ_MainHM)' -P '$(AS_PROJECT_PATH)' -m 'local objects' -profile 'False' -warningLevel2
# 01 Module END

# 02 Module

DEL_TARGET02_LFL=Z:\Hauslleittechnik\Projekt\PP400\bms\Temp\Objects\Simulation\PLC1\MainHM\MainHM02.ccf.lfl
$(TEMP_PATH_MainHM)/MainHM02.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_MainHM) $(TEMP_PATH_MainHM)/MainHM03.ccf $(BDR_OBJECTS_MainHM) $(LFNT_OBJECTS_MainHM) $(CLM_OBJECTS_MainHM)
	-@CMD if exist /Q "$(DEL_TARGET02_LFL)" /C DEL /F /Q "$(DEL_TARGET02_LFL)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)'
	@$(VCFLGEN) '$@.lfl' '$(LIB_BMP_RES_MainHM)'
	@$(VCFLGEN) '$@.lfl' '$(BDR_OBJECTS_MainHM:.vco=.vco,)'
	@$(VCFLGEN) '$@.lfl' '$(LFNT_OBJECTS_MainHM:.vco=.vco,)'
	@$(VCFLGEN) '$@.lfl' '$(CLM_OBJECTS_MainHM:.vco=.vco,)'
	$(LINK) '$@.lfl' -o '$@' -p MainHM -lib '$(LIB_LOCAL_RES_MainHM)' -P '$(AS_PROJECT_PATH)' -m 'local resources' -profile 'False' -warningLevel2
# 02 Module END

# 03 Module

DEL_TARGET03_LFL=Z:\Hauslleittechnik\Projekt\PP400\bms\Temp\Objects\Simulation\PLC1\MainHM\MainHM03.ccf.lfl
$(TEMP_PATH_MainHM)/MainHM03.ccf: $(LIB_SHARED) $(SHARED_CCF) $(BMGRP_OBJECTS_MainHM) $(BMINFO_OBJECTS_MainHM) $(PALFILE_MainHM)
	-@CMD if exist /Q "$(DEL_TARGET03_LFL)" /C DEL /F /Q "$(DEL_TARGET03_LFL)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)'
	@$(VCFLGEN) '$@.lfl' -mask .bmgrp -vcp 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/MainStation/MainHMI/Package.vcp' -temp '$(TEMP_PATH_MainHM)'
	@$(VCFLGEN) '$@.lfl' -mask .bminfo -vcp 'Z:/Hauslleittechnik/Projekt/PP400/bms/Logical/MainStation/MainHMI/Package.vcp' -temp '$(TEMP_PATH_MainHM)'
	$(LINK) '$@.lfl' -o '$@' -p MainHM -lib '$(LIB_BMP_RES_MainHM)' -P '$(AS_PROJECT_PATH)' -m 'bitmap resources' -profile 'False' -warningLevel2
# 03 Module END

# Post Build Steps

.PHONY : vcPostBuild_MainHM

vcPostBuild_MainHM :
	$(VCC) -pb -vcm '$(TEMP_PATH_MainHM)/MODULEFILES.vcm' -fw '$(VCFIRMWAREPATHPOSTBUILD)' $(VCCFLAGS_MainHM) -p MainHM

# Post Build Steps END
