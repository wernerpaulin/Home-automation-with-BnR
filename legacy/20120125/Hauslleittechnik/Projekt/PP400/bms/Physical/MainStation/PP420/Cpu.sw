<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio Version=3.0.80.25?>
<SwConfiguration CpuAddress="SL1" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="hs_con" Source="MainStation.HeatingSystem.hs_con.prg" Memory="UserROM" Language="IEC" />
    <Task Name="ip_con" Source="MainStation.IrrigationSystem.ip_con.prg" Memory="UserROM" Language="IEC" />
    <Task Name="hmi_sup" Source="MainStation.hmi_sup.prg" Memory="UserROM" Language="IEC" />
  </TaskClass>
  <TaskClass Name="Cyclic#2">
    <Task Name="rcp_cpy" Source="MainStation.rcp_cpy.prg" Memory="UserROM" Language="IEC" />
    <Task Name="alarm" Source="MainStation.alarm.prg" Memory="UserROM" Language="IEC" />
    <Task Name="statistics" Source="MainStation.statistics.prg" Memory="UserROM" Language="IEC" />
  </TaskClass>
  <TaskClass Name="Cyclic#3" />
  <TaskClass Name="Cyclic#4" />
  <TaskClass Name="Cyclic#5" />
  <TaskClass Name="Cyclic#6" />
  <TaskClass Name="Cyclic#7" />
  <TaskClass Name="Cyclic#8" />
  <DataObjects>
    <DataObject Name="rcp_def" Source="MainStation.rcp_def.dob" Memory="UserROM" Language="Simple" />
    <DataObject Name="arsdmsvp" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="arsdmsvg" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="arsdmhtm" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="heatcurv" Source="MainStation.HeatingSystem.heatcurv.dob" Memory="UserROM" Language="Simple" />
    <DataObject Name="lin_heat" Source="MainStation.HeatingSystem.lin_heat.dob" Memory="UserROM" Language="Simple" />
    <DataObject Name="lin_in" Source="MainStation.HeatingSystem.lin_in.dob" Memory="UserROM" Language="Simple" />
    <DataObject Name="lin_out" Source="MainStation.HeatingSystem.lin_out.dob" Memory="UserROM" Language="Simple" />
    <DataObject Name="temph_10" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="bms_stat" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="templ_08" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="temph05" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="heat_03" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="temph_05" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="heat_04" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="templ_07" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="templ_09" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="temph_09" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="heat_09" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="templ_06" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="heat_10" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="temph_07" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="templ_04" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="temph_02" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="templ_05" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="heat_05" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="templ_02" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="temph_03" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="templ05" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="temph_04" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="heat_02" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="templ_03" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="heat_06" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="heat_07" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="temph_06" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="templ_10" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="temph_08" Source="" Memory="UserROM" Language="Binary" />
  </DataObjects>
  <NcDataObjects />
  <VcDataObjects>
    <VcDataObject Name="MainHM" Source="MainStation.MainHMI.dob" Memory="UserROM" Language="Vc" WarningLevel="2" Compress="false" />
  </VcDataObjects>
  <Binaries>
    <BinaryObject Name="arsdm" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="webserv" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcmgr" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccbtn" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccshape" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcbclass" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcgclass" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcfile" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccnum" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccbmp" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcfntttf" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vctcal" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcalarm" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="MainHM01" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="MainHM02" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arial" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcresman" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdsw" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccovl" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arialbd" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcchspot" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="visapi" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcshared" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="MainHM03" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcrt" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcctext" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcctrend" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcdsloc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcdsint" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcchtml" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccalarm" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcclbox" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcxml" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccurl" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccbar" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccline" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpfar00" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcnet" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="visvc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdvnc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ashwd" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="sysconf" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="arconfig" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="iomap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="asfw" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="PW3502" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="PW3501" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcinter" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ddpccan" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="aplib" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcptelo" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdpp30" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpfmtcx" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpfpp30" Source="" Memory="UserROM" Language="Binary" />
  </Binaries>
  <Libraries>
    <LibraryObject Name="DataObj" Source="Libraries.DataObj.lby" Memory="UserROM" Language="binary" />
    <LibraryObject Name="astime" Source="" Memory="UserROM" Language="Binary" />
    <LibraryObject Name="astcp" Source="" Memory="UserROM" Language="Binary" />
    <LibraryObject Name="convert" Source="" Memory="UserROM" Language="Binary" />
    <LibraryObject Name="asmem" Source="" Memory="UserROM" Language="Binary" />
    <LibraryObject Name="runtime" Source="" Memory="UserROM" Language="Binary" />
    <LibraryObject Name="sys_lib" Source="" Memory="UserROM" Language="Binary" />
    <LibraryObject Name="fileio" Source="" Memory="UserROM" Language="Binary" />
    <LibraryObject Name="bmslib" Source="Libraries.bmslib.lby" Memory="UserROM" Language="IEC" />
    <LibraryObject Name="brsystem" Source="" Memory="UserROM" Language="Binary" />
    <LibraryObject Name="loopconr" Source="" Memory="UserROM" Language="Binary" />
    <LibraryObject Name="vcscrsht" Source="" Memory="UserROM" Language="Binary" />
    <LibraryObject Name="asstring" Source="" Memory="UserROM" Language="Binary" />
    <LibraryObject Name="can_lib" Source="" Memory="UserROM" Language="Binary" />
  </Libraries>
</SwConfiguration>