unit unGridCTe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unEGrid, unSystem,cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, dxRibbonSkins,
  dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, dxSkinsdxBarPainter,
  cxClasses, dxBar, DBAccess, Uni, MemDS, Vcl.ImgList, dxRibbon, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, pcnConversao;

type
  TfrmGridCTe = class(TfrmEGrid)
    Label1: TLabel;
    Label2: TLabel;
    ColumnID: TcxGridDBColumn;
    ColumnRemetente: TcxGridDBColumn;
    ColumnDestinatario: TcxGridDBColumn;
    ColumnData: TcxGridDBColumn;
    ColumnStatus: TcxGridDBColumn;
    procedure barbtnServerStatusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridCTe: TfrmGridCTe;

implementation

{$R *.dfm}

uses unSEFAZ;

procedure TfrmGridCTe.barbtnServerStatusClick(Sender: TObject);
begin
  inherited;
  try
    SeFaz.ACBrCTe.WebServices.StatusServico.Executar;
    // Registra Log;
    mmoLog.Lines.Add('---------------------------------------------------------');
    mmoLog.Lines.Add('Status Serviço');
    mmoLog.Lines.Add('tpAmb: '    +TpAmbToStr(SEFAZ.ACBrCTe.WebServices.StatusServico.tpAmb));
    mmoLog.Lines.Add('verAplic: ' +SEFAZ.ACBrCTe.WebServices.StatusServico.verAplic);
    mmoLog.Lines.Add('cStat: '    +IntToStr(SEFAZ.ACBrCTe.WebServices.StatusServico.cStat));
    mmoLog.Lines.Add('xMotivo: '  +SEFAZ.ACBrCTe.WebServices.StatusServico.xMotivo);
    mmoLog.Lines.Add('cUF: '      +IntToStr(SEFAZ.ACBrCTe.WebServices.StatusServico.cUF));
    mmoLog.Lines.Add('dhRecbto: ' +DateTimeToStr(SEFAZ.ACBrCTe.WebServices.StatusServico.dhRecbto));
    mmoLog.Lines.Add('tMed: '     +IntToStr(SEFAZ.ACBrCTe.WebServices.StatusServico.TMed));
    mmoLog.Lines.Add('dhRetorno: '+DateTimeToStr(SEFAZ.ACBrCTe.WebServices.StatusServico.dhRetorno));
    mmoLog.Lines.Add('xObs: '     +SEFAZ.ACBrCTe.WebServices.StatusServico.xObs);
    Aviso('INFO','RETORNO DA SEFAZ','RESPOSTA DA SEFAZ SP: ' + SeFaz.ACBrCTe.WebServices.StatusServico.xMotivo);
  except
    on Erro: Exception do
    begin
      Aviso('ALER','RETORNO DA SEFAZ',Erro.Message + #13+#13+
            'Verifique se a configuração do certificado esta devidamente configurada, se o arquivo esta na pasta.');
    end;
  end;
end;

end.
