unit routers.notafiscal;

interface

uses
  Horse,
  System.JSON,
  System.SysUtils,
  routers.contracts,
  usecase.actions,
  serializable.response;

type
  TNotaFiscalHorseRouter = class(TInterfacedObject, IRouters)
  private
    FAction: TAction;

    constructor Create;
    destructor Destroy; override;
  protected
    procedure Get(Req: THorseRequest; Res: THorseResponse);
    procedure GetAll(Req: THorseRequest; Res: THorseResponse);
    procedure Post(Req: THorseRequest; Res: THorseResponse);
    procedure Put(Req: THorseRequest; Res: THorseResponse);
    procedure Delete(Req: THorseRequest; Res: THorseResponse);
  public
    class function New: IRouters;
    procedure RegisterRouter;
  end;

implementation

{ TNotaFiscalHorseRouter }

uses helpers.serializable, serializable.notafiscal;

constructor TNotaFiscalHorseRouter.Create;
begin
  FAction := TAction.Create;
end;

procedure TNotaFiscalHorseRouter.Delete(Req: THorseRequest;
  Res: THorseResponse);
begin

end;

destructor TNotaFiscalHorseRouter.Destroy;
begin
  FAction.Free;
  inherited;
end;

procedure TNotaFiscalHorseRouter.Get(Req: THorseRequest; Res: THorseResponse);
begin

end;

procedure TNotaFiscalHorseRouter.GetAll(Req: THorseRequest;
  Res: THorseResponse);
begin

end;

class function TNotaFiscalHorseRouter.New: IRouters;
begin
  Result := Self.Create;
end;

procedure TNotaFiscalHorseRouter.Post(Req: THorseRequest; Res: THorseResponse);
begin
  var LNota := TSerializacao<TNotaFiscal>.New(TNotaFiscal.Create).ToObject(Req.Body);
  var LRetorno := FAction.Emitir(LNota);
  Res.Send<TJSONObject>(TSerializacao<TResponse>.New(LRetorno).ToJSON)
end;

procedure TNotaFiscalHorseRouter.Put(Req: THorseRequest; Res: THorseResponse);
begin

end;

procedure TNotaFiscalHorseRouter.RegisterRouter;
begin
  THorse
    .Post('api/notafiscais/emitir', Post);
end;

end.
