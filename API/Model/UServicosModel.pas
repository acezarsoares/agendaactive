unit UServicosModel;

interface

uses
  System.Generics.Collections, System.JSON, REST.JSON, Data.DB, Data.Win.ADODB;

type
  TServicosModel = class
  private
    FIdAluno: Integer;
    FNomeAluno: String;
    FMatricula: String;

    procedure SetIdAluno(const Value: Integer);
    procedure SetMatricula(const Value: String);
    procedure SetNomeAluno(const Value: String);
  public
    function Obter(Id: Integer): TJSONArray; // Get

    property IdAluno :Integer read FIdAluno write SetIdAluno;
    property Matricula :String read FMatricula write SetMatricula;
    property NomeAluno :String read FNomeAluno write SetNomeAluno;

  end;

implementation

uses UServicosDao, uSystem.JSONUtil;

{ TServicoModel }

function TServicosModel.Obter(Id: Integer): TJSONArray;
var
  ServicosDao: TServicosDao;
  Lista     : TObjectList<TServicosModel>;
begin
  ServicosDao := TServicosDao.Create;
  try
    Lista := ServicosDao.Obter(Id);
    try
      Result := TJSONUtil.ObjetoListaParaJson<TServicosModel>(Lista);
    finally
      Lista.Free;
    end;
  finally
    ServicosDao.Free;
  end;
end;

procedure TServicosModel.SetIdAluno(const Value: Integer);
begin
  FIdAluno := Value;
end;

procedure TServicosModel.SetMatricula(const Value: String);
begin
  FMatricula := Value;
end;

procedure TServicosModel.SetNomeAluno(const Value: String);
begin
  FNomeAluno := Value;
end;

end.
