unit UMensagemModel;

interface

uses
  System.Generics.Collections, System.JSON, REST.JSON, Data.DB, Data.Win.ADODB;

type
  TMensagemModel = class
  private
    FIdMensagem: Integer;
    FMensagem: String;
    FTipoAutor: String;
    FNomeAutor: String;
    FDataHoraString: String;
    FDataHora: TDateTime;

    procedure SetIdMensagem(const Value: Integer);
    procedure SetMensagem(const Value: String);
    procedure SetTipoAutor(const Value: String);
    procedure SetNomeAutor(const Value: String);
    procedure SetDataHora(const Value: TDateTime);
    procedure SetDataHoraString(const Value: String);
  public
    function Obter(Id, IdTipoMensagem: Integer): TJSONArray; // Get

    property IdMensagem :Integer read FIdMensagem write SetIdMensagem;
    property TipoAutor :String read FTipoAutor write SetTipoAutor;
    property NomeAutor :String read FNomeAutor write SetNomeAutor;
    property DataHoraString :String read FDataHoraString write SetDataHoraString;
    property DataHora :TDateTime read FDataHora write SetDataHora;
    property Mensagem :String read FMensagem write SetMensagem;
  end;

implementation

uses UMensagemDao, uSystem.JSONUtil;

{ TMensagemModel }

function TMensagemModel.Obter(Id, IdTipoMensagem: Integer): TJSONArray;
var
  MensagemDao: TMensagemDao;
  Lista     : TObjectList<TMensagemModel>;
begin
  MensagemDao := TMensagemDao.Create;
  try
    Lista := MensagemDao.Obter(Id, IdTipoMensagem);
    try
      Result := TJSONUtil.ObjetoListaParaJson<TMensagemModel>(Lista);
    finally
      Lista.Free;
    end;
  finally
    MensagemDao.Free;
  end;
end;

procedure TMensagemModel.SetDataHora(const Value: TDateTime);
begin
  FDataHora := Value;
end;

procedure TMensagemModel.SetDataHoraString(const Value: String);
begin
  FDataHoraString := Value;
end;

procedure TMensagemModel.SetIdMensagem(const Value: Integer);
begin
  FIdMensagem := Value;
end;

procedure TMensagemModel.SetMensagem(const Value: String);
begin
  FMensagem := Value;
end;

procedure TMensagemModel.SetNomeAutor(const Value: String);
begin
  FNomeAutor := Value;
end;

procedure TMensagemModel.SetTipoAutor(const Value: String);
begin
  FTipoAutor := Value;
end;

end.
