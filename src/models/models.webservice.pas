unit models.webservice;

interface

uses
  models.contracts;

type
  TWebService = class(TInterfacedObject, IWebService)
  private
    FParent: IConfiguracoes;

    FUF: String;
    FAmbiente: Integer;
    FVisualizar: Boolean;
    FSalvar: Boolean;
    FAjustaAguardaConsultaRet: Boolean;
    FAguardarConsultaRet: Integer;
    FTentativas: Integer;
    FIntervaloTentativas: Integer;
    FTimeOut: Integer;
    FProxyHost: String;
    FProxyPort: String;
    FProxyUser: String;
    FProxyPass: String;

    constructor Create(Parent: IConfiguracoes);
  public
    class function New(Parent: IConfiguracoes): IWebService;

    function UF(Value: String): IWebService; overload;
    function UF: String; overload;
    function Ambiente(Value: Integer): IWebService; overload;
    function Ambiente: Integer; overload;
    function Visualizar(Value: Boolean): IWebService; overload;
    function Visualizar: Boolean; overload;
    function Salvar(Value: Boolean): IWebService; overload;
    function Salvar: Boolean; overload;
    function AjustaAguardaConsultaRet(Value: Boolean): IWebService; overload;
    function AjustaAguardaConsultaRet: Boolean; overload;
    function AguardarConsultaRet(Value: Integer): IWebService; overload;
    function AguardarConsultaRet: Integer; overload;
    function Tentativas(Value: Integer): IWebService; overload;
    function Tentativas: Integer; overload;
    function IntervaloTentativas(Value: Integer): IWebService; overload;
    function IntervaloTentativas: Integer; overload;
    function TimeOut(Value: Integer): IWebService; overload;
    function TimeOut: Integer; overload;
    function ProxyHost(Value: String): IWebService; overload;
    function ProxyHost: String; overload;
    function ProxyPort(Value: String): IWebService; overload;
    function ProxyPort: String; overload;
    function ProxyUser(Value: String): IWebService; overload;
    function ProxyUser: String; overload;
    function ProxyPass(Value: String): IWebService; overload;
    function ProxyPass: String; overload;
    function &End: IConfiguracoes;
  end;

implementation

{ TWebService<T> }

function TWebService.AguardarConsultaRet: Integer;
begin
  Result := FAguardarConsultaRet;
end;

function TWebService.AguardarConsultaRet(Value: Integer): IWebService;
begin
  Result := self;
  FAguardarConsultaRet := Value;
end;

function TWebService.AjustaAguardaConsultaRet(
  Value: Boolean): IWebService;
begin
  Result := Self;
  FAjustaAguardaConsultaRet := Value;
end;

function TWebService.AjustaAguardaConsultaRet: Boolean;
begin
  Result := FAjustaAguardaConsultaRet;
end;

function TWebService.Ambiente(Value: Integer): IWebService;
begin
  Result := Self;
  FAmbiente := Value;
end;

function TWebService.Ambiente: Integer;
begin
  Result := FAmbiente;
end;

constructor TWebService.Create(Parent: IConfiguracoes);
begin
  FParent := Parent;

  FUF := '';
  FAmbiente := 0;
  FVisualizar := False;
  FSalvar := False;
  FAjustaAguardaConsultaRet := False;
  FAguardarConsultaRet := 0;
  FTentativas := 0;
  FIntervaloTentativas := 0;
  FTimeOut := 0;
  FProxyHost := '';
  FProxyPort := '';
  FProxyUser := '';
  FProxyPass := '';
end;

function TWebService.&End: IConfiguracoes;
begin
  Result := FParent;
end;

function TWebService.IntervaloTentativas: Integer;
begin
  Result := FTentativas;
end;

function TWebService.IntervaloTentativas(Value: Integer): IWebService;
begin
  Result := Self;
  FTentativas := Value;
end;

class function TWebService.New(Parent: IConfiguracoes): IWebService;
begin
  Result := Self.Create(Parent);
end;

function TWebService.ProxyHost: String;
begin
  Result := FProxyHost;
end;

function TWebService.ProxyHost(Value: String): IWebService;
begin
  Result := Self;
  FProxyHost := Value;
end;

function TWebService.ProxyPass: String;
begin
  Result := FProxyPass;
end;

function TWebService.ProxyPass(Value: String): IWebService;
begin
  Result := Self;
  FProxyPass := Value;
end;

function TWebService.ProxyPort: String;
begin
  Result := FProxyPort;
end;

function TWebService.ProxyPort(Value: String): IWebService;
begin
  Result := Self;
  FProxyPort := Value;
end;

function TWebService.ProxyUser(Value: String): IWebService;
begin
  Result := Self;
  FProxyUser := VAlue;
end;

function TWebService.ProxyUser: String;
begin
  Result := FProxyUser;
end;

function TWebService.Salvar: Boolean;
begin
  Result := FSalvar;
end;

function TWebService.Salvar(Value: Boolean): IWebService;
begin
  Result := Self;
  FSalvar := VAlue;
end;

function TWebService.Tentativas(Value: Integer): IWebService;
begin
  Result := Self;
  FTentativas := Value;
end;

function TWebService.Tentativas: Integer;
begin
  Result := FTentativas;
end;

function TWebService.TimeOut(Value: Integer): IWebService;
begin
  Result := Self;
  FTimeOut := Value;
end;

function TWebService.TimeOut: Integer;
begin
  Result := FTimeOut;
end;

function TWebService.UF: String;
begin
  Result := FUF;
end;

function TWebService.UF(Value: String): IWebService;
begin
  Result := Self;
  FUF := VAlue;
end;

function TWebService.Visualizar: Boolean;
begin
  Result := FVisualizar;
end;

function TWebService.Visualizar(Value: Boolean): IWebService;
begin
  Result := Self;
  FVisualizar := VAlue;
end;

end.
