unit serializable.ide;

interface

uses
  GBJSON.Attributes;

type
  TIde = class
  private
    FindPag: Integer;
    FnatOp: String;
    Fserie: Integer;
    FnNF: Integer;
  public
    [JSONProp('natOp')]
    property natOp: String read FnatOp write FnatOp;
    [JSONProp('indPag')]
    property indPag: Integer read FindPag write FindPag;
    [JSONProp('serie')]
    property serie: Integer read Fserie write Fserie;
    [JSONProp('numero')]
    property nNF: Integer read FnNF write FnNF;
  end;

implementation

end.
