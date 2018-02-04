unit UOcorrenciaModel;

interface

uses
  System.Generics.Collections, System.JSON, REST.JSON, Data.DB, Data.Win.ADODB;

type
  TOcorrenciaModel = class
  private
    FDataOcorrencia: TDateTime;
    FOcorrencia: String;
    FNomeAluno: String;
    FIdOcorrencia: Integer;
    FNomeTipoOcorrencia: String;
    FDataOcorrenciaString: String;
    procedure SetDataOcorrencia(const Value: TDateTime);
    procedure SetDataOcorrenciaString(const Value: String);
    procedure SetIdOcorrencia(const Value: Integer);
    procedure SetNomeAluno(const Value: String);
    procedure SetNomeTipoOcorrencia(const Value: String);
    procedure SetOcorrencia(const Value: String);
  public
    function Obter(IdAluno: Integer): TJSONArray; // Get

    property IdOcorrencia :Integer read FIdOcorrencia write SetIdOcorrencia;
    property NomeAluno: String read FNomeAluno write SetNomeAluno;
    property DataOcorrenciaString: String read FDataOcorrenciaString write SetDataOcorrenciaString;
    property DataOcorrencia: TDateTime read FDataOcorrencia write SetDataOcorrencia;
    property NomeTipoOcorrencia: String read FNomeTipoOcorrencia write SetNomeTipoOcorrencia;
    property Ocorrencia: String read FOcorrencia write SetOcorrencia;
  end;


implementation

uses UOcorrenciaDao, uSystem.JSONUtil;

{ TOcorrenciaModel }

function TOcorrenciaModel.Obter(IdAluno: Integer): TJSONArray;
var
  OcorrenciaDao: TOcorrenciaDao;
  Lista     : TObjectList<TOcorrenciaModel>;
begin
  OcorrenciaDao := TOcorrenciaDao.Create;
  try
    Lista := OcorrenciaDao.Obter(IdAluno);
    try
      Result := TJSONUtil.ObjetoListaParaJson<TOcorrenciaModel>(Lista);
    finally
      Lista.Free;
    end;
  finally
    OcorrenciaDao.Free;
  end;
end;

procedure TOcorrenciaModel.SetDataOcorrencia(const Value: TDateTime);
begin
  FDataOcorrencia := Value;
end;

procedure TOcorrenciaModel.SetDataOcorrenciaString(const Value: String);
begin
  FDataOcorrenciaString := Value;
end;

procedure TOcorrenciaModel.SetIdOcorrencia(const Value: Integer);
begin
  FIdOcorrencia := Value;
end;

procedure TOcorrenciaModel.SetNomeAluno(const Value: String);
begin
  FNomeAluno := Value;
end;

procedure TOcorrenciaModel.SetNomeTipoOcorrencia(const Value: String);
begin
  FNomeTipoOcorrencia := Value;
end;

procedure TOcorrenciaModel.SetOcorrencia(const Value: String);
begin
  FOcorrencia := Value;
end;

end.
