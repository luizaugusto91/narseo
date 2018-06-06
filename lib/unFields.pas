unit unFields;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComObj, ExtCtrls, ComCtrls, MaskUtils, cxGraphics, cxControls,
  cxEdit, cxDBEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCheckBox, cxCalendar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxImageComboBox,
  cxData, cxDBData, cxCurrencyEdit, cxCalc, cxMemo;

  // Procedures e Funções basicas do sistema.
  //----------------------------------------------------------------------------
  // > Funções
  // >> Textos e Dados
  // >> Alertas e Consultas
  // >> Janelas
  // >> Rotinas
  //----------------------------------------------------------------------------
  // > Procedures
  // >> Textos e Dados
    procedure InOutFocus(Sender: TObject);
    procedure MemoScroll(Direction: Integer; Sender:TObject);
  // >> Alertas e Consultas
  // >> Janelas
  // >> Rotinas
  //----------------------------------------------------------------------------

implementation

procedure MemoScroll(Direction: Integer; Sender:TObject);
var
  ScrollMessage: TWMVScroll;
  j: integer;
{
  Exemplo:
    MemoScroll(Memo1, SB_LINEUP); // Rola para o início
    MemoScroll(Memo1, SB_LINEDOWN); // Rola para o final
}
begin
  if Sender is TMemo then
    begin
      with (Sender as TMemo) do
        begin
          ScrollMessage.Msg := WM_VSCROLL;
          Lines.BeginUpdate;
          try
            for j := 0 to Lines.Count do
              begin
                ScrollMessage.ScrollCode := Direction;
                ScrollMessage.Pos := 0;
                Dispatch(ScrollMessage);
              end;
          finally
            Lines.EndUpdate;
          end;
        end;
    end;
  if Sender is TcxMemo then
    begin
      with (Sender as TcxMemo) do
        begin
          ScrollMessage.Msg := WM_VSCROLL;
          Lines.BeginUpdate;
          try
            for j := 0 to Lines.Count do
              begin
                ScrollMessage.ScrollCode := Direction;
                ScrollMessage.Pos := 0;
                Dispatch(ScrollMessage);
              end;
          finally
            Lines.EndUpdate;
          end;
        end;
    end;
end;

procedure InOutFocus(Sender: TObject);
begin
  // DBTextEDIT
  if (Sender is TcxDBTextEdit) then
    if TcxDBTextEdit(Sender).Focused then
      TcxDBTextEdit(Sender).Style.Color := clInfoBk
    else
      TcxDBTextEdit(Sender).Style.Color := clWhite;
  // DBSPINEDIT
  if (Sender is TcxDBSpinEdit) then
    if TcxDBSpinEdit(Sender).Focused then
      TcxDBSpinEdit(Sender).Style.Color := clInfoBk
    else
      TcxDBSpinEdit(Sender).Style.Color := clWhite;
  // DBIMAGECOMBOBOX
  if (Sender is TcxDBImageComboBox) then
    if TcxDBImageComboBox(Sender).Focused then
      TcxDBImageComboBox(Sender).Style.Color := clInfoBk
    else
      TcxDBImageComboBox(Sender).Style.Color := clWhite;
  // DBMEMO
  if (Sender is TcxDBMemo) then
    if TcxDBMemo(Sender).Focused then
      TcxDBMemo(Sender).Style.Color := clInfoBk
    else
      TcxDBMemo(Sender).Style.Color := clWhite;
  // DBDATEEDIT
  if (Sender is TcxDBDateEdit) then
    if TcxDBDateEdit(Sender).Focused then
      TcxDBDateEdit(Sender).Style.Color := clInfoBk
    else
      TcxDBDateEdit(Sender).Style.Color := clWhite;
  // DBLOOKUPCOMBOBOX
  if (Sender is TcxDBLookupComboBox) then
    if TcxDBLookupComboBox(Sender).Focused then
      TcxDBLookupComboBox(Sender).Style.Color := clInfoBk
    else
      TcxDBLookupComboBox(Sender).Style.Color := clWhite;
  // DBCALCEDIT
  if (Sender is TcxDBCalcEdit) then
    if TcxDBCalcEdit(Sender).Focused then
      TcxDBCalcEdit(Sender).Style.Color := clInfoBk
    else
      TcxDBCalcEdit(Sender).Style.Color := clWhite;
  // DBCHECKBOX
  if (Sender is TcxDBCheckBox) then
    if TcxDBCheckBox(Sender).Focused then
      TcxDBCheckBox(Sender).Style.TextStyle := [fsBold]
    else
      TcxDBCheckBox(Sender).Style.TextStyle := [];
  // TEXTEDIT
  if (Sender is TcxTextEdit) then
    if TcxTextEdit(Sender).Focused then
      TcxTextEdit(Sender).Style.Color := clInfoBk
    else
      TcxTextEdit(Sender).Style.Color := clWhite;
  // CALCEDIT
  if (Sender is TcxCalcEdit) then
    if TcxCalcEdit(Sender).Focused then
      TcxCalcEdit(Sender).Style.Color := clInfoBk
    else
      TcxCalcEdit(Sender).Style.Color := clWhite;
end;

end.
