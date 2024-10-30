unit models.ide;

interface

uses
  System.SysUtils,
  models.contracts;

type
  TIde = class(TInterfacedObject, IIde)
  private
    Fmodelo: integer;
    FnNF: String;
    FcNF: String;
    FdEmi: TDateTime;
    FdSaiEnt: TDateTime;
    FhSaiEnt: TDateTime;
    FtpNF: integer;
    FtpEmis: integer;
    FtpAmb: integer;
    FfinNFe: integer;
    FtpImp: integer;
    FindFinal: integer;
    FindPres: integer;
    FindIntermed: integer;

    constructor Create;
  public
    class function New: IIde;

    function modelo(Value: integer): IIde; overload;
    function modelo: integer; overload;
    function nNF(Value: String): IIde; overload;
    function nNF: String; overload;
    function cNF(Value: String): IIde; overload;
    function cNF: String; overload;
    function dEmi(Value: TDateTime): IIde; overload;
    function dEmi: TDateTime; overload;
    function dSaiEnt(Value: TDateTime): IIde; overload;
    function dSaiEnt: TDateTime; overload;
    function hSaiEnt(Value: TDateTime): IIde; overload;
    function hSaiEnt: TDateTime; overload;
    function tpNF(Value: integer): IIde; overload;
    function tpNF: integer; overload;
    function tpEmis(Value: integer): IIde; overload;
    function tpEmis: integer; overload;
    function tpAmb(Value: integer): IIde; overload;
    function tpAmb: integer; overload;
    function finNFe(Value: integer): IIde; overload;
    function finNFe: integer; overload;
    function tpImp(Value: integer): IIde; overload;
    function tpImp: integer; overload;
    function indFinal(Value: integer): IIde; overload;
    function indFinal: integer; overload;
    function indPres(Value: integer): IIde; overload;
    function indPres: integer; overload;
    function indIntermed(Value: integer): IIde; overload;
    function indIntermed: integer; overload;
  end;

implementation

{ TIde }

function TIde.cNF: String;
begin
  Result := FcNF;
end;

constructor TIde.Create;
begin
  Fmodelo := 0;
  FnNF := '';
  FcNF := '';
  FdEmi := now;
  FdSaiEnt := now;
  FhSaiEnt := now;
  FtpNF := 0;
  FtpEmis := 0;
  FtpAmb := 0;
  FfinNFe := 0;
  FtpImp := 0;
  FindFinal := 0;
  FindPres := 0;
  FindIntermed := 0;
end;

function TIde.cNF(Value: String): IIde;
begin
  Result := Self;
  FcNF := Value;
end;

function TIde.dEmi(Value: TDateTime): IIde;
begin
  Result := Self;
  FdEmi := Value;
end;

function TIde.dEmi: TDateTime;
begin
  Result := FdEmi;
end;

function TIde.dSaiEnt(Value: TDateTime): IIde;
begin
  Result := Self;
  FdSaiEnt := Value;
end;

function TIde.dSaiEnt: TDateTime;
begin
  Result := FdSaiEnt;
end;

function TIde.finNFe: integer;
begin
  Result := FfinNFe;
end;

function TIde.finNFe(Value: integer): IIde;
begin
  Result := Self;
  FfinNFe := Value;
end;

function TIde.hSaiEnt(Value: TDateTime): IIde;
begin
  Result := Self;
  FhSaiEnt := Value;
end;

function TIde.hSaiEnt: TDateTime;
begin
  Result := FhSaiEnt;
end;

function TIde.indFinal: integer;
begin
  Result := FindFinal;
end;

function TIde.indFinal(Value: integer): IIde;
begin
  Result := Self;
  FindFinal := Value;
end;

function TIde.indIntermed(Value: integer): IIde;
begin
  Result := Self;
  FindIntermed := Value;
end;

function TIde.indIntermed: integer;
begin
  Result := FindIntermed;
end;

function TIde.indPres(Value: integer): IIde;
begin
  Result := Self;
  FindPres := Value;
end;

function TIde.indPres: integer;
begin
  Result := FindPres;
end;

function TIde.modelo: integer;
begin
  Result := Fmodelo;
end;

function TIde.modelo(Value: integer): IIde;
begin
  Result := Self;
  Fmodelo := Value;
end;

class function TIde.New: IIde;
begin
  Result := Self.Create;
end;

function TIde.nNF: String;
begin
  Result := FnNF;
end;

function TIde.nNF(Value: String): IIde;
begin
  Result := Self;
  FnNF := Value;
end;

function TIde.tpAmb: integer;
begin
  Result := FtpAmb;
end;

function TIde.tpAmb(Value: integer): IIde;
begin
  Result := Self;
  FtpAmb := Value;
end;

function TIde.tpEmis(Value: integer): IIde;
begin
  Result := Self;
  FtpEmis := Value;
end;

function TIde.tpEmis: integer;
begin
  Result := FtpEmis;
end;

function TIde.tpImp: integer;
begin
  Result := FtpImp;
end;

function TIde.tpImp(Value: integer): IIde;
begin
  Result := Self;
  FtpImp := Value;
end;

function TIde.tpNF: integer;
begin
  Result := FtpNF;
end;

function TIde.tpNF(Value: integer): IIde;
begin
  Result := Self;
  FtpNF := Value;
end;

end.
