unit UAcessoModel;

interface

uses
  System.Generics.Collections, System.JSON, REST.JSON, Data.DB, Data.Win.ADODB;

type
  TAcessoModel = class
  private
    FEmail: String;
    FId: Integer;
    FLogin: String;
    FNome: String;
    FTipo: String;
    Ftoken:String;

    procedure SetEmail(const Value: String);
    procedure SetId(const Value: Integer);
    procedure SetLogin(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetTipo(const Value: String);
    procedure SetToken(const Value: String);
  public
    function Logar(Login, Senha: String): TJSONArray;

    property Id       :Integer read FId write SetId;
    property Nome     :String read FNome write SetNome;
    property Tipo     :String read FTipo write SetTipo;
    property Email    :String read FEmail write SetEmail;
    property Login    :String read FLogin write SetLogin;
    property Token    :String read FToken write SetToken;
  end;

implementation

{ TAcessoModel }

uses UAcessoDao, uSystem.JSONUtil  , UTokenModel;


function TAcessoModel.Logar(Login, Senha: String): TJSONArray;
var
  AcessoDao: TAcessoDao;
  Lista     : TObjectList<TAcessoModel>;
begin
  AcessoDao := TAcessoDao.Create;
  Result := TJSONArray.Create;
  try
    Lista := AcessoDao.Logar(Login, Senha);
    try
      Result := TJSONUtil.ObjetoListaParaJson<TAcessoModel>(Lista);
    finally
      Lista.Free;
    end;
  finally
    AcessoDao.Free;
  end;
end;

procedure TAcessoModel.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TAcessoModel.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TAcessoModel.SetLogin(const Value: String);
begin
  FLogin := Value;
end;

procedure TAcessoModel.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TAcessoModel.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

procedure TAcessoModel.SetToken(const Value: String);
begin
    FToken := TToken.Create().Token;
end;

end.
