unit models.configuracoes;

interface

uses
  System.SysUtils,
  IniFiles,
  models.contracts;

type
  TConfiguracoes = class(TInterfacedObject, IConfiguracoes)
  private
    FCertificado: ICertificado;
    FWebService: IWebService;
    FArquivo: IArquivo;
    FSSLLib: Integer;
    FSSLCryptLib: Integer;
    FSSLHttpLib: Integer;
    FSSLXmlSignLib: Integer;
    FSSLType: Integer;
    FAtualizarXMLCancelado: Boolean;
    FSalvar: Boolean;
    FExibirErroSchema: Boolean;
    FRetirarAcentos: Boolean;
    FFormatoAlerta: String;
    FFormaEmissao: Integer;
    FModeloDF: Integer;
    FVersaoDF: Integer;
    FIdCSC: String;
    FCSC: String;
    FVersaoQRCode: Integer;
    FTipoDANFE: Integer;
    FLogo: String;
    FPathPDF: String;

    constructor Create;
  public
    class function New: IConfiguracoes;

    function Certificado: ICertificado;
    function SSLLib(Value: Integer): IConfiguracoes; overload;
    function SSLLib: Integer; overload;
    function SSLCryptLib(Value: Integer): IConfiguracoes; overload;
    function SSLCryptLib: Integer; overload;
    function SSLHttpLib(Value: Integer): IConfiguracoes; overload;
    function SSLHttpLib: Integer; overload;
    function SSLXmlSignLib(Value: Integer): IConfiguracoes; overload;
    function SSLXmlSignLib: Integer; overload;
    function SSLType(Value: Integer): IConfiguracoes; overload;
    function SSLType: Integer; overload;
    function AtualizarXMLCancelado(Value: Boolean): IConfiguracoes; overload;
    function AtualizarXMLCancelado: Boolean; overload;
    function Salvar(Value: Boolean): IConfiguracoes; overload;
    function Salvar: Boolean; overload;
    function ExibirErroSchema(Value: Boolean): IConfiguracoes; overload;
    function ExibirErroSchema: Boolean; overload;
    function RetirarAcentos(Value: Boolean): IConfiguracoes; overload;
    function RetirarAcentos: Boolean; overload;
    function FormatoAlerta(Value: String): IConfiguracoes; overload;
    function FormatoAlerta: String; overload;
    function FormaEmissao(Value: Integer): IConfiguracoes; overload;
    function FormaEmissao: Integer; overload;
    function ModeloDF(Value: Integer): IConfiguracoes; overload;
    function ModeloDF: Integer; overload;
    function VersaoDF(Value: Integer): IConfiguracoes; overload;
    function VersaoDF: Integer; overload;
    function IdCSC(Value: String): IConfiguracoes; overload;
    function IdCSC: String; overload;
    function CSC(Value: String): IConfiguracoes; overload;
    function CSC: String; overload;
    function VersaoQRCode(Value: Integer): IConfiguracoes; overload;
    function VersaoQRCode: Integer; overload;
    function TipoDANFE(Value: Integer): IConfiguracoes; overload;
    function TipoDANFE: Integer; overload;
    function Logo(Value: String): IConfiguracoes; overload;
    function Logo: String; overload;
    function PathPDF(Value: String): IConfiguracoes; overload;
    function PathPDF: String; overload;
    function WebService: IWebService;
    function Arquivo: IArquivo;
  end;

implementation

uses
  models.arquivos, models.certificado, models.webservice;

{ TConfiguracoes }

function TConfiguracoes.Arquivo: IArquivo;
begin
  if not Assigned(FArquivo) then
    FArquivo := TArquivo.New(Self);
  Result := FArquivo;
end;

function TConfiguracoes.AtualizarXMLCancelado(Value: Boolean): IConfiguracoes;
begin
  Result := Self;
  FAtualizarXMLCancelado := Value;
end;

function TConfiguracoes.AtualizarXMLCancelado: Boolean;
begin
  Result := FAtualizarXMLCancelado;
end;

function TConfiguracoes.Certificado: ICertificado;
begin
  if not Assigned(FCertificado) then
    FCertificado := TCertificado.New(Self);
  Result := FCertificado;
end;

constructor TConfiguracoes.Create;
begin
  FSSLLib := 0;
  FSSLCryptLib := 0;
  FSSLHttpLib := 0;
  FSSLXmlSignLib := 0;
  FSSLType := 0;
  FAtualizarXMLCancelado := False;
  FSalvar := False;
  FExibirErroSchema := false;
  FRetirarAcentos := false;
  FFormatoAlerta := '';
  FFormaEmissao := 0;
  FModeloDF := 0;
  FVersaoDF := 0;
  FIdCSC := '';
  FCSC := '';
  FVersaoQRCode := 0;
  FTipoDANFE := 0;
  FLogo := '';
  FPathPDF := '';
end;

function TConfiguracoes.CSC: String;
begin
  Result := FCSC;
end;

function TConfiguracoes.CSC(Value: String): IConfiguracoes;
begin
  Result := Self;
  FCSC := VAlue;
end;

function TConfiguracoes.ExibirErroSchema(Value: Boolean): IConfiguracoes;
begin
  Result := Self;
  FExibirErroSchema := Value;
end;

function TConfiguracoes.ExibirErroSchema: Boolean;
begin
  Result := FExibirErroSchema;
end;

function TConfiguracoes.FormaEmissao(Value: Integer): IConfiguracoes;
begin
  Result := Self;
  FFormaEmissao := VAlue;
end;

function TConfiguracoes.FormaEmissao: Integer;
begin
  Result := FFormaEmissao;
end;

function TConfiguracoes.FormatoAlerta(Value: String): IConfiguracoes;
begin
  Result := Self;
  FFormatoAlerta := Value;
end;

function TConfiguracoes.FormatoAlerta: String;
begin
  Result := FFormatoAlerta;
end;

function TConfiguracoes.IdCSC: String;
begin
  Result := FIdCSC;
end;

function TConfiguracoes.IdCSC(Value: String): IConfiguracoes;
begin
  Result := Self;
  FIdCSC := Value;
end;

function TConfiguracoes.Logo(Value: String): IConfiguracoes;
begin
  Result := Self;
  FLogo := Value;
end;

function TConfiguracoes.Logo: String;
begin
  Result := FLogo;
end;

function TConfiguracoes.ModeloDF: Integer;
begin
  Result := FModeloDF;
end;

function TConfiguracoes.ModeloDF(Value: Integer): IConfiguracoes;
begin
  Result := Self;
  FModeloDF := Value;
end;

class function TConfiguracoes.New: IConfiguracoes;
begin
  Result := Self.Create;
end;

function TConfiguracoes.PathPDF: String;
begin
  Result := FPathPDF;
end;

function TConfiguracoes.PathPDF(Value: String): IConfiguracoes;
begin
  Result := Self;
  FPathPDF := Value;
end;

function TConfiguracoes.RetirarAcentos: Boolean;
begin
  Result := FRetirarAcentos;
end;

function TConfiguracoes.RetirarAcentos(Value: Boolean): IConfiguracoes;
begin
  Result := Self;
  FRetirarAcentos := Value;
end;

function TConfiguracoes.Salvar(Value: Boolean): IConfiguracoes;
begin
  Result := Self;
  FSalvar := Value;
end;

function TConfiguracoes.Salvar: Boolean;
begin
  Result := FSalvar;
end;

function TConfiguracoes.SSLCryptLib: Integer;
begin
  Result := FSSLCryptLib;
end;

function TConfiguracoes.SSLCryptLib(Value: Integer): IConfiguracoes;
begin
  Result := Self;
  FSSLCryptLib := Value;
end;

function TConfiguracoes.SSLHttpLib: Integer;
begin
  Result := FSSLHttpLib;
end;

function TConfiguracoes.SSLHttpLib(Value: Integer): IConfiguracoes;
begin
  Result := Self;
  FSSLHttpLib := Value;
end;

function TConfiguracoes.SSLLib(Value: Integer): IConfiguracoes;
begin
  Result := Self;
  FSSLLib := Value;
end;

function TConfiguracoes.SSLLib: Integer;
begin
  Result := FSSLLib;
end;

function TConfiguracoes.SSLType: Integer;
begin
  Result := FSSLType;
end;

function TConfiguracoes.SSLType(Value: Integer): IConfiguracoes;
begin
  Result := Self;
  FSSLType := Value;
end;

function TConfiguracoes.SSLXmlSignLib: Integer;
begin
 Result := FSSLXmlSignLib;
end;

function TConfiguracoes.SSLXmlSignLib(Value: Integer): IConfiguracoes;
begin
  Result := Self;
  FSSLXmlSignLib := Value;
end;

function TConfiguracoes.TipoDANFE: Integer;
begin
  Result := FTipoDANFE;
end;

function TConfiguracoes.TipoDANFE(Value: Integer): IConfiguracoes;
begin
  Result := Self;
  FTipoDANFE := Value;
end;

function TConfiguracoes.VersaoDF: Integer;
begin
  Result := FVersaoDF;
end;

function TConfiguracoes.VersaoDF(Value: Integer): IConfiguracoes;
begin
  Result := Self;
  FVersaoDF := Value;
end;

function TConfiguracoes.VersaoQRCode(Value: Integer): IConfiguracoes;
begin
  Result := Self;
  FVersaoQRCode := Value;
end;

function TConfiguracoes.VersaoQRCode: Integer;
begin
  Result := FVersaoQRCode;
end;

function TConfiguracoes.WebService: IWebService;
begin
  if not Assigned(FWebService) then
    FWebService := TWebService.New(Self);
  Result := FWebService;
end;

end.
