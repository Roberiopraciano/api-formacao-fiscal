unit models.emitente;

interface

uses
  models.contracts;

type
  TEmitente = class(TInterfacedObject, IEmitente)
  private
    FCNPJCPF: String;
    FIE: String;
    FxNome: String;
    FxFant: String;
    Ffone: String;
    FCEP: Integer;
    FxLgr: String;
    Fnro: String;
    FxCpl: String;
    FxBairro: String;
    FxMun: String;
    FcMun: Integer;
    FUF: String;
    FIEST: String;
    FCRT: String;

    constructor Create;
  public
    class function New: IEmitente;

    function CNPJCPF(Value: String): IEmitente; overload;
    function CNPJCPF: String; overload;
    function IE(Value: String): IEmitente; overload;
    function IE: String; overload;
    function xNome(Value: String): IEmitente; overload;
    function xNome: String; overload;
    function xFant(Value: String): IEmitente; overload;
    function xFant: String; overload;
    function fone(Value: String): IEmitente; overload;
    function fone: String; overload;
    function CEP(Value: Integer): IEmitente; overload;
    function CEP: Integer; overload;
    function xLgr(Value: String): IEmitente; overload;
    function xLgr: String; overload;
    function nro(Value: String): IEmitente; overload;
    function nro: String; overload;
    function xCpl(Value: String): IEmitente; overload;
    function xCpl: String; overload;
    function xBairro(Value: String): IEmitente; overload;
    function xBairro: String; overload;
    function xMun(Value: String): IEmitente; overload;
    function xMun: String; overload;
    function cMun(Value: Integer): IEmitente; overload;
    function cMun: Integer; overload;
    function UF(Value: String): IEmitente; overload;
    function UF: String; overload;
    function IEST(Value: String): IEmitente; overload;
    function IEST: String; overload;
    function CRT(Value: String): IEmitente; overload;
    function CRT: String; overload;
  end;

implementation

{ TEmitente }

function TEmitente.CEP: Integer;
begin
  Result := FCEP;
end;

function TEmitente.cMun: Integer;
begin
  Result := FcMun;
end;

function TEmitente.cMun(Value: Integer): IEmitente;
begin
  Result := Self;
  FcMun := Value;
end;

function TEmitente.CEP(Value: Integer): IEmitente;
begin
  Result := Self;
  FCEP := Value;
end;

function TEmitente.CNPJCPF: String;
begin
  Result := FCNPJCPF;
end;

constructor TEmitente.Create;
begin
  FCNPJCPF := '';
  FIE := '';
  FxNome := '';
  FxFant := '';
  Ffone := '';
  FCEP := 0;
  FxLgr := '';
  Fnro := '';
  FxCpl := '';
  FxBairro := '';
  FxMun := '';
  FcMun := 0;
  FUF := '';
  FIEST := '';
  FCRT := '';
end;

function TEmitente.CNPJCPF(Value: String): IEmitente;
begin
  Result := Self;
  FCNPJCPF := Value;
end;

function TEmitente.CRT: String;
begin
  Result := FCRT;
end;

function TEmitente.CRT(Value: String): IEmitente;
begin
  Result := Self;
  FCRT := Value;
end;

function TEmitente.fone: String;
begin
  Result := Ffone;
end;

function TEmitente.fone(Value: String): IEmitente;
begin
  Result := Self;
  Ffone := Value;
end;

function TEmitente.IE: String;
begin
  Result := FIE;
end;

function TEmitente.IE(Value: String): IEmitente;
begin
  Result := Self;
  FIE := Value;
end;

function TEmitente.IEST: String;
begin
  Result := FIEST;
end;

function TEmitente.IEST(Value: String): IEmitente;
begin
  Result := Self;
  FIEST := Value;
end;

class function TEmitente.New: IEmitente;
begin
  Result := Self.Create;
end;

function TEmitente.nro: String;
begin
  Result := Fnro;
end;

function TEmitente.nro(Value: String): IEmitente;
begin
  Result := Self;
  Fnro := Value;
end;

function TEmitente.UF: String;
begin
  Result := FUF;
end;

function TEmitente.UF(Value: String): IEmitente;
begin
  Result := Self;
  FUF := Value;
end;

function TEmitente.xBairro(Value: String): IEmitente;
begin
  Result := Self;
  FxBairro := Value;
end;

function TEmitente.xBairro: String;
begin
  Result := FxBairro;
end;

function TEmitente.xCpl(Value: String): IEmitente;
begin
  Result := Self;
  FxCpl := Value;
end;

function TEmitente.xCpl: String;
begin
  Result := FxCpl;
end;

function TEmitente.xFant(Value: String): IEmitente;
begin
  Result := Self;
  FxFant := Value;
end;

function TEmitente.xFant: String;
begin
  Result := FxFant;
end;

function TEmitente.xLgr(Value: String): IEmitente;
begin
  Result := Self;
  FxLgr := Value;
end;

function TEmitente.xLgr: String;
begin
  Result := FxLgr;
end;

function TEmitente.xMun: String;
begin
  Result := FxMun;
end;

function TEmitente.xMun(Value: String): IEmitente;
begin
  Result := Self;
  FxMun := Value;
end;

function TEmitente.xNome(Value: String): IEmitente;
begin
  Result := Self;
  FxNome := Value;
end;

function TEmitente.xNome: String;
begin
  Result := FxNome;
end;

end.
