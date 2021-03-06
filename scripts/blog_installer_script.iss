; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "CreatingInstaller"
#define MyAppVersion "1.0"
#define MyAppPublisher "My Company, Inc."
#define MyAppURL "http://www.example.com/"
#define Display "home, llc" 
#define ServiceDes "this is my test service"

#define outputDir = "..\..\CreatingInstaller\installer_inno\output"
#define src = "..\..\CreatingInstaller\bin\Release\netcoreapp3.1\publish\*"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{EE2209C4-EF73-4037-9BB6-12BC8BD03F90}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir={#outputDir}
OutputBaseFilename=blog_installer
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: {#src}; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Run]
Filename: "powershell.exe"; Parameters: \
  "-ExecutionPolicy Bypass -File ""{app}\scripts\install_service.ps1"" ""{#MyAppName}"" ""{app}\{#MyAppName}.exe"" ""{#MyAppName}"" ""{#ServiceDes}"""; \
  WorkingDir: {app}; Flags: runhidden
                                                                        
[UninstallRun]
Filename: "powershell.exe"; Parameters: \
  "-ExecutionPolicy Bypass -File ""{app}\scripts\uninstall_service.ps1"" ""{#MyAppName}"""; \
  WorkingDir: {app}; Flags: runhidden


