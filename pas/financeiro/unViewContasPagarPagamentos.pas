unit unViewContasPagarPagamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unView, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.ImgList, MemDS, DBAccess, Uni, Vcl.StdCtrls, dxGDIPlusClasses, cxImage,
  Vcl.ExtCtrls, cxCheckBox, cxDBEdit, cxCalc, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCalendar, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxCurrencyEdit, cxMemo;

type
  TfrmViewContasPagarPagamentos = class(TfrmView)
    Grid: TcxGrid;
    View: TcxGridDBTableView;
    Master: TcxGridLevel;
    StyleRepository: TcxStyleRepository;
    StyleHeader: TcxStyle;
    StyleItemInativo: TcxStyle;
    StyleItemAtivo: TcxStyle;
    StylePendente: TcxStyle;
    StyleCancelado: TcxStyle;
    StyleQuitado: TcxStyle;
    StyleVencido: TcxStyle;
    qCentroCustos: TUniQuery;
    dsCentroCustos: TUniDataSource;
    qTipoConta: TUniQuery;
    dsTipoConta: TUniDataSource;
    qTipoPagamento: TUniQuery;
    dsTipoPagamento: TUniDataSource;
    lblCodigo: TLabel;
    edtCodigo: TcxDBSpinEdit;
    lbl1: TLabel;
    edtdata_registro: TcxDBDateEdit;
    lblTipoConta: TLabel;
    edttipo_conta: TcxDBSpinEdit;
    cbbTipoConta: TcxDBLookupComboBox;
    lblValor: TLabel;
    edtvalor: TcxDBCalcEdit;
    lblParcela: TLabel;
    edtparcela: TcxDBSpinEdit;
    lblVencimento: TLabel;
    edtvencimento: TcxDBDateEdit;
    lbldocumento: TLabel;
    edtdocumento: TcxDBTextEdit;
    lblCredor: TLabel;
    cbbCredor: TcxDBLookupComboBox;
    lblDescricao: TLabel;
    edtdescricao: TcxDBTextEdit;
    lblcentrocustos: TLabel;
    edtcentro_custo: TcxDBTextEdit;
    cbbCentroCustos: TcxDBLookupComboBox;
    lblTipoPagamento: TLabel;
    cbbTipoPagamento: TcxDBLookupComboBox;
    cbbdesmembrada: TcxDBCheckBox;
    cbbquitada: TcxDBCheckBox;
    cbbdespesa: TcxDBCheckBox;
    qPagamentos: TUniQuery;
    dsPagamentos: TUniDataSource;
    grp1: TGroupBox;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    edtcodigo1: TcxDBSpinEdit;
    edtdata_movimento: TcxDBDateEdit;
    edtvalor1: TcxDBCurrencyEdit;
    edtdata_hora: TcxDBDateEdit;
    edtoperador_caixa: TcxDBSpinEdit;
    edttipo_pagamento: TcxDBSpinEdit;
    cbbOperador: TcxDBLookupComboBox;
    cbbCaixa: TcxDBLookupComboBox;
    grpObservacao: TGroupBox;
    mmoobservacao: TcxDBMemo;
    cbbtipo_pagamento: TcxDBLookupComboBox;
    ColumnViewcodigo: TcxGridDBColumn;
    ColumnViewdata_movimento: TcxGridDBColumn;
    ColumnViewvalor: TcxGridDBColumn;
    ColumnViewcupom: TcxGridDBColumn;
    edtoperador_sistema: TcxDBSpinEdit;
    qUsuario: TUniQuery;
    dsUsuario: TUniDataSource;
    qPessoas: TUniQuery;
    dsPessoas: TUniDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewContasPagarPagamentos: TfrmViewContasPagarPagamentos;

implementation

{$R *.dfm}

end.
