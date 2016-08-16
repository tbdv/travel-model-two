rem this file has environment variables for CT-RAMP batch files

:: The location of the 64-bit java development kit
set JAVA_PATH=C:\Program Files\Java\jdk1.7.0_71

:: The location of the RUNTPP executable from Citilabs
set TPP_PATH=C:\Program Files (x86)\Citilabs\CubeVoyager

:: The location of the Cube executable from Citilabs
set CUBE_PATH=C:\Program Files (x86)\Citilabs\Cube

:: The location of the Python executable
set PYTHON_PATH=C:\Python27

:: The location of the main JAR file
set RUNTIME=CTRAMP/runtime

rem set ports
set JAVA_32_PORT=1190
set MATRIX_MANAGER_PORT=1191
set HH_MANAGER_PORT=1129

rem set machine names
SET MAIN=W-AMPDX-D-SAG03
rem SET MTC01=W-AMPDX-D-SAG01
SET MTC02=W-AMPDX-D-SAG01
rem SET MTC03=W-AMPDX-D-SAG10

rem SET node_runner_MAIN=runMtc04
rem SET node_runner_MTC01=runMtc01
SET node_runner_MTC02=runMtc02
rem set IP addresses
:: get the ipaddress of this machine
FOR /F "TOKENS=1* DELIMS= " %%A IN ('IPCONFIG') DO (
  IF "%%A"=="IPv4" SET IP=%%B
)
FOR %%A IN (%IP%) DO SET IPADDRESS=%%A

::  Set the IP address of the host machine which sends tasks to the client machines 
::set HOST_IP_ADDRESS=10.70.192.64
SET HOST_IP_ADDRESS=%IPADDRESS%

set HHMGR_IP=10.56.89.1

:: Machine running matrix data manager
SET MATRIX_SERVER=\\%MTC02%
SET MATRIX_SERVER_BASE_DIR=%MATRIX_SERVER%\c$\projects\mtc\%SCEN%
SET MATRIX_SERVER_ABSOLUTE_BASE_DIR=c:\projects\mtc\%SCEN%
SET MATRIX_SERVER_JAVA_PATH=C:\Program Files\Java\jdk1.7.0_71

:: Machine running household data manager
SET HH_SERVER=\\%MTC02%
SET HH_SERVER_BASE_DIR=%HH_SERVER%\c$\projects\mtc\%SCEN%
SET HH_SERVER_ABSOLUTE_BASE_DIR=c:\projects\mtc\%SCEN%
SET HH_SERVER_JAVA_PATH=C:\Program Files\Java\jdk1.7.0_71

rem set main property file name
set PROPERTIES_NAME=sandag_abm

rem all nodes need to map the scenario drive, currently mapped as Q:
set MAPDRIVE=R:
rem uncomment next line if use T drive as data folder.  
rem !!!Note: much slower than a local data folder!!!
set MAPDRIVEFOLDER=\\%MAIN%\projects\mtc\%SCEN%

rem location of mapThenRun.bat on remote machines
set MAPANDRUN=CTRAMP\runtime\mapThenRunNew.bat

rem account settings for remote access using psexec
SET USERNAME=redacted
SET PASSWORD=redacted
