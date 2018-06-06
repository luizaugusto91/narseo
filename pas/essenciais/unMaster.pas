unit unMaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnSystem, unFields;

type
  TFMaster = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FormSettings: TFormMode;
                  { Modo: String;
                    ID:   Integer; }
    procedure SetSettings(const Value: TFormMode);
    function  GetSettings: TFormMode;
  public
    { Public declarations }
    property Settings: TFormMode read GetSettings write SetSettings;
    procedure FocusSet(Sender:TObject);
  end;

var
  FMaster: TFMaster;

implementation

{$R *.dfm}

{ TFMaster }

procedure TFMaster.FocusSet(Sender: TObject);
  var i: Integer;
begin
  for i := 0 to ComponentCount-1 do
    begin
      InOutFocus(Components[i]);
    end;
end;

procedure TFMaster.FormActivate(Sender: TObject);
begin
  FocusSet(nil);
end;

procedure TFMaster.FormCreate(Sender: TObject);
  var i: Integer;
begin

end;

function TFMaster.GetSettings: TFormMode;
begin
  Result := FormSettings;
end;

procedure TFMaster.SetSettings(const Value: TFormMode);
begin
  FormSettings := Value;
end;

end.
