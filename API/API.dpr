library API;

uses
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
  Web.Win.ISAPIThreadPool,
  Data.DBXCommon,
  Datasnap.DSSession,
  UServerMethods in 'UServerMethods.pas',
  UWebModule in 'UWebModule.pas' {WebModule1: TWebModule},
  UAcessoModel in 'Model\UAcessoModel.pas',
  USystem.JSONUtil in 'Model\USystem.JSONUtil.pas',
  UAcessoDao in 'Dao\UAcessoDao.pas',
  UConexao in 'Dao\UConexao.pas',
  uSistemaControl in 'Controle\uSistemaControl.pas',
  PFuncoes in 'Comum\PFuncoes.pas',
  UMensagemTipoModel in 'Model\UMensagemTipoModel.pas',
  UMensagemTipoDao in 'Dao\UMensagemTipoDao.pas',
  UMensagemModel in 'Model\UMensagemModel.pas',
  UMensagemDao in 'Dao\UMensagemDao.pas',
  UOcorrenciaModel in 'Model\UOcorrenciaModel.pas',
  UOcorrenciaDao in 'Dao\UOcorrenciaDao.pas',
  UServicosModel in 'Model\UServicosModel.pas',
  UServicosDao in 'Dao\UServicosDao.pas',
  UTokenModel in 'Model\UTokenModel.pas',
  UTimeLineModel in 'Model\UTimeLineModel.pas',
  UTimeLineDao in 'Dao\UTimeLineDao.pas';

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

procedure TerminateThreads;
begin
  TDSSessionManager.Instance.Free;
  Data.DBXCommon.TDBXScheduler.Instance.Free;
end;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  TISAPIApplication(Application).OnTerminate := TerminateThreads;

  Application.Run;
end.
