unit unCaixaAdm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unMaster, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ImgList, dxGDIPlusClasses, cxImage, Vcl.Menus, cxLabel, cxDBLabel,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC, unSystem, unParametros, unConnection,
  Data.DB, MemDS, DBAccess, Uni, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxCurrencyEdit, dxRibbonSkins, dxSkinsdxRibbonPainter,
  dxRibbonCustomizationForm, dxRibbon, dxSkinsdxBarPainter, dxBar;

type
  TfrmCaixaAdm = class(TFMaster)
    pnlHelp: TPanel;
    imgIconHelp: TcxImage;
    mmoHelp: TMemo;
    ImageList16: TcxImageList;
    pnlBotton: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    imgHelp: TImage;
    btnFechar: TButton;
    grpInfo: TGroupBox;
    lblDataCaixa: TLabel;
    lblOperador: TLabel;
    lblAbertura: TLabel;
    lblTurno: TLabel;
    lblDBData: TcxDBLabel;
    lblDBOperador: TcxDBLabel;
    lblDBAbertura: TcxDBLabel;
    lblDBTurno: TcxDBLabel;
    grpMovimento: TGroupBox;
    PageControl: TcxPageControl;
    TabVendas: TcxTabSheet;
    TabCompras: TcxTabSheet;
    TabSangrias: TcxTabSheet;
    TabSuprimento: TcxTabSheet;
    qSQL: TUniQuery;
    qConsulta: TUniQuery;
    ds: TUniDataSource;
    GridVendas: TcxGrid;
    ViewVendas: TcxGridDBTableView;
    MasterVendas: TcxGridLevel;
    GridCompras: TcxGrid;
    ViewCompras: TcxGridDBTableView;
    ViewComprascodigo: TcxGridDBColumn;
    ViewComprasFornecedor: TcxGridDBColumn;
    ViewComprasrepresentante: TcxGridDBColumn;
    ViewComprasdata: TcxGridDBColumn;
    ViewComprasTotal: TcxGridDBColumn;
    ViewComprasPagamento: TcxGridDBColumn;
    ViewComprasstatus: TcxGridDBColumn;
    MasterCompras: TcxGridLevel;
    GridSangrias: TcxGrid;
    ViewSangrias: TcxGridDBTableView;
    ViewSangriascodigo: TcxGridDBColumn;
    ViewSangriasCliente: TcxGridDBColumn;
    ViewSangriasrepresentante: TcxGridDBColumn;
    ViewSangriasdata: TcxGridDBColumn;
    ViewSangriasTotal: TcxGridDBColumn;
    ViewSangriasPagamento: TcxGridDBColumn;
    ViewSangriasstatus: TcxGridDBColumn;
    MasterSangrias: TcxGridLevel;
    GridSuprimentos: TcxGrid;
    ViewSuprimentos: TcxGridDBTableView;
    ViewSuprimentoscodigo: TcxGridDBColumn;
    ViewSuprimentosCliente: TcxGridDBColumn;
    ViewSuprimentosrepresentante: TcxGridDBColumn;
    ViewSuprimentosdata: TcxGridDBColumn;
    ViewSuprimentosTotal: TcxGridDBColumn;
    ViewSuprimentosPagamento: TcxGridDBColumn;
    ViewSuprimentosstatus: TcxGridDBColumn;
    MasterSuprimentos: TcxGridLevel;
    TabFaturamento: TcxTabSheet;
    TabDespesa: TcxTabSheet;
    GridFaturamento: TcxGrid;
    ViewFaturamento: TcxGridDBTableView;
    ViewFaturamentocodigo: TcxGridDBColumn;
    ViewFaturamentoCliente: TcxGridDBColumn;
    ViewFaturamentorepresentante: TcxGridDBColumn;
    ViewFaturamentodata: TcxGridDBColumn;
    ViewFaturamentoTotal: TcxGridDBColumn;
    ViewFaturamentoPagamento: TcxGridDBColumn;
    ViewFaturamentostatus: TcxGridDBColumn;
    MasterFaturamento: TcxGridLevel;
    GridDespesas: TcxGrid;
    ViewDespesas: TcxGridDBTableView;
    ViewDespesascodigo: TcxGridDBColumn;
    ViewDespesasCliente: TcxGridDBColumn;
    ViewDespesasrepresentante: TcxGridDBColumn;
    ViewDespesasdata: TcxGridDBColumn;
    ViewDespesasTotal: TcxGridDBColumn;
    ViewDespesasPagamento: TcxGridDBColumn;
    ViewDespesasstatus: TcxGridDBColumn;
    MasterDespesas: TcxGridLevel;
    qVendas: TUniQuery;
    dsVendas: TUniDataSource;
    qSangrias: TUniQuery;
    dsSangrias: TUniDataSource;
    qSuprimentos: TUniQuery;
    dsSuprimentos: TUniDataSource;
    qCompras: TUniQuery;
    dsCompras: TUniDataSource;
    qDespesas: TUniQuery;
    dsDespesas: TUniDataSource;
    ViewVendascodigo: TcxGridDBColumn;
    ViewVendasempresa: TcxGridDBColumn;
    ViewVendasdata_emissao: TcxGridDBColumn;
    ViewVendassituacao: TcxGridDBColumn;
    ViewVendascaixa_codigo: TcxGridDBColumn;
    ViewVendascaixa_operador: TcxGridDBColumn;
    ViewVendascaixa_data: TcxGridDBColumn;
    ViewVendascaixa_turno: TcxGridDBColumn;
    ViewVendasnr_cupom: TcxGridDBColumn;
    ViewVendasnr_serie: TcxGridDBColumn;
    ViewVendasnr_ecf: TcxGridDBColumn;
    ViewVendasnr_ccf: TcxGridDBColumn;
    ViewVendasvenda: TcxGridDBColumn;
    ViewVendasoperador: TcxGridDBColumn;
    ViewVendaspessoa: TcxGridDBColumn;
    ViewVendascliente: TcxGridDBColumn;
    ViewVendaspessoa_cpf: TcxGridDBColumn;
    ViewVendastipo_pagamento: TcxGridDBColumn;
    ViewVendaspagamento: TcxGridDBColumn;
    ViewVendastotal_cupom: TcxGridDBColumn;
    ViewVendasvalor_acrescimo: TcxGridDBColumn;
    ViewVendasvalor_desconto: TcxGridDBColumn;
    ViewVendasvalor_troco: TcxGridDBColumn;
    ViewVendasvalor_pago: TcxGridDBColumn;
    ViewVendasnf_imprimida: TcxGridDBColumn;
    ViewVendasdesconto_operador: TcxGridDBColumn;
    ViewVendasmd5: TcxGridDBColumn;
    ViewVendasfatura: TcxGridDBColumn;
    ViewVendascancelamento_data: TcxGridDBColumn;
    ViewVendascancelamento_motivo: TcxGridDBColumn;
    ViewVendascancelamento_operador: TcxGridDBColumn;
    StyleRepository: TcxStyleRepository;
    StyleHeader: TcxStyle;
    StyleItemInativo: TcxStyle;
    StyleItemAtivo: TcxStyle;
    StylePendente: TcxStyle;
    StyleConcluido: TcxStyle;
    StyleCancelado: TcxStyle;
    StyleParcial: TcxStyle;
    StyleFechado: TcxStyle;
    grpTotalizadores: TGroupBox;
    lblVendaBruta: TLabel;
    lblVenfaLiquida: TLabel;
    lblVendas: TLabel;
    lblDespesas: TLabel;
    lblSuprimentos: TLabel;
    lblSangrias: TLabel;
    qGERAL: TUniQuery;
    dsGERAL: TUniDataSource;
    lblGRVBruta: TcxDBLabel;
    lblGRVLiquida: TcxDBLabel;
    lblGRCompras: TcxDBLabel;
    lblGRDespesas: TcxDBLabel;
    lblGRSuprimentos: TcxDBLabel;
    lblGRSangrias: TcxDBLabel;
    qFaturamento: TUniQuery;
    dsFaturamento: TUniDataSource;
    Label1: TLabel;
    lblGRcreditos: TcxDBLabel;
    ViewComprasCompra: TcxGridDBColumn;
    ViewComprasDocumento: TcxGridDBColumn;
    ViewComprasValor: TcxGridDBColumn;
    ViewDespesasValor: TcxGridDBColumn;
    ViewDespesasDocumento: TcxGridDBColumn;
    ViewDespesasDescricao: TcxGridDBColumn;
    Ribbon: TdxRibbon;
    MTabCaixa: TdxRibbonTab;
    MTabRelat�rios: TdxRibbonTab;
    BarManager: TdxBarManager;
    BarSistema: TdxBar;
    BarSeparatorAplicacao: TdxBarSeparator;
    BarSeparatorParametrosSistema: TdxBarSeparator;
    BarSeparatorCadGerencial: TdxBarSeparator;
    BarSeparatorCadRegistros: TdxBarSeparator;
    BarSeparatorCadOrganizacao: TdxBarSeparator;
    BarSeparatorCadAcessos: TdxBarSeparator;
    BarSeparatorAnalitico: TdxBarSeparator;
    BarSeparatorCadastros: TdxBarSeparator;
    MnAjuda: TdxBarLargeButton;
    MnSair: TdxBarLargeButton;
    BarCaixa: TdxBar;
    MnDetalhamento: TdxBarLargeButton;
    MiMovimentacao: TdxBarSubItem;
    MnSuprimento: TdxBarLargeButton;
    MnSangria: TdxBarLargeButton;
    MnFecharCaixa: TdxBarLargeButton;
    MnAtualizar: TdxBarLargeButton;
    ViewSangriasMotivo: TcxGridDBColumn;
    ViewSuprimentosMotivo: TcxGridDBColumn;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MnSairClick(Sender: TObject);
    procedure MnAtualizarClick(Sender: TObject);
    procedure MnSuprimentoClick(Sender: TObject);
    procedure ViewSuprimentosDblClick(Sender: TObject);
    procedure MnSangriaClick(Sender: TObject);
    procedure ViewSangriasDblClick(Sender: TObject);
    procedure MnFecharCaixaClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQuery;
    procedure ActInserir(InstanceClass: TComponentClass; var Reference);
    procedure ActVisualizar(InstanceClass: TComponentClass; var Reference);
  public
    { Public declarations }
  end;

var
  frmCaixaAdm: TfrmCaixaAdm;

implementation

{$R *.dfm}

uses unCadAberturaCaixa, unDMCaixaAdm, unCadSuprimentos, unCad, unCadSangrias;

procedure TfrmCaixaAdm.ActInserir(InstanceClass: TComponentClass; var Reference);
begin
  try
    begin
      Connection.qPermissoesUser.Close;
      Connection.qPermissoesUser.ParamByName('usuario').AsInteger := Parametros.FieldParametrosusuario.AsInteger;
      Connection.qPermissoesUser.ParamByName('tag').AsInteger := Self.Tag;
      Connection.qPermissoesUser.Open;
      if Connection.qPermissoesUser.RecordCount = 1 then
      begin
        if Connection.qPermissoesUser.FieldByName('alteracao').AsBoolean = True then
        begin
          try
            Application.CreateForm(InstanceClass, Reference);
            TfrmCad(Reference).Settings.Modo := 'NEW';
            TfrmCad(Reference).ShowModal;
          finally
            TfrmCad(Reference).Release;
            ds.DataSet.Refresh;
          end;
        end
        else
        begin
          Aviso('STOP', 'Informa��o', 'Voc� n�o possui autoriza��o para realizar esta opera��o.');
          Exit;
        end;
      end
      else
      begin
        Connection.qPermissoesGrupo.Close;
        Connection.qPermissoesGrupo.ParamByName('grupo').AsInteger := Parametros.FieldParametrosgrupo.AsInteger;
        Connection.qPermissoesGrupo.ParamByName('tag').AsInteger := Self.Tag;
        Connection.qPermissoesGrupo.Open;
        if Connection.qPermissoesGrupo.RecordCount = 1 then
        begin
          if Connection.qPermissoesGrupo.FieldByName('alteracao').AsBoolean = True then
          begin
            try
              Application.CreateForm(InstanceClass, Reference);
              TfrmCad(Reference).Settings.Modo := 'NEW';
              TfrmCad(Reference).ShowModal;
            finally
              TfrmCad(Reference).Release;
              ds.DataSet.Refresh;
            end;
          end
          else
          begin
            Aviso('STOP', 'Informa��o', 'Voc� n�o possui autoriza��o para realizar esta opera��o.');
            Exit;
          end;
        end
        else
        begin
          Aviso('ALER', 'Informa��o', 'Voc� n�o possui autoriza��o para realizar esta opera��o.');
          Exit;
        end;
      end;
    end;
  except
    Aviso('ERRO', 'Erro critico de execu��o.', 'Houve um erro ao abrir o formulario.' + #13 + 'Contate o suporte.');
  end;
end;

procedure TfrmCaixaAdm.ActVisualizar(InstanceClass: TComponentClass;
  var Reference);
begin
  try
    begin
      Connection.qPermissoesUser.Close;
      Connection.qPermissoesUser.ParamByName('usuario').AsInteger := Parametros.FieldParametrosusuario.AsInteger;
      Connection.qPermissoesUser.ParamByName('tag').AsInteger := Self.Tag;
      Connection.qPermissoesUser.Open;
      if Connection.qPermissoesUser.RecordCount = 1 then
      begin
        if Connection.qPermissoesUser.FieldByName('abrir').AsBoolean = True then
        begin
          try
            Application.CreateForm(InstanceClass, Reference);
            TfrmCad(Reference).Settings.Modo := 'CONSULTA';
            TfrmCad(Reference).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
            TfrmCad(Reference).ShowModal;
          finally
            TfrmCad(Reference).Release;
            ds.DataSet.Refresh;
          end
        end
        else
        begin
          Aviso('STOP', 'Informa��o', 'Voc� n�o possui autoriza��o para realizar esta opera��o.');
          Exit;
        end;
      end
      else
      begin
        Connection.qPermissoesGrupo.Close;
        Connection.qPermissoesGrupo.ParamByName('grupo').AsInteger := Parametros.FieldParametrosgrupo.AsInteger;
        Connection.qPermissoesGrupo.ParamByName('tag').AsInteger := Self.Tag;
        Connection.qPermissoesGrupo.Open;
        if Connection.qPermissoesGrupo.RecordCount = 1 then
        begin
          if Connection.qPermissoesGrupo.FieldByName('abrir').AsBoolean = True then
          begin
            try
              Application.CreateForm(InstanceClass, Reference);
              TfrmCad(Reference).Settings.Modo := 'CONSULTA';
              TfrmCad(Reference).Settings.ID := ds.DataSet.FieldByName('codigo').asInteger;
              TfrmCad(Reference).ShowModal;
            finally
              TfrmCad(Reference).Release;
              ds.DataSet.Refresh;
            end
          end
          else
          begin
            Aviso('STOP', 'Informa��o', 'Voc� n�o possui autoriza��o para realizar esta opera��o.');
            Exit;
          end;
        end
        else
        begin
          Aviso('ALER', 'Informa��o', 'Voc� n�o possui autoriza��o para realizar esta opera��o.');
          Exit;
        end;
      end;
    end;
  except
    Aviso('ERRO', 'Erro critico de execu��o.', 'Houve um erro ao abrir o formulario.' + #13 + 'Contate o suporte.');
  end;
end;

procedure TfrmCaixaAdm.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCaixaAdm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
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

procedure TfrmCaixaAdm.FormShow(Sender: TObject);
begin
  inherited;
  qConsulta.ParamByName('codigo').AsInteger := Settings.ID;
  OpenQuery;
  Self.ClientHeight := Self.ClientHeight - 44;
  if Self.ClientWidth > 1280 then
    begin
      ViewVendas.OptionsView.CellAutoHeight := True;
    end;
end;

procedure TfrmCaixaAdm.MnAtualizarClick(Sender: TObject);
begin
  inherited;
  qGERAL.Refresh;
  qVendas.Refresh;
  qSangrias.Refresh;
  qSuprimentos.Refresh;
  qCompras.Refresh;
  qDespesas.Refresh;
  qFaturamento.Refresh;
end;

procedure TfrmCaixaAdm.MnFecharCaixaClick(Sender: TObject);
begin
  inherited;
  if (Pergunta('WHAT','Informa��o','Tem certeza que deseja fechar o caixa?','SN') = ID_YES) then
    begin
      // Fecha o caixa atual.
      qSQL.Close;
      qSQL.SQL.Clear;
      qSQL.SQL.Text := 'SELECT set_fechamento_caixa(:codigo);';
      qSQL.ParamByName('codigo').AsInteger := ds.DataSet.FieldByName('codigo').AsInteger;
      qSQL.Open;
      if qSQL.FieldByName('set_fechamento_caixa').AsBoolean = True then
        begin
          Aviso('INFO','Informa��o','Caixa finalizado com sucesso.');
          Close;
        end
      else
        begin
          Aviso('ERRO','Informa��o','N�o foi possivel finalizar o caixa atual.'+#13+'Por favor, entre em contato com o Suporte!');
        end;

    end;
end;

procedure TfrmCaixaAdm.MnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCaixaAdm.MnSangriaClick(Sender: TObject);
begin
  inherited;
  ActInserir(TfrmCadSangrias,frmCadSangrias);
end;

procedure TfrmCaixaAdm.MnSuprimentoClick(Sender: TObject);
begin
  inherited;
  ActInserir(TfrmCadSuprimentos,frmCadSuprimentos);
end;

procedure TfrmCaixaAdm.OpenQuery;
var i:Integer;
begin
  for I := 0 to ComponentCount -1 do
    begin
      if Components[i] is TUniQuery then
        begin
          if TUniQuery(Components[i]).Tag = 7000 then
            begin
              TUniQuery(Components[i]).Close;
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
              TUniQuery(Components[i]).Close;
              TUniQuery(Components[i]).Open;
            end;
        end;
    end;
end;

procedure TfrmCaixaAdm.ViewSangriasDblClick(Sender: TObject);
begin
  inherited;
  ActVisualizar(TfrmCadSangrias,frmCadSangrias);
end;

procedure TfrmCaixaAdm.ViewSuprimentosDblClick(Sender: TObject);
begin
  inherited;
  ActVisualizar(TfrmCadSuprimentos,frmCadSuprimentos);
end;

end.
