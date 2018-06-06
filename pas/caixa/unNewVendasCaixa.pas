unit unNewVendasCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unNew, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, cxMemo, cxDBEdit,
  cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxTextEdit, cxMaskEdit, cxSpinEdit, Data.DB, DBAccess, Uni, MemDS,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls, unSystem, unParametros, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, unCaixa;

type
  TfrmNewVendasCaixa = class(TfrmNew)
    lblCodigo: TLabel;
    edtCodigo: TcxDBSpinEdit;
    Label1: TLabel;
    edtCliente: TcxDBSpinEdit;
    cbbCliente: TcxDBLookupComboBox;
    Label2: TLabel;
    edtrepresentante: TcxDBSpinEdit;
    cbbRepresentante: TcxDBLookupComboBox;
    grpObservacao: TGroupBox;
    mmoobservacao: TcxDBMemo;
    qRepresentante: TUniQuery;
    dsRepresentante: TUniDataSource;
    qCliente: TUniQuery;
    dsCliente: TUniDataSource;
    lblPedido: TLabel;
    edtPedido: TcxDBSpinEdit;
    qConsultacodigo: TIntegerField;
    qConsultaempresa: TIntegerField;
    qConsultapedido: TIntegerField;
    qConsultacliente: TIntegerField;
    qConsultarepresentante: TIntegerField;
    qConsultadata_registro: TDateTimeField;
    qConsultaprevisao_entrega: TDateField;
    qConsultadata_venda: TDateTimeField;
    qConsultadata_entrega: TDateField;
    qConsultastatus: TStringField;
    qConsultaobservacao: TMemoField;
    procedure btnAvancarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edtrepresentanteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewVendasCaixa: TfrmNewVendasCaixa;

implementation

{$R *.dfm}

uses unGridPessoaCliente, unGridPessoaRepresentante;

procedure TfrmNewVendasCaixa.btnAvancarClick(Sender: TObject);
var
  Processo: TConsulta;
begin
  ds.DataSet.FieldByName('empresa').AsInteger := Parametros.cdsParametros.FieldByName('empresa').AsInteger;
  ds.DataSet.FieldByName('data_registro').AsDateTime := Date;
  Processo.eChave := QueryID;
  inherited;
  Processo.eValido := True;
  Caixa.Venda := Processo;
  Close;
end;

procedure TfrmNewVendasCaixa.edtClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    begin
      if (edtCliente.Value > 0) then
        begin
          cbbCliente.SetFocus;
        end
      else
        begin
          CriaFormulario(TfrmGridPessoaCliente,0,'CONSULTA',frmGridPessoaCliente);
          if Parametros.Find.eValido = True then
            begin
              ds.DataSet.FieldByName('cliente').AsInteger := Parametros.Find.eChave;
              cbbCliente.SetFocus;
            end;
        end;
    end;
end;

procedure TfrmNewVendasCaixa.edtrepresentanteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    begin
      if (edtrepresentante.Value > 0) then
        begin
          cbbRepresentante.SetFocus;
        end
      else
        begin
          CriaFormulario(TfrmGridPessoaRepresentante,0,'CONSULTA',frmGridPessoaRepresentante);
          if Parametros.Find.eValido = True then
            begin
              ds.DataSet.FieldByName('representante').AsInteger := Parametros.Find.eChave;
              cbbRepresentante.SetFocus;
            end;
        end;
    end;
end;

procedure TfrmNewVendasCaixa.FormShow(Sender: TObject);
begin
  qSQL.ParamByName('sequencial').AsString := 'vendas_codigo_seq';
  inherited;
  edtCliente.SetFocus;
  ds.DataSet.FieldByName('data_venda').AsDateTime := Date;
end;

end.
