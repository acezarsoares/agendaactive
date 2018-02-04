unit UMensagemTipoModel;

interface

uses
  System.Generics.Collections, System.JSON, REST.JSON, Data.DB, Data.Win.ADODB;

type
  TMensagemTipoModel = class
  private
    FQtdeNAOLida: Integer;
    FIdMobileTipoMensagem: Integer;
    FNomeMobileTipoMensagem: String;

    procedure SetIdMobileTipoMensagem(const Value: Integer);
    procedure SetNomeMobileTipoMensagem(const Value: String);
    procedure SetQtdeNAOLida(const Value: Integer);

  public
    function Obter(Id: Integer): TJSONArray; // Get

    property IdMobileTipoMensagem: Integer read FIdMobileTipoMensagem write SetIdMobileTipoMensagem;
    property NomeMobileTipoMensagem: String read FNomeMobileTipoMensagem write SetNomeMobileTipoMensagem;
    property QtdeNAOLida: Integer read FQtdeNAOLida write SetQtdeNAOLida;
  end;

implementation

uses UMensagemTipoDao, uSystem.JSONUtil;

{ TMensagemTipo }

function TMensagemTipoModel.Obter(Id: Integer): TJSONArray;
var
  MensagemTipoDao: TMensagemTipoDao;
  Lista     : TObjectList<TMensagemTipoModel>;
begin
  MensagemTipoDao := TMensagemTipoDao.Create;
  try
    Lista := MensagemTipoDao.Obter(Id);
    try
      Result := TJSONUtil.ObjetoListaParaJson<TMensagemTipoModel>(Lista);
    finally
      Lista.Free;
    end;
  finally
    MensagemTipoDao.Free;
  end;
end;

procedure TMensagemTipoModel.SetIdMobileTipoMensagem(const Value: Integer);
begin
  FIdMobileTipoMensagem := Value;
end;

procedure TMensagemTipoModel.SetNomeMobileTipoMensagem(const Value: String);
begin
  FNomeMobileTipoMensagem := Value;
end;

procedure TMensagemTipoModel.SetQtdeNAOLida(const Value: Integer);
begin
  FQtdeNAOLida := Value;
end;

end.
