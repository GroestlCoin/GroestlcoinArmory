#	Build MSI packages

MSB=%ProgramFiles(x86)%\MSBuild\14.0\Bin\amd64\msbuild
WIX_LINK = light.exe -ext WixUIExtension -ext WixUtilExtension -dWixUILicenseRtf=doc\groestlcoin_lic.rtf

all : GroestlcoinArmory_x86.msi GroestlcoinArmory_x64.msi

GroestlcoinArmory_x86.msi : groestlcoinarmory.wxs ..\x86_R_St\groestlcoin-qt.exe
	candle.exe -o GroestlcoinArmory-x86.wixobj GroestlcoinArmory.wxs
	$(WIX_LINK)  -out $@ GroestlcoinArmory-x86.wixobj

GroestlcoinArmory_x64.msi : groestlcoinarmory.wxs ..\x64_R_St\groestlcoin-qt.exe
	candle.exe -arch x64 -o GroestlcoinArmory-x64.wixobj GroestlcoinArmory.wxs
	$(WIX_LINK) -out $@ GroestlcoinArmory-x64.wixobj


