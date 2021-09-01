; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "MamiesMod V4"
#define MyAppVersion "4"
#define MyAppPublisher "nt games Company, Inc."
#define MyAppURL "http://nt-games-site.000webhostapp.com/"
#define MyAppExeName "MamiesMod V4.exe"
#define MyAppCopyright "Copyright �  2021 by nt games"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{0EEE7706-F30A-4BEE-AC5D-0C2F133BC6A9}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppCopyright={#MyAppCopyright}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=Lycense.txt
InfoBeforeFile=Before installation.txt
InfoAfterFile=After installation.txt
; Uncomment the following line to run in non administrative install mode (install for current user only.)
; PrivilegesRequired=lowest
OutputDir=MamiesMod\MamiesMod V4 Setup
OutputBaseFilename=MamiesMod V4 Setup
SetupIconFile=MamiesMod.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "setup\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
; UPDATED FILE :
Source: "{tmp}\en\MamiesMod V4.resources.dll"; DestDir: "{app}\en"; Flags: external
Source: "{tmp}\fr\MamiesMod V4.resources.dll"; DestDir: "{app}\fr"; Flags: external
Source: "{tmp}\MamiesMod V4.exe"; DestDir: "{app}"; Flags: external

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
function OnDownloadProgress(const Url, Filename: string; const Progress, ProgressMax: Int64): Boolean;
begin
  if ProgressMax <> 0 then
    Log(Format('  %d of %d bytes done.', [Progress, ProgressMax]))
  else
    Log(Format('  %d bytes done.', [Progress]));
  Result := True;
end;

function InitializeSetup: Boolean;
begin
  try
    DownloadTemporaryFile('http://nt-games-site.000webhostapp.com/img/MamiesMod%20V4/en/MamiesMod%20V4.resources.dll', 'en\MamiesMod V4.resources.dll', '', @OnDownloadProgress);
    DownloadTemporaryFile('http://nt-games-site.000webhostapp.com/img/MamiesMod%20V4/fr/MamiesMod%20V4.resources.dll', 'fr\MamiesMod V4.resources.dll', '', @OnDownloadProgress);
    DownloadTemporaryFile('http://nt-games-site.000webhostapp.com/img/MamiesMod%20V4/MamiesMod%20V4.exe', 'MamiesMod V4.exe', '', @OnDownloadProgress);
    Result := True;
  except
    Log(GetExceptionMessage);
    Result := False;
  end;
end;   


