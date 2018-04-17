unit UServerMethods;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, System.JSON,
  UTokenModel, UArquivosDao,
  UAcessoModel,
  UMensagemModel,
  UMensagemTipoModel,
  UServicosModel,
  UOcorrenciaModel,
  UTimeLineModel;

type
{$METHODINFO ON}
  TAgendaEscolar_V1 = class(TComponent)
  private
    { Private declarations }
    FAcessoModel      : TAcessoModel;
    FMensagemModel    : TMensagemModel;
    FMensagemTipoModel: TMensagemTipoModel;
    FServicosModel    : TServicosModel;
    FOcorrenciaModel  : TOcorrenciaModel;
    FTimeLineModel    : TTimeLineModel;
  public
    { Public declarations }
    fcount :Integer;

    {$Region 'Acesso'}
    function Acesso(Login, Senha: String): TJSONArray;
    {$endRegion}

    {$Region 'Mensagem'}
    function Mensagem(Id, IdTipoMensagem: Integer): TJSONArray;  // Get
    function updateMensagem(AJSON: TJSONObject): TJSONValue; // Put
    {$EndRegion}

    {$Region 'MensagemTipo'}
    function MensagemTipo(Id: Integer): TJSONArray;
    {$EndRegion}

    {$Region 'Servicos'}
    function Servicos(Id: Integer): TJSONArray;
    {$EndRegion}

    {$Region 'Ocorrencia'}
    function Ocorrencia(IdAluno: Integer): TJSONArray;
    {$EndRegion}

    {$Region 'Timeline'}
    function TimeLine(IdResponsavel: Integer): TJSONArray;
    {$EndRegion}

    {$Region 'Varios'}
    function Escreva(Value: String): String;
    function count():String;
    {$EndRegion}

    {$Region 'Arquivos'}
    function updateSendFile( Param:TJsonObject):String;
    {$EndRegion}


  end;

  TAgendaEscolar_V2 = class(TAgendaEscolar_V1)

  end;


{$METHODINFO OFF}

implementation

{ TServerMethods }


function TAgendaEscolar_V1.count: String;
begin
  inc(fcount);
  result := FormatFloat('000',fcount);
end;

function TAgendaEscolar_V1.Escreva(Value: String): String;
begin
  Result := Value;
end;

function TAgendaEscolar_V1.updateMensagem(AJSON: TJSONObject): TJSONValue;
begin
  Result := FMensagemModel.Incluir(AJSON);
end;

function TAgendaEscolar_V1.Acesso(Login, Senha: String): TJSONArray;
begin
  Result := FAcessoModel.Logar(Login, Senha);
end;

function TAgendaEscolar_V1.Mensagem(Id, IdTipoMensagem: Integer): TJSONArray;
begin
  Result := FMensagemModel.Obter(Id, IdTipoMensagem);
end;

function TAgendaEscolar_V1.MensagemTipo(Id: Integer): TJSONArray;
begin
  Result := FMensagemTipoModel.Obter(Id);
end;

function TAgendaEscolar_V1.updateSendFile( Param: TJsonObject):String;
var
  arq : TArquivos;
begin
   arq := TArquivos.Create;
   arq.GravarArquivo(Param);
end;

function TAgendaEscolar_V1.Servicos(Id: Integer): TJSONArray;
begin
  Result := FServicosModel.Obter(Id);
end;

function TAgendaEscolar_V1.TimeLine(IdResponsavel: Integer): TJSONArray;
begin
  Result := FTimeLineModel.Obter(IdResponsavel);
end;

function TAgendaEscolar_V1.Ocorrencia(IdAluno: Integer): TJSONArray;
begin
  Result := FOcorrenciaModel.Obter(IdAluno)
end;



end.

