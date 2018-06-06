unit unCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ImgList, cxGraphics, unSystem, Data.DB, MemDS, DBAccess, Uni,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  cxEdit, cxDBEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCheckBox, cxCalendar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxImageComboBox,
  cxData, cxDBData, cxCurrencyEdit, cxCalc, Vcl.AppEvnts, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxGDIPlusClasses, cxImage,
  cxMemo, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TfrmCad = class(TForm)
    pnlBotton: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    imgHelp: TImage;
    btnCancelar: TButton;
    btnSalvar: TButton;
    btnFechar: TButton;
    ds: TUniDataSource;
    qConsulta: TUniQuery;
    ImageList16: TcxImageList;
    grpContent: TGroupBox;
    pnlHelp: TPanel;
    imgIconHelp: TcxImage;
    mmoHelp: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure grpContentEnter(Sender: TObject);
    procedure grpContentExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure imgHelpMouseEnter(Sender: TObject);
    procedure imgHelpMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    procedure SalvaFilhos;
  public
    { Public declarations }
    Settings: TFormMode;
    procedure OpenQuery;
    //procedure ValidaCamposObrigatorios;
    procedure GetHint(Sender: TObject);
    function ValidaCamposObrigatorios(Query: TUniQuery):String;
    procedure Focus;
    // Relacionado a tabelas relacionadas
    procedure actFilho(Indice: Integer; Action:string; InstanceClass: TComponentClass; var Reference);
  end;

var
  frmCad: TfrmCad;

implementation

{$R *.dfm}
uses unConnection, unParametros, unFields, StrUtils;

procedure TfrmCad.actFilho(Indice: Integer; Action: string; InstanceClass: TComponentClass;
  var Reference);
begin
  case AnsiIndexStr(UpperCase(Action), ['NEW','EDT','RMV']) of
    0:begin
        try
          Application.CreateForm(InstanceClass, Reference);
          TfrmCad(Reference).Settings.Modo := 'NEW';
          TfrmCad(Reference).Settings.ID := Indice;
          TfrmCad(Reference).ShowModal;
        finally
          TfrmCad(Reference).Release;
        end;
      end;
    1:begin
        try
          Application.CreateForm(InstanceClass, Reference);
          TfrmCad(Reference).Settings.Modo := 'ALTERACAO';
          TfrmCad(Reference).Settings.ID := Indice;
          TfrmCad(Reference).ShowModal;
        finally
          TfrmCad(Reference).Release;
        end;
      end;
    2:begin
        {try
          Application.CreateForm(InstanceClass, Reference);
          TfrmCad(Reference).Settings.Modo := 'NEW';
          TfrmCad(Reference).Settings.ID := Indice;
          TfrmCad(Reference).ShowModal;
        finally
          TfrmCad(Reference).Release;
        end;}
        Aviso('INFO','Informação','Função não implementada. Favor entrar em contato com o suporte.');
      end;
  end;

end;

procedure TfrmCad.btnCancelarClick(Sender: TObject);
begin
  ds.DataSet.Cancel;
  Close;
end;

procedure TfrmCad.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCad.btnSalvarClick(Sender: TObject);
var
  msg: string;
begin
  try
    msg := ValidaCamposObrigatorios(qConsulta);
    if msg <> '' then
      begin
        Aviso('INFO','Campos obrigatórios','Os campos abaixo relacionados devem ser preenchidos: ' + #13 + msg);
        Exit;
      end
    else
      begin
        ds.DataSet.Post;
        //SalvaFilhos;
        Close;
      end;
  except
    Aviso('STOP','Informação','Não foi possivel gravar as informações. ' + #13 + 'Favor entrar em contato com o suporte.');
  end;
end;

procedure TfrmCad.Focus;
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

procedure TfrmCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
  if ds.DataSet.State in [dsInsert, dsEdit] then
    begin
      case Application.MessageBox('Deseja salvar as alterações antes de sair?'+#13+'Clique em NÃO para descartar as alterações ou em CANCELAR para voltar.','Informação.',MB_ICONQUESTION + MB_YESNOCANCEL) of
        ID_YES:begin
          ds.DataSet.Post;
          Action := caFree;
        end;
        ID_NO:begin
          try
            ds.DataSet.Cancel;
            Action := caFree;
          except
            Aviso('ERRO','Erro ao salvar.','Houve um erro ao salvar o registro.'+#13+'Verifique se todos os campos estão devidamente preenchidos e tente novamente.');
          end;
        end;
        ID_CANCEL:begin
          Action := caNone;
        end;
      end;
    end
  else
    Action := caFree;
end;

procedure TfrmCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 112 then
    begin
      if pnlHelp.Visible = False then
        begin
          Self.ClientHeight := Self.ClientHeight + 44;
          pnlHelp.Visible := True
        end
      else
        begin
          Self.ClientHeight := Self.ClientHeight - 44;
          pnlHelp.Visible := False
        end;
    end;
end;

procedure TfrmCad.FormShow(Sender: TObject);
begin
  Self.ClientHeight := Self.ClientHeight - 44;
  if Settings.Modo = 'CONSULTA' then
    begin
      // Relacionais
      qConsulta.ParamByName('codigo').asInteger := Settings.ID;
      OpenQuery;
      qConsulta.ReadOnly:= True;
      btnCancelar.Enabled := False;
      btnSalvar.Enabled := False;
      btnFechar.Enabled := True;
      Exit;
    end;
  if Settings.Modo = 'NEW' then
    begin
      qConsulta.ParamByName('codigo').asInteger := Settings.ID;
      OpenQuery;
      ds.DataSet.Insert;
      qConsulta.ReadOnly:= False;
      btnCancelar.Enabled := True;
      btnSalvar.Enabled := True;
      btnFechar.Enabled := True;
      Exit;
    end;
  if Settings.Modo = 'ALTERACAO' then
    begin
      qConsulta.ParamByName('codigo').asInteger := Settings.ID;
      OpenQuery;
      qConsulta.ReadOnly:= False;
      ds.DataSet.Edit;
      btnCancelar.Enabled := True;
      btnSalvar.Enabled := True;
      btnFechar.Enabled := True;
      Exit;
    end;
end;


procedure TfrmCad.GetHint(Sender: TObject);
var
  HelpString: String;
begin
  if pnlHelp.Visible = True then
    begin
      mmoHelp.Lines.Clear;
      if Sender is TPanel then
        begin
          HelpString := TPanel(Sender).Hint;
        end;
      if Sender is TGroupBox then
        begin
          HelpString := TGroupBox(Sender).Hint;
        end;
      if Sender is TButton then
        begin
          HelpString := TButton(Sender).Hint;
        end;
      if Sender is TEdit then
        begin
          HelpString := TEdit(Sender).Hint;
        end;
      if Sender is TcxDBSpinEdit then
        begin
          HelpString := TcxDBSpinEdit(Sender).Hint;
        end;
      if Sender is TcxDBTextEdit then
        begin
          HelpString := TcxDBTextEdit(Sender).Hint;
        end;
      if Sender is TcxDBMemo then
        begin
          HelpString := TcxDBMemo(Sender).Hint;
        end;
      if Sender is TcxDBDateEdit then
        begin
          HelpString := TcxDBDateEdit(Sender).Hint;
        end;
      if Sender is TcxDBLookupComboBox then
        begin
          HelpString := TcxDBLookupComboBox(Sender).Hint;
        end;
      if Sender is TcxDBCalcEdit then
        begin
          HelpString := TcxDBCalcEdit(Sender).Hint;
        end;
      if Sender is TcxTextEdit then
        begin
          HelpString := TcxTextEdit(Sender).Hint;
        end;
      if Sender is TcxCalcEdit then
        begin
          HelpString := TcxCalcEdit(Sender).Hint;
        end;
      if Sender is TcxDBCheckBox then
        begin
          HelpString := TcxDBCheckBox(Sender).Hint;
        end;
      mmoHelp.Lines.Append(HelpString);
      MemoScroll(SB_LINEUP,mmoHelp);
    end;
end;

procedure TfrmCad.grpContentEnter(Sender: TObject);
begin
  Focus;
end;

procedure TfrmCad.grpContentExit(Sender: TObject);
begin
  Focus;
end;

procedure TfrmCad.imgHelpMouseEnter(Sender: TObject);
begin
  GetHint(Sender);
end;

procedure TfrmCad.imgHelpMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  GetHint(Sender);
end;

procedure TfrmCad.OpenQuery;
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

procedure TfrmCad.SalvaFilhos;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TUniDataSource then
        begin
          if TUniDataSource(Components[i]).State in [dsEdit, dsInsert] then
            begin
              TUniDataSource(Components[i]).DataSet.Post;
            end;
        end;
    end;
end;

function TfrmCad.ValidaCamposObrigatorios(Query: TUniQuery):String;
  var
    i: Integer;
    msg: string;
begin
  msg := '';
  for i := 0 to Query.Fields.Count - 1 do
    begin
      if (Query.Fields[i].Required) then
        begin
          if (Query.Fields[i].IsNull) then // ou (cdsAux.Fields&91;i&93;.AsString = ´´)
            begin
              if msg = '' then
                begin
                  msg := '   > ' + Query.Fields[i].DisplayName + #13;
                end
              else
                begin
                  msg := msg + '   > ' + Query.Fields[i].DisplayName + #13;
                end;
              {if msg <> '' then
                msg := '   > ' + msg + #13;
              msg := msg + '   > ' + Query.Fields[i].DisplayName; // ou FieldName}
            end;
          {if msg <> '' then
            raise Exception.Create('Campo obrigatório não preenchido!' + #13 + msg)}
        end;
    end;
  Result := msg;
end;

end.
