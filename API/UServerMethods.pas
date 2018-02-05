unit UServerMethods;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, System.JSON,

  UAcessoModel,
  UMensagemModel,
  UMensagemTipoModel,
  UServicosModel,
  UOcorrenciaModel;

type
{$METHODINFO ON}
  TAgendaEscolar_V1 = class(TComponent)
  private
    { Private declarations }
    FAcessoModel: TAcessoModel;
    FMensagemModel: TMensagemModel;
    FMensagemTipoModel: TMensagemTipoModel;
    FServicosModel: TServicosModel;
    FOcorrenciaModel: TOcorrenciaModel;
  public
    { Public declarations }
    // ### Acesso ##
    function Acesso(Login, Senha: String): TJSONArray;
    // ### Acesso ##

    // ### Mensagem ###
    function Mensagem(Id, IdTipoMensagem: Integer): TJSONArray;
    // ### Mensagem ###

    // ### MensagemTipo ###
    function MensagemTipo(Id: Integer): TJSONArray;
    // ### MensagemTipo ###

    // ### Servicos ###
    function Servicos(Id: Integer): TJSONArray;
    // ### Servicos ###

    // ### Ocorrencia ###
    function Ocorrencia(IdAluno: Integer): TJSONArray;
    // ### Ocorrencia ###
    function Escreva(Value: String): String;
  end;

  TAgendaEscolar_V2 = class(TAgendaEscolar_V1)

  end;


{$METHODINFO OFF}

implementation

{ TServerMethods }

function TAgendaEscolar_V1.Escreva(Value: String): String;
begin
  Result := Value;
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

function TAgendaEscolar_V1.Servicos(Id: Integer): TJSONArray;
begin
  Result := FServicosModel.Obter(Id);
end;

function TAgendaEscolar_V1.Ocorrencia(IdAluno: Integer): TJSONArray;
begin
  Result := FOcorrenciaModel.Obter(IdAluno)
end;


end.
