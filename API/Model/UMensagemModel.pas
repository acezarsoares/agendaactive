unit UMensagemModel;

interface

uses
  System.Generics.Collections, System.JSON, REST.JSON, Data.DB, Data.Win.ADODB;

type
  TMensagemModel = class
  private
    FMensagem: String;
    FTipoAutor: String;
    FNomeAutor: String;
    FDataHoraString: String;
    FDataHora: TDateTime;
    FNomeMobileTipoMensagem: String;
    FIdMobileTipoMensagem: Integer;
    FIdMobileMensagem: Integer;
    FTipoPessoaRelacionada: String;
    FIdPessoaRelacionada: Integer;
    FIdAutor: Integer;

    procedure SetMensagem(const Value: String);
    procedure SetTipoAutor(const Value: String);
    procedure SetNomeAutor(const Value: String);
    procedure SetDataHora(const Value: TDateTime);
    procedure SetDataHoraString(const Value: String);
    procedure SetNomeMobileTipoMensagem(const Value: String);
    procedure SetIdMobileTipoMensagem(const Value: Integer);
    procedure SetIdMobileMensagem(const Value: Integer);
    procedure SetTipoPessoaRelacionada(const Value: String);
    procedure SetIdPessoaRelacionada(const Value: Integer);
    procedure SetIdAutor(const Value: Integer);
  public
    function Obter(Id, IdTipoMensagem: Integer): TJSONArray; // Get
    function Incluir(AJSON: TJSONObject):TJSONValue; // Put

    property IdMobileMensagem :Integer read FIdMobileMensagem write SetIdMobileMensagem;
    property IdMobileTipoMensagem: Integer read FIdMobileTipoMensagem write SetIdMobileTipoMensagem;
    property NomeMobileTipoMensagem: String read FNomeMobileTipoMensagem write SetNomeMobileTipoMensagem;
    property IdPessoaRelacionada: Integer read FIdPessoaRelacionada write SetIdPessoaRelacionada;
    property TipoPessoaRelacionada: String read FTipoPessoaRelacionada write SetTipoPessoaRelacionada;
    property IdAutor: Integer read FIdAutor write SetIdAutor;
    property TipoAutor :String read FTipoAutor write SetTipoAutor;
    property NomeAutor :String read FNomeAutor write SetNomeAutor;
    property DataHoraString :String read FDataHoraString write SetDataHoraString;
    property DataHora :TDateTime read FDataHora write SetDataHora;
    property Mensagem :String read FMensagem write SetMensagem;
  end;

implementation

uses UMensagemDao, uSystem.JSONUtil;

{ TMensagemModel }

function TMensagemModel.Incluir(AJSON: TJSONObject): TJSONValue;
var
  MensagemDao: TMensagemDao;
  MensagemModel: TMensagemModel;
begin
  MensagemModel := TJson.JsonToObject<TMensagemModel>(AJSON);
  try
    MensagemModel.IdMobileMensagem := 0;
    MensagemDao := TMensagemDao.Create;
    try
      MensagemDao.Incluir(MensagemModel);
    finally
      MensagemDao.Free;
    end;

    Result := TJson.ObjectToJsonObject(MensagemModel);
  finally
    MensagemModel.Free;
  end;
end;

function TMensagemModel.Obter(Id, IdTipoMensagem: Integer): TJSONArray;
var
  MensagemDao: TMensagemDao;
  ListaMensagem: TObjectList<TMensagemModel>;
begin
  MensagemDao := TMensagemDao.Create;
  try
    ListaMensagem := MensagemDao.Obter(Id, IdTipoMensagem);
    try
      Result := TJSONUtil.ObjetoListaParaJson<TMensagemModel>(ListaMensagem);
    finally
      ListaMensagem.Free;
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

procedure TMensagemModel.SetIdAutor(const Value: Integer);
begin
  FIdAutor := Value;
end;

procedure TMensagemModel.SetIdMobileMensagem(const Value: Integer);
begin
  FIdMobileMensagem := Value;
end;

procedure TMensagemModel.SetIdMobileTipoMensagem(const Value: Integer);
begin
  FIdMobileTipoMensagem := Value;
end;

procedure TMensagemModel.SetIdPessoaRelacionada(const Value: Integer);
begin
  FIdPessoaRelacionada := Value;
end;

procedure TMensagemModel.SetMensagem(const Value: String);
begin
  FMensagem := Value;
end;

procedure TMensagemModel.SetNomeAutor(const Value: String);
begin
  FNomeAutor := Value;
end;

procedure TMensagemModel.SetNomeMobileTipoMensagem(const Value: String);
begin
  FNomeMobileTipoMensagem := Value;
end;

procedure TMensagemModel.SetTipoAutor(const Value: String);
begin
  FTipoAutor := Value;
end;

procedure TMensagemModel.SetTipoPessoaRelacionada(const Value: String);
begin
  FTipoPessoaRelacionada := Value;
end;

end.
