unit unEndereco;

interface

type
  TEndereco = class
  private
    // atributos e metodos privados
    eCep             : String;
    eLogradouro      : String;
    eBairro          : String;
    eComplemento     : String;
    eCidade          : String;
    eEstado          : String;
    eTipologradouro  : String;
    eValido          : Boolean;
    // SET
    procedure SETCep(const Value: String);
    procedure SETLogradouro(const Value: String);
    procedure SETBairro(const Value: String);
    procedure SETComplemento(const Value: String);
    procedure SETCidade(const Value: String);
    procedure SETEstado(const Value: String);
    procedure SETTipologradouro(const Value: String);
    procedure SETValido(const Value: Boolean);
  protected
    { protected declarations }
  public
    Constructor Create;
    destructor Destroy; override;
    // atibutos e metodos publicos
    property Cep :String read eCep write eCep;
    property Logradouro :String read eLogradouro write eLogradouro;
    property Bairro :String read eBairro write eBairro;
    property Complemento :String read eComplemento write eComplemento;
    property Cidade :String read eCidade write eCidade;
    property Estado :String read eEstado write eEstado;
    property Tipologradouro :String read eTipologradouro write eTipologradouro;
    property Valido :Boolean read eValido write eValido;
  published
    { published declarations }
  end;

implementation

{ TEndereco }

constructor TEndereco.Create;
begin
  // metodo contrutor
end;

destructor TEndereco.Destroy;
begin
  // metodo destrutor
  inherited;
end;

procedure TEndereco.SETBairro(const Value: String);
begin
  eBairro := Value;
end;

procedure TEndereco.SETCep(const Value: String);
begin
  eCep := Value;
end;

procedure TEndereco.SETCidade(const Value: String);
begin
  eCidade := Value;
end;

procedure TEndereco.SETComplemento(const Value: String);
begin
  eComplemento := Value;
end;

procedure TEndereco.SETEstado(const Value: String);
begin
  eEstado := Value;
end;

procedure TEndereco.SETLogradouro(const Value: String);
begin
  eLogradouro := Value;
end;

procedure TEndereco.SETTipologradouro(const Value: String);
begin
  eTipologradouro := Value;
end;

procedure TEndereco.SETValido(const Value: Boolean);
begin
  eValido := Value;
end;

end.
