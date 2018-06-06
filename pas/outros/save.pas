unit save;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmSave = class(TForm)
    pnlTOP: TPanel;
    pnlMAIN: TPanel;
    pnlBOTTOM: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    spl1: TSplitter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSave: TfrmSave;

implementation

{$R *.dfm}

end.
