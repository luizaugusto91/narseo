unit unNew;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, DBAccess, Uni, MemDS,
  Vcl.ImgList, cxGraphics, Vcl.StdCtrls, Vcl.ExtCtrls, unSystem, unParametros,
  unConnection, unCad, unFields,
  cxEdit, cxDBEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCheckBox, cxCalendar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxImageComboBox,
  cxData, cxDBData, cxCurrencyEdit, cxCalc;

type
  TfrmNew = class(TForm)
    pnlBotton: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Image2: TImage;
    btnCancelar: TButton;
    btnAvancar: TButton;
    ImageList16: TcxImageList;
    qConsulta: TUniQuery;
    ds: TUniDataSource;
    grpContent: TGroupBox;
    qSQL: TUniQuery;
    procedure btnCancelarClick(Sender: TObject);
    procedure grpContentEnter(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQuery;
  public
    Settings: TFormMode;
    QueryID: Integer;
    { Public declarations }
    procedure ActAvancar(InstanceClass: TComponentClass; var Reference);
    procedure ValidaCamposObrigatorios(Query: TUniQuery);
    procedure Focus;
  end;

var
  frmNew: TfrmNew;

implementation

{$R *.dfm}

procedure TfrmNew.ActAvancar(InstanceClass: TComponentClass; var Reference);
begin
  try
    Application.CreateForm(InstanceClass, Reference);
    TfrmCad(Reference).Settings.Modo := 'ALTERACAO';
    TfrmCad(Reference).Settings.ID := QueryID;
    TfrmCad(Reference).ShowModal;
  finally
    TfrmCad(Reference).Release;
    Close;
  end;
end;

procedure TfrmNew.btnAvancarClick(Sender: TObject);
begin
  ds.DataSet.FieldByName('codigo').AsInteger := QueryID;
  ds.DataSet.Post;
end;

procedure TfrmNew.btnCancelarClick(Sender: TObject);
begin
  ds.DataSet.Cancel;
  Close;
end;

procedure TfrmNew.Focus;
  var
  I: integer;
  // Teste
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TEdit then
      InOutFocus(Components[I] as TEdit);
    if (Components[I] is TcxDBSpinEdit) then
      InOutFocus(Components[I] as TcxDBSpinEdit);
    if (Components[I] is TcxDBTextEdit) then
      InOutFocus(Components[I] as TcxDBTextEdit);
    if (Components[I] is TcxDBMemo) then
      InOutFocus(Components[I] as TcxDBMemo);
    if (Components[I] is TcxDBDateEdit) then
      InOutFocus(Components[I] as TcxDBDateEdit);
    if (Components[I] is TcxDBLookupComboBox) then
      InOutFocus(Components[I] as TcxDBLookupComboBox);
    if (Components[I] is TcxDBCalcEdit) then
      InOutFocus(Components[I] as TcxDBCalcEdit);
    if (Components[I] is TcxTextEdit) then
      InOutFocus(Components[I] as TcxTextEdit);
    if (Components[I] is TcxCalcEdit) then
      InOutFocus(Components[I] as TcxCalcEdit);
    if (Components[I] is TcxDBCheckBox) then
      InOutFocus(Components[I] as TcxDBCheckBox);
  end;
end;

procedure TfrmNew.FormShow(Sender: TObject);
begin
  if Settings.Modo = 'NEW' then
    begin
      OpenQuery;
      qSQL.Open;
      QueryID := qSQL.FieldByName('pkey').AsInteger;
      qSQL.Close;
      ds.DataSet.Insert;
      qConsulta.ReadOnly:= False;
      btnCancelar.Enabled := True;
      btnAvancar.Enabled := True;
      Exit;
    end;
end;

procedure TfrmNew.grpContentEnter(Sender: TObject);
begin
  Focus;
end;

procedure TfrmNew.OpenQuery;
var i:Integer;
begin
  for I := 0 to ComponentCount -1 do
    begin
      if Components[i] is TUniQuery then
        begin
          if TUniQuery(Components[i]).Tag = 7000 then
            begin
              TUniQuery(Components[i]).Open;
            end;
        end;
    end;
  i:= 0;
  for I := 0 to ComponentCount -1 do
    begin
      if Components[i] is TUniQuery then
        begin
          if TUniQuery(Components[i]).Tag = 7100 then
            begin
              TUniQuery(Components[i]).Open;
            end;
        end;
    end;
end;

procedure TfrmNew.ValidaCamposObrigatorios(Query: TUniQuery);
  var
    i: Integer;
    msg: string;
begin
  msg := '';
  for i := 0 to Query.Fields.Count - 1 do
    begin
      if Query.Fields[i].Required and Query.Fields[i].IsNull then // ou (cdsAux.Fields&91;i&93;.AsString = ´´)
        begin
          if msg <> '' then msg := '   > ' + msg + #13;
          msg := msg + '   > ' + Query.Fields[i].DisplayName; // ou FieldName
        end;

      if msg <> '' then
        raise Exception.Create('Campo obrigatório não preenchido!' + #13 + msg)
    end;
end;

end.
