unit models.factory;

interface

uses
  models.contracts;

type
  TFactoryModels = class(TInterfacedObject, IFactoryModels)
  private
    FConfiguracoes: IConfiguracoes;
    FIde: IIde;
    FEmitente: IEmitente;

    constructor Create;
  public
    class function New: IFactoryModels;

    function Configuracoes: IConfiguracoes;
    function Ide: IIde;
    function Emitente: IEmitente;
  end;

implementation

uses
  models.configuracoes, models.emitente, models.ide;


function TFactoryModels.Configuracoes: IConfiguracoes;
begin
  Result := FConfiguracoes;
end;

constructor TFactoryModels.Create;
begin
  FConfiguracoes := TConfiguracoes.new;
  FEmitente := TEmitente.NEw;
  FIde := TIde.new;
end;

function TFactoryModels.Emitente: IEmitente;
begin
  Result := FEmitente;
end;

function TFactoryModels.Ide: IIde;
begin
  Result := FIde;
end;

class function TFactoryModels.New: IFactoryModels;
begin
  Result := Self.Create;
end;

end.
