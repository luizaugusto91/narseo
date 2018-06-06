unit unCadCTeParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCad, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, Vcl.ImgList, Data.DB, MemDS,
  DBAccess, Uni, Vcl.StdCtrls, dxGDIPlusClasses, cxImage, Vcl.ExtCtrls,
  cxDBEdit, cxImageComboBox, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxSpinEdit;

type
  TfrmCadCTeParametros = class(TfrmCad)
    FieldConsultacodigo: TIntegerField;
    FieldConsultaempresa: TIntegerField;
    FieldConsultadestinatario: TIntegerField;
    FieldConsultaremetente: TIntegerField;
    FieldConsultaorigem: TIntegerField;
    FieldConsultadestino: TIntegerField;
    FieldConsultatipo_nota: TStringField;
    FieldConsultafrota: TIntegerField;
    qOperacacoes: TUniQuery;
    dsOperacoes: TUniDataSource;
    qFrota: TUniQuery;
    dsFrota: TUniDataSource;
    qPessoas: TUniQuery;
    dsPessoas: TUniDataSource;
    qCidade: TUniQuery;
    dsCidade: TUniDataSource;
    lbl1: TLabel;
    edtremetente: TcxDBSpinEdit;
    cbbremetente: TcxDBLookupComboBox;
    cbbdestinatario: TcxDBLookupComboBox;
    edtdestinatario: TcxDBSpinEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    edtlocal_coleta: TcxDBSpinEdit;
    cbblocal_coleta: TcxDBLookupComboBox;
    cbblocal_entrega: TcxDBLookupComboBox;
    edtlocal_entrega: TcxDBSpinEdit;
    lbl11: TLabel;
    lbl4: TLabel;
    cbbtipo_nota: TcxDBImageComboBox;
    lbl12: TLabel;
    edtnatureza_operacao: TcxDBTextEdit;
    cbbOperacao: TcxDBLookupComboBox;
    cbbFrota: TcxDBLookupComboBox;
    edtfrota: TcxDBSpinEdit;
    lbl10: TLabel;
    FieldConsultacfop: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCTeParametros: TfrmCadCTeParametros;

implementation

uses
  unParametros;

{$R *.dfm}

end.
