inherited frmCadPessoaRepresentante: TfrmCadPessoaRepresentante
  Caption = 'Cadastro de Pessoas - Representante'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 15
  inherited grpContent: TGroupBox
    inherited grpInfo: TGroupBox
      inherited PageControl: TcxPageControl
        inherited TabContato: TcxTabSheet
          inherited PageControlEndereco: TcxPageControl
            inherited TabPrincipal: TcxTabSheet
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              inherited cbbUF: TcxDBImageComboBox
                ExplicitHeight = 21
              end
            end
            inherited TabCobranca: TcxTabSheet
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              inherited cbbcobuf: TcxDBImageComboBox
                ExplicitHeight = 21
              end
            end
            inherited TabEntrega: TcxTabSheet
              ExplicitWidth = 0
              ExplicitHeight = 0
              inherited cbbentuf: TcxDBImageComboBox
                ExplicitHeight = 21
              end
            end
          end
        end
      end
    end
  end
  inherited ImageList16: TcxImageList
    FormatVersion = 1
  end
end
