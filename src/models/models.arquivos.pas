unit models.arquivos;

interface

uses
  models.contracts;

type
  TArquivo = class(TInterfacedObject, IArquivo)
  private
    FParent: IConfiguracoes;

    FSalvar: Boolean;
    FSepararPorMes: Boolean;
    FAdicionarLiteral: Boolean;
    FEmissaoPathNFe: Boolean;
    FSalvarEvento: Boolean;
    FSepararPorCNPJ: Boolean;
    FSepararPorModelo: Boolean;
    FPathSchemas: String;
    FPathNFe: String;
    FPathInu: String;
    FPathEvento: String;
    FPathMensal: String;
    FPathSalvar: String;

    constructor Create(Parent: IConfiguracoes);
  public
    class function New(Parent: IConfiguracoes): IArquivo;

    function Salvar(Value: Boolean): IArquivo; overload;
    function Salvar: Boolean; overload;
    function SepararPorMes(Value: Boolean): IArquivo; overload;
    function SepararPorMes: Boolean; overload;
    function AdicionarLiteral(Value: Boolean): IArquivo; overload;
    function AdicionarLiteral: Boolean; overload;
    function EmissaoPathNFe(Value: Boolean): IArquivo; overload;
    function EmissaoPathNFe: Boolean; overload;
    function SalvarEvento(Value: Boolean): IArquivo; overload;
    function SalvarEvento: Boolean; overload;
    function SepararPorCNPJ(Value: Boolean): IArquivo; overload;
    function SepararPorCNPJ: Boolean; overload;
    function SepararPorModelo(Value: Boolean): IArquivo; overload;
    function SepararPorModelo: Boolean; overload;
    function PathSchemas(Value: String): IArquivo; overload;
    function PathSchemas: String; overload;
    function PathNFe(Value: String): IArquivo; overload;
    function PathNFe: String; overload;
    function PathInu(Value: String): IArquivo; overload;
    function PathInu: String; overload;
    function PathEvento(Value: String): IArquivo; overload;
    function PathEvento: String; overload;
    function PathMensal(Value: String): IArquivo; overload;
    function PathMensal: String; overload;
    function PathSalvar(Value: String): IArquivo; overload;
    function PathSalvar: String; overload;
    function &End: IConfiguracoes;
  end;

implementation


function TArquivo.AdicionarLiteral: Boolean;
begin
  Result := FAdicionarLiteral;
end;

function TArquivo.AdicionarLiteral(Value: Boolean): IArquivo;
begin
  Result := Self;
  FAdicionarLiteral := Value;
end;

constructor TArquivo.Create(Parent: IConfiguracoes);
begin
  FParent := Parent;

  FSalvar := False;
  FSepararPorMes := false;
  FAdicionarLiteral := False;
  FEmissaoPathNFe := FAlse;
  FSalvarEvento := False;
  FSepararPorCNPJ := False;
  FSepararPorModelo := False;
  FPathSchemas := '';
  FPathNFe := '';
  FPathInu := '';
  FPathEvento := '';
  FPathMensal := '';
  FPathSalvar := '';
end;

function TArquivo.EmissaoPathNFe: Boolean;
begin
  Result := FEmissaoPathNFe;
end;

function TArquivo.EmissaoPathNFe(Value: Boolean): IArquivo;
begin
  Result := Self;
  FEmissaoPathNFe := VAlue;
end;

function TArquivo.&End: IConfiguracoes;
begin
  Result := FParent;
end;

class function TArquivo.New(Parent: IConfiguracoes): IArquivo;
begin
  Result := Self.Create(Parent);
end;

function TArquivo.PathEvento: String;
begin
  Result := FPathEvento;
end;

function TArquivo.PathEvento(Value: String): IArquivo;
begin
  Result := Self;
  FPathEvento := Value;
end;

function TArquivo.PathInu(Value: String): IArquivo;
begin
  Result := Self;
  FPathInu := Value;
end;

function TArquivo.PathInu: String;
begin
  Result := FPathInu;
end;

function TArquivo.PathMensal: String;
begin
  Result := FPathMensal;
end;

function TArquivo.PathMensal(Value: String): IArquivo;
begin
  Result := Self;
  FPathMensal := Value;
end;

function TArquivo.PathNFe: String;
begin
  Result := FPathNFe;
end;

function TArquivo.PathNFe(Value: String): IArquivo;
begin
  Result := Self;
  FPathNFe := Value;
end;

function TArquivo.PathSalvar(Value: String): IArquivo;
begin
  Result := Self;
  FPathSalvar := Value;
end;

function TArquivo.PathSalvar: String;
begin
  Result := FPathSalvar;
end;

function TArquivo.PathSchemas(Value: String): IArquivo;
begin
  Result := Self;
  FPathSchemas := Value;
end;

function TArquivo.PathSchemas: String;
begin
  Result := FPathSchemas;
end;

function TArquivo.Salvar(Value: Boolean): IArquivo;
begin
  Result := Self;
  FSalvar := VAlue;
end;

function TArquivo.Salvar: Boolean;
begin
  Result := FSalvar;
end;

function TArquivo.SalvarEvento: Boolean;
begin
  Result := FSalvarEvento;
end;

function TArquivo.SalvarEvento(Value: Boolean): IArquivo;
begin
  Result := Self;
  FSalvarEvento := VAlue;
end;

function TArquivo.SepararPorCNPJ: Boolean;
begin
  Result := FSepararPorCNPJ;
end;

function TArquivo.SepararPorCNPJ(Value: Boolean): IArquivo;
begin
  Result := Self;
  FSepararPorCNPJ := Value;
end;

function TArquivo.SepararPorMes: Boolean;
begin
  Result := FSepararPorMes;
end;

function TArquivo.SepararPorMes(Value: Boolean): IArquivo;
begin
  Result := Self;
  FSepararPorMes := Value;
end;

function TArquivo.SepararPorModelo(Value: Boolean): IArquivo;
begin
  Result := Self;
  FSepararPorModelo := VAlue;
end;

function TArquivo.SepararPorModelo: Boolean;
begin
  Result := FSepararPorModelo;
end;

end.
