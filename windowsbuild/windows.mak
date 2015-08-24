#	Build MSI packages
MSB=%ProgramFiles(x86)%\MSBuild\14.0\Bin\amd64\msbuild
WIX_LINK = light.exe -ext WixUIExtension -ext WixUtilExtension -dWixUILicenseRtf=..\doc\groestlcoin_lic.rtf

all : ..\GroestlcoinArmory_x64.msi	# ..\GroestlcoinArmory_x86.msi

..\qrc_img_resources.py: ..\imgList.xml
	C:\Python\27_x64\Lib\site-packages\PyQt4\pyrcc4.exe -o $@ $<

..\x86_R_St\_CppBlockUtils.pyd : ..\cppForSwig\BlockUtils.cpp
	$(MSB) ..\GroestlcoinArmory.sln /p:Configuration=R_St,Platform=x86 /v:n

..\x64_R_St\_CppBlockUtils.pyd : ..\cppForSwig\BlockUtils.cpp
	$(MSB) ..\GroestlcoinArmory.sln /p:Configuration=R_St,Platform=x64 /v:n


..\x86_R_St\dist\_CppBlockUtils.pyd: ..\ArmoryQt.py ..\qrc_img_resources.py ..\x86_R_St\_CppBlockUtils.pyd
	cd ..\x86_R_St
	c:\python\27_x86\python ..\setup.py py2exe
	cd ..\windowsbuild

..\GroestlcoinArmory_x86.msi : groestlcoinarmory.wxs ..\x86_R_St\dist\_CppBlockUtils.pyd
	candle.exe -o GroestlcoinArmory-x86.wixobj GroestlcoinArmory.wxs
	$(WIX_LINK)  -out $@ GroestlcoinArmory-x86.wixobj

..\x64_R_St\dist\_CppBlockUtils.pyd: ..\ArmoryQt.py ..\qrc_img_resources.py ..\x64_R_St\_CppBlockUtils.pyd
	cd ..\x64_R_St
	c:\python\27_x64\python ..\setup.py py2exe
	cd ..\windowsbuild

..\GroestlcoinArmory_x64.msi : groestlcoinarmory.wxs ..\x64_R_St\dist\_CppBlockUtils.pyd
	candle.exe -arch x64 -o GroestlcoinArmory-x64.wixobj GroestlcoinArmory.wxs
	$(WIX_LINK) -out $@ GroestlcoinArmory-x64.wixobj


