program NarseoUpdate;

uses
  SysUtils,
  Vcl.Forms,
  unSystemUpdate in '..\pas\update\unSystemUpdate.pas' {frmSystemUpdate},
  unParametros in '..\pas\parametros\unParametros.pas' {Parametros: TDataModule},
  unEndereco in '..\lib\unEndereco.pas',
  unFields in '..\lib\unFields.pas',
  unNetwork in '..\lib\unNetwork.pas',
  unSQL in '..\lib\unSQL.pas',
  unSystem in '..\lib\unSystem.pas',
  unMaster in '..\pas\essenciais\unMaster.pas' {FMaster};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSystemUpdate, frmSystemUpdate);
  Application.CreateForm(TParametros, Parametros);
  begin
    // Grava o caminho do Sistema e Parametros
    Parametros.SystemConfig.ASSystemPath:= ExtractFileDir(Application.ExeName);
  end;
  Application.Run;
end.
