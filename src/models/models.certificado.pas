unit models.certificado;

interface

uses
  models.contracts;

type
  TCertificado = class(TInterfacedObject, ICertificado)
  private
    FParent: IConfiguracoes;

    FURL: String;
    FCaminho: String;
    FSenha: String;
    FSerie: String;

    constructor Create(Parent: IConfiguracoes);
  public
    class function New(Parent: IConfiguracoes): ICertificado;

    function URL(Value: String): ICertificado; overload;
    function URL: String; overload;
    function Caminho(Value: String): ICertificado; overload;
    function Caminho: String; overload;
    function Senha(Value: String): ICertificado; overload;
    function Senha: String; overload;
    function Serie(Value: String): ICertificado; overload;
    function Serie: String; overload;
    function &End: IConfiguracoes;
  end;

implementation


function TCertificado.Caminho: String;
begin
  Result := FCaminho;
end;

function TCertificado.Caminho(Value: String): ICertificado;
begin
  Result := Self;
end;

constructor TCertificado.Create(Parent: IConfiguracoes);
begin
  FParent := Parent;
  FURL := '';
  FCaminho := '';
  FSenha := '';
  FSerie := '';
end;

function TCertificado.&End: IConfiguracoes;
begin
  Result := FParent;
end;

class function TCertificado.New(Parent: IConfiguracoes): ICertificado;
begin
  Result := Self.Create(Parent);
end;

function TCertificado.Senha(Value: String): ICertificado;
begin
  Result := Self;
  FSenha := Value;
end;

function TCertificado.Senha: String;
begin
  Result := FSenha;
end;

function TCertificado.Serie(Value: String): ICertificado;
begin
  Result := Self;
  FSerie := Value;
end;

function TCertificado.Serie: String;
begin
  Result := FSerie;
end;

function TCertificado.URL(Value: String): ICertificado;
begin
  Result := Self;
  FURL := Value;
end;

function TCertificado.URL: String;
begin
  Result := FURL;
end;

end.
