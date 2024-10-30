unit usecase.actions;

interface

uses
  serializable.response,
  servidor.components,
  models.contracts,
  serializable.notafiscal;

type
  TAction = class
  private
    FComponent: IComponent;
    FFactory: IFactoryModels;

  protected
    procedure ConfiguraEmitente;
    procedure ConfiguraIde;
    procedure ConfigurarComponente;
    procedure AlimetarNFC(Value: TNotaFiscal);
  public
    constructor Create;

    function Emitir(Value: TNotaFiscal): TResponse;
  end;

implementation

uses
  System.SysUtils,
  System.Classes,
  models.factory,
  ACBrDFeSSL,
  pcnConversao,
  pcnConversaoNFe,
  blcksock,
  ACBrDFeUtil;

procedure TAction.AlimetarNFC(Value: TNotaFiscal);
begin
  var LNotasFiscais := FComponent.ACBrNFe.NotasFiscais.Add;
  LNotasFiscais.NFe.Ide.natOp := Value.ide.natOp;
  LNotasFiscais.NFe.Ide.indPag := TpcnIndicadorPagamento(Value.ide.indPag);
  LNotasFiscais.NFe.Ide.modelo := FFactory.Ide.modelo;
  LNotasFiscais.NFe.Ide.serie := Value.ide.serie;
  LNotasFiscais.NFe.Ide.nNF := Value.ide.nNF;
  LNotasFiscais.NFe.Ide.cNF := GerarCodigoDFe(Value.ide.nNF);
  LNotasFiscais.NFe.Ide.dEmi := now;
  LNotasFiscais.NFe.Ide.dSaiEnt := now;
  LNotasFiscais.NFe.Ide.hSaiEnt := now;
  LNotasFiscais.NFe.Ide.tpNF := tnSaida;
  LNotasFiscais.NFe.Ide.tpEmis := TpcnTipoEmissao(FFactory.Ide.tpEmis);
  LNotasFiscais.NFe.Ide.tpAmb := TpcnTipoAmbiente(FFactory.Ide.tpAmb);
  LNotasFiscais.NFe.Ide.cUF := UFtoCUF(FFactory.Emitente.UF);
  LNotasFiscais.NFe.Ide.cMunFG := FFactory.Emitente.cMun;
  LNotasFiscais.NFe.Ide.finNFe := TpcnFinalidadeNFe(FFactory.Ide.finNFe);
  LNotasFiscais.NFe.Ide.tpImp := tiNFCe;
  LNotasFiscais.NFe.Ide.indFinal := cfConsumidorFinal;
  LNotasFiscais.NFe.Ide.indPres := pcPresencial;
  LNotasFiscais.NFe.Ide.indIntermed := iiSemOperacao;

  LNotasFiscais.NFe.Emit.CNPJCPF := FFactory.Emitente.CNPJCPF;
  LNotasFiscais.NFe.Emit.IE := FFactory.Emitente.IE;
  LNotasFiscais.NFe.Emit.xNome := FFactory.Emitente.xNome;
  LNotasFiscais.NFe.Emit.xFant := FFactory.Emitente.xFant;

  LNotasFiscais.NFe.Emit.EnderEmit.fone := FFactory.Emitente.fone;
  LNotasFiscais.NFe.Emit.EnderEmit.CEP := FFactory.Emitente.CEP;
  LNotasFiscais.NFe.Emit.EnderEmit.xLgr := FFactory.Emitente.xLgr;
  LNotasFiscais.NFe.Emit.EnderEmit.nro := FFactory.Emitente.nro;
  LNotasFiscais.NFe.Emit.EnderEmit.xCpl := FFactory.Emitente.xCpl;
  LNotasFiscais.NFe.Emit.EnderEmit.xBairro := FFactory.Emitente.xBairro;
  LNotasFiscais.NFe.Emit.EnderEmit.cMun := FFactory.Emitente.cMun;
  LNotasFiscais.NFe.Emit.EnderEmit.xMun := FFactory.Emitente.xMun;
  LNotasFiscais.NFe.Emit.EnderEmit.UF := FFactory.Emitente.UF;
  LNotasFiscais.NFe.Emit.EnderEmit.cPais := 1058;
  LNotasFiscais.NFe.Emit.EnderEmit.xPais := 'BRASIL';
  LNotasFiscais.NFe.Emit.IEST := '';
  var Ok: Boolean;
  LNotasFiscais.NFe.Emit.CRT := StrToCRT(Ok, FFactory.Emitente.CRT);

  LNotasFiscais.NFe.Retirada.CNPJCPF := '';
  LNotasFiscais.NFe.Retirada.xLgr := '';
  LNotasFiscais.NFe.Retirada.nro := '';
  LNotasFiscais.NFe.Retirada.xCpl := '';
  LNotasFiscais.NFe.Retirada.xBairro := '';
  LNotasFiscais.NFe.Retirada.cMun := 0;
  LNotasFiscais.NFe.Retirada.xMun := '';
  LNotasFiscais.NFe.Retirada.UF := '';

  LNotasFiscais.NFe.Entrega.CNPJCPF := '';
  LNotasFiscais.NFe.Entrega.xLgr := '';
  LNotasFiscais.NFe.Entrega.nro := '';
  LNotasFiscais.NFe.Entrega.xCpl := '';
  LNotasFiscais.NFe.Entrega.xBairro := '';
  LNotasFiscais.NFe.Entrega.cMun := 0;
  LNotasFiscais.NFe.Entrega.xMun := '';
  LNotasFiscais.NFe.Entrega.UF := '';

  var LProd := LNotasFiscais.NFe.Det.New;
  LProd.Prod.nItem := Value.produto[0].nItem;
  LProd.Prod.cProd := Value.produto[0].cProd;
  LProd.Prod.cEAN := Value.produto[0].cEAN;
  LProd.Prod.xProd := Value.produto[0].xProd;
  LProd.Prod.NCM := Value.produto[0].NCM;
  LProd.Prod.EXTIPI := Value.produto[0].EXTIPI;
  LProd.Prod.CFOP := Value.produto[0].CFOP;
  LProd.Prod.uCom := Value.produto[0].uCom;
  LProd.Prod.qCom := Value.produto[0].qCom;
  LProd.Prod.vUnCom := Value.produto[0].vUnCom;
  LProd.Prod.vProd := Value.produto[0].vProd;

  LProd.Prod.cEANTrib := Value.produto[0].cEAN;
  LProd.Prod.uTrib := Value.produto[0].uCom;
  LProd.Prod.qTrib := Value.produto[0].qCom;
  LProd.Prod.vUnTrib := Value.produto[0].vUnCom;

  LProd.Prod.vOutro := 0;
  LProd.Prod.vFrete := 0;
  LProd.Prod.vSeg := 0;
  LProd.Prod.vDesc := 0;

  LProd.Prod.CEST := Value.produto[0].CEST;

  LProd.Prod.cBarra := Value.produto[0].cBarra;
  LProd.Prod.cBarraTrib := Value.produto[0].cBarra;

  LProd.Imposto.vTotTrib := 0;

  if LNotasFiscais.NFe.Emit.CRT in [crtSimplesExcessoReceita, crtRegimeNormal] then
    LProd.Imposto.ICMS.CST := cst00
  else
    LProd.Imposto.ICMS.CSOSN := csosn102;

  LProd.Imposto.ICMS.orig := oeNacional;
  LProd.Imposto.ICMS.modBC := dbiValorOperacao;

  LProd.Imposto.ICMS.vBC := 0;
  LProd.Imposto.ICMS.pICMS := 18;

  LProd.Imposto.ICMS.vICMS := (LProd.Imposto.ICMS.vBC * LProd.Imposto.ICMS.pICMS);
  LProd.Imposto.ICMS.modBCST := dbisMargemValorAgregado;
  LProd.Imposto.ICMS.pMVAST := 0;
  LProd.Imposto.ICMS.pRedBCST := 0;
  LProd.Imposto.ICMS.vBCST := 0;
  LProd.Imposto.ICMS.pICMSST := 0;
  LProd.Imposto.ICMS.vICMSST := 0;
  LProd.Imposto.ICMS.pRedBC := 0;

  LProd.Imposto.ICMS.pCredSN := 5;
  LProd.Imposto.ICMS.vCredICMSSN := 50;
  LProd.Imposto.ICMS.vBCFCPST := 100;
  LProd.Imposto.ICMS.pFCPST := 2;
  LProd.Imposto.ICMS.vFCPST := 2;
  LProd.Imposto.ICMS.vBCSTRet := 0;
  LProd.Imposto.ICMS.pST := 0;
  LProd.Imposto.ICMS.vICMSSubstituto := 0;
  LProd.Imposto.ICMS.vICMSSTRet := 0;

  LProd.Imposto.ICMS.vBCFCPSTRet := 0;
  LProd.Imposto.ICMS.pFCPSTRet := 0;
  LProd.Imposto.ICMS.vFCPSTRet := 0;
  LProd.Imposto.ICMS.pRedBCEfet := 0;
  LProd.Imposto.ICMS.vBCEfet := 0;
  LProd.Imposto.ICMS.pICMSEfet := 0;
  LProd.Imposto.ICMS.vICMSEfet := 0;

  LProd.Imposto.ICMS.vICMSSTDeson := 0;

  LProd.Imposto.ICMS.motDesICMSST := mdiOutros;

  LProd.Imposto.ICMS.pFCPDif := 0;

  LProd.Imposto.ICMS.vFCPDif := 0;

  LProd.Imposto.ICMS.vFCPEfet := 0;

  LProd.Imposto.ICMSUFDest.vBCUFDest := 0.00;
  LProd.Imposto.ICMSUFDest.pFCPUFDest := 0.00;
  LProd.Imposto.ICMSUFDest.pICMSUFDest := 0.00;
  LProd.Imposto.ICMSUFDest.pICMSInter := 0.00;
  LProd.Imposto.ICMSUFDest.pICMSInterPart := 0.00;
  LProd.Imposto.ICMSUFDest.vFCPUFDest := 0.00;
  LProd.Imposto.ICMSUFDest.vICMSUFDest := 0.00;
  LProd.Imposto.ICMSUFDest.vICMSUFRemet := 0.00;

  LProd.Imposto.PIS.CST := pis99;
  LProd.Imposto.PIS.vBC := 0;
  LProd.Imposto.PIS.pPIS := 0;
  LProd.Imposto.PIS.vPIS := 0;

  LProd.Imposto.PIS.qBCProd := 0;
  LProd.Imposto.PIS.vAliqProd := 0;
  LProd.Imposto.PIS.vPIS := 0;

  LProd.Imposto.PISST.vBC := 0;
  LProd.Imposto.PISST.pPIS := 0;
  LProd.Imposto.PISST.qBCProd := 0;
  LProd.Imposto.PISST.vAliqProd := 0;
  LProd.Imposto.PISST.vPIS := 0;

  LProd.Imposto.PISST.IndSomaPISST := ispNenhum;

  LProd.Imposto.COFINS.CST := cof99;
  LProd.Imposto.COFINS.vBC := 0;
  LProd.Imposto.COFINS.pCOFINS := 0;
  LProd.Imposto.COFINS.vCOFINS := 0;

  LProd.Imposto.COFINS.qBCProd := 0;
  LProd.Imposto.COFINS.vAliqProd := 0;

  LProd.Imposto.COFINSST.vBC := 0;
  LProd.Imposto.COFINSST.pCOFINS := 0;
  LProd.Imposto.COFINSST.qBCProd := 0;
  LProd.Imposto.COFINSST.vAliqProd := 0;
  LProd.Imposto.COFINSST.vCOFINS := 0;

  LProd.Imposto.COFINSST.indSomaCOFINSST := iscNenhum;


  LNotasFiscais.NFe.Total.ICMSTot.vBC := 0;
  LNotasFiscais.NFe.Total.ICMSTot.vICMS := 0;
  LNotasFiscais.NFe.Total.ICMSTot.vBCST := 0;
  LNotasFiscais.NFe.Total.ICMSTot.vST := 0;
  LNotasFiscais.NFe.Total.ICMSTot.vProd := 100;
  LNotasFiscais.NFe.Total.ICMSTot.vFrete := 0;
  LNotasFiscais.NFe.Total.ICMSTot.vSeg := 0;
  LNotasFiscais.NFe.Total.ICMSTot.vDesc := 0;
  LNotasFiscais.NFe.Total.ICMSTot.vII := 0;
  LNotasFiscais.NFe.Total.ICMSTot.vIPI := 0;
  LNotasFiscais.NFe.Total.ICMSTot.vPIS := 0;
  LNotasFiscais.NFe.Total.ICMSTot.vCOFINS := 0;
  LNotasFiscais.NFe.Total.ICMSTot.vOutro := 0;
  LNotasFiscais.NFe.Total.ICMSTot.vNF := 100;

  LNotasFiscais.NFe.Total.ICMSTot.vFCPUFDest := 0.00;
  LNotasFiscais.NFe.Total.ICMSTot.vICMSUFDest := 0.00;
  LNotasFiscais.NFe.Total.ICMSTot.vICMSUFRemet := 0.00;

  LNotasFiscais.NFe.Total.ISSQNtot.vServ := 0;
  LNotasFiscais.NFe.Total.ISSQNtot.vBC := 0;
  LNotasFiscais.NFe.Total.ISSQNtot.vISS := 0;
  LNotasFiscais.NFe.Total.ISSQNtot.vPIS := 0;
  LNotasFiscais.NFe.Total.ISSQNtot.vCOFINS := 0;

  LNotasFiscais.NFe.Total.retTrib.vRetPIS := 0;
  LNotasFiscais.NFe.Total.retTrib.vRetCOFINS := 0;
  LNotasFiscais.NFe.Total.retTrib.vRetCSLL := 0;
  LNotasFiscais.NFe.Total.retTrib.vBCIRRF := 0;
  LNotasFiscais.NFe.Total.retTrib.vIRRF := 0;
  LNotasFiscais.NFe.Total.retTrib.vBCRetPrev := 0;
  LNotasFiscais.NFe.Total.retTrib.vRetPrev := 0;

  LNotasFiscais.NFe.Transp.modFrete := mfSemFrete; // NFC-e não pode ter FRETE

  var LPag := LNotasFiscais.NFe.pag.New;
  LPag.tPag := TpcnFormaPagamento(Value.pagamento[0].tPag);
  LPag.vPag := Value.pagamento[0].valor;

  LNotasFiscais.NFe.InfAdic.infCpl := '';
  LNotasFiscais.NFe.InfAdic.infAdFisco := '';

  var LInfCont := LNotasFiscais.NFe.InfAdic.obsCont.New;
  LInfCont.xCampo := 'ObsCont';
  LInfCont.xTexto := 'Texto';

  var LInfFisco := LNotasFiscais.NFe.InfAdic.obsFisco.New;
  LInfFisco.xCampo := 'ObsFisco';
  LInfFisco.xTexto := 'Texto';

  LNotasFiscais.NFe.infIntermed.CNPJ := '';
  LNotasFiscais.NFe.infIntermed.idCadIntTran := '';
end;

procedure TAction.ConfiguraEmitente;
begin
  FFactory
    .Emitente
      .CNPJCPF('69.596.834/0001-08')
      .IE('382054352771')
      .xNome('Juliana e Bryan Padaria Ltda')
      .xFant('Juliana e Bryan Padaria Ltda')
      .fone('1436650267')
      .CEP(19907230)
      .xLgr('Rua Doze de Outubro')
      .nro('782')
      .xBairro('Vila Margarida')
      .xMun('Ourinhos')
      .cMun(3534708)
      .UF('SP')
      .CRT('1');
end;

procedure TAction.ConfiguraIde;
begin
  FFactory
    .Ide
      .modelo(65)
      .tpEmis(0)
      .tpAmb(1)
      .finNFe(0);
end;

procedure TAction.ConfigurarComponente;
begin
  FComponent.ACBrNFe.Configuracoes.Certificados.URLPFX :=
    FFactory.Configuracoes.Certificado.URL;
  FComponent.ACBrNFe.Configuracoes.Certificados.ArquivoPFX :=
    FFactory.Configuracoes.Certificado.Caminho;
  FComponent.ACBrNFe.Configuracoes.Certificados.Senha :=
    FFactory.Configuracoes.Certificado.Senha;
  FComponent.ACBrNFe.Configuracoes.Certificados.NumeroSerie :=
    FFactory.Configuracoes.Certificado.serie;

  FComponent.ACBrNFe.SSL.DescarregarCertificado;

  FComponent.ACBrNFe.Configuracoes.Geral.SSLLib := TSSLLib(FFactory.Configuracoes.SSLLib);
  FComponent.ACBrNFe.Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(FFactory.Configuracoes.SSLCryptLib);
  FComponent.ACBrNFe.Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(FFactory.Configuracoes.SSLHttpLib);
  FComponent.ACBrNFe.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(FFactory.Configuracoes.SSLXmlSignLib);

  FComponent.ACBrNFe.Configuracoes.Geral.AtualizarXMLCancelado := FFactory.Configuracoes.AtualizarXMLCancelado;

  FComponent.ACBrNFe.Configuracoes.Geral.Salvar := FFactory.Configuracoes.Salvar;
  FComponent.ACBrNFe.Configuracoes.Geral.ExibirErroSchema := FFactory.Configuracoes.ExibirErroSchema;
  FComponent.ACBrNFe.Configuracoes.Geral.RetirarAcentos := FFactory.Configuracoes.RetirarAcentos;
  FComponent.ACBrNFe.Configuracoes.Geral.FormatoAlerta := FFactory.Configuracoes.FormatoAlerta;
  FComponent.ACBrNFe.Configuracoes.Geral.FormaEmissao := TpcnTipoEmissao(FFactory.Configuracoes.FormaEmissao);
  FComponent.ACBrNFe.Configuracoes.Geral.ModeloDF := TpcnModeloDF(FFactory.Configuracoes.ModeloDF);
  FComponent.ACBrNFe.Configuracoes.Geral.VersaoDF := TpcnVersaoDF(FFactory.Configuracoes.VersaoDF);

  FComponent.ACBrNFe.Configuracoes.Geral.IdCSC := FFactory.Configuracoes.IdCSC;
  FComponent.ACBrNFe.Configuracoes.Geral.CSC := FFactory.Configuracoes.CSC;
  FComponent.ACBrNFe.Configuracoes.Geral.VersaoQRCode := TpcnVersaoQrCode(FFactory.Configuracoes.VersaoQRCode);

  FComponent.ACBrNFe.Configuracoes.WebServices.UF := FFactory.Configuracoes.WebService.UF;
  var Ok: Boolean;
  FComponent.ACBrNFe.Configuracoes.WebServices.Ambiente := StrToTpAmb(Ok,
      IntToStr(FFactory.Configuracoes.WebService.Ambiente));
  FComponent.ACBrNFe.Configuracoes.WebServices.Visualizar := FFactory.Configuracoes.WebService.Visualizar;
  FComponent.ACBrNFe.Configuracoes.WebServices.Salvar := FFactory.Configuracoes.WebService.Salvar;

  FComponent.ACBrNFe.Configuracoes.WebServices.AjustaAguardaConsultaRet := FFactory.Configuracoes.WebService.
    AjustaAguardaConsultaRet;

  FComponent.ACBrNFe.Configuracoes.WebServices.AguardarConsultaRet := FFactory.Configuracoes.WebService.
    AguardarConsultaRet;

  FComponent.ACBrNFe.Configuracoes.WebServices.Tentativas := FFactory.Configuracoes.WebService.Tentativas;

  FComponent.ACBrNFe.Configuracoes.WebServices.IntervaloTentativas := FFactory.Configuracoes.WebService.
      IntervaloTentativas;

  FComponent.ACBrNFe.Configuracoes.WebServices.TimeOut := FFactory.Configuracoes.WebService.TimeOut;
  FComponent.ACBrNFe.Configuracoes.WebServices.ProxyHost := FFactory.Configuracoes.WebService.ProxyHost;
  FComponent.ACBrNFe.Configuracoes.WebServices.ProxyPort := FFactory.Configuracoes.WebService.ProxyPort;
  FComponent.ACBrNFe.Configuracoes.WebServices.ProxyUser := FFactory.Configuracoes.WebService.ProxyUser;
  FComponent.ACBrNFe.Configuracoes.WebServices.ProxyPass := FFactory.Configuracoes.WebService.ProxyPass;

  FComponent.ACBrNFe.SSL.SSLType := TSSLType(FFactory.Configuracoes.SSLType);

  FComponent.ACBrNFe.Configuracoes.Arquivos.Salvar := FFactory.Configuracoes.Arquivo.Salvar;
  FComponent.ACBrNFe.Configuracoes.Arquivos.SepararPorMes := FFactory.Configuracoes.Arquivo.SepararPorMes;
  FComponent.ACBrNFe.Configuracoes.Arquivos.AdicionarLiteral := FFactory.Configuracoes.Arquivo.AdicionarLiteral;
  FComponent.ACBrNFe.Configuracoes.Arquivos.EmissaoPathNFe := FFactory.Configuracoes.Arquivo.EmissaoPathNFe;
  FComponent.ACBrNFe.Configuracoes.Arquivos.SalvarEvento := FFactory.Configuracoes.Arquivo.SalvarEvento;
  FComponent.ACBrNFe.Configuracoes.Arquivos.SepararPorCNPJ := FFactory.Configuracoes.Arquivo.SepararPorCNPJ;
  FComponent.ACBrNFe.Configuracoes.Arquivos.SepararPorModelo := FFactory.Configuracoes.Arquivo.SepararPorModelo;
  FComponent.ACBrNFe.Configuracoes.Arquivos.PathSchemas := FFactory.Configuracoes.Arquivo.PathSchemas;
  FComponent.ACBrNFe.Configuracoes.Arquivos.PathNFe := FFactory.Configuracoes.Arquivo.PathNFe;
  FComponent.ACBrNFe.Configuracoes.Arquivos.PathInu := FFactory.Configuracoes.Arquivo.PathInu;
  FComponent.ACBrNFe.Configuracoes.Arquivos.PathEvento := FFactory.Configuracoes.Arquivo.PathEvento;
  FComponent.ACBrNFe.Configuracoes.Arquivos.PathSalvar := FFactory.Configuracoes.Arquivo.PathSalvar;

  FComponent.ACBrNFe.DANFE.Logo := FFactory.Configuracoes.Logo;
  FComponent.ACBrNFe.DANFE.PathPDF := FFactory.Configuracoes.PathPDF;
end;

constructor TAction.Create;
begin
  FComponent := TComponentes.Create(nil);
  FFactory := TFactoryModels.New;
end;

function TAction.Emitir(Value: TNotaFiscal): TResponse;
begin;
  Result := TResponse.Create;
  ConfigurarComponente;
  ConfiguraEmitente;
  ConfiguraIde;
  AlimetarNFC(Value);

  FComponent.ACBrNFe.NotasFiscais.ImprimirPDF;

  Result.id := TGUID.NewGuid.ToString();
  Result.ambiente :=  TpAmbToStr(TpcnTipoAmbiente(FFactory.Configuracoes.WebService.Ambiente));
  Result.created := now;
  Result.status := 100;
  Result.motivo := 'Emitida a NFC';
  Result.protocolo := '123456567';
  Result.chave := 'Chave NFC';
  Result.xml :=   'Caminho XML';
  Result.pdf := 'Caminho PDF';
end;

end.
