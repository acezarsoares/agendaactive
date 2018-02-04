unit UMensagemDao;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client, System.SysUtils,

  UMensagemModel;


type
  TMensagemDao = class
  public
    function Obter(Id, IdTipoMensagem: Integer): TObjectList<TMensagemModel>;
  end;

implementation

uses USistemaControl, PFuncoes;

{ TMensagemDao }

function TMensagemDao.Obter(Id, IdTipoMensagem: Integer): TObjectList<TMensagemModel>;
var
  Qry    : TFDQuery;
  Lista  : TObjectList<TMensagemModel>;
  MensagemModel: TMensagemModel;
begin
  Qry := TSistemaControl.GetInstance().Conexao.CriarQuery();
  Lista := TObjectList<TMensagemModel>.Create;
  try
    Qry.SQL.Text := 'SELECT	IdMobileMensagem,  ' +
                    '       TipoAutor, ' +
                    '       NomeAutor, ' +
                    '       DataHoraString = CONVERT( VARCHAR, DataHora, 103 ) + '' '' + CONVERT( VARCHAR, DataHora, 108 ), ' +
                    '       DataHora, ' +
                    '       Mensagem ' +
	                  'FROM VwMobileMensagem ' +
	                  'WHERE IdMobileTipoMensagem = :IdMobileTipoMensagem ' +
                    'AND IdPessoaRelacionada = :IdPessoaRelacionada ' +
                  	'ORDER BY IdMobileTipoMensagem, IdPessoaRelacionada, DataHora';

    Qry.ParamByName('IdMobileTipoMensagem').Value := IdTipoMensagem;
    Qry.ParamByName('IdPessoaRelacionada').Value := Id;
    Qry.Open;

    Qry.First;
    while Not Qry.Eof do
    begin
      MensagemModel := TMensagemModel.Create;
      MensagemModel.IdMensagem      := Qry.FieldByName('IdMobileMensagem').AsInteger;
      MensagemModel.TipoAutor       := Qry.FieldByName('TipoAutor').AsString;
      MensagemModel.NomeAutor       := Qry.FieldByName('NomeAutor').AsString;
      MensagemModel.DataHoraString  := Qry.FieldByName('DataHoraString').AsString;
      MensagemModel.DataHora        := Qry.FieldByName('DataHora').AsDateTime;
      MensagemModel.Mensagem        := Qry.FieldByName('Mensagem').AsString;

      Lista.Add(MensagemModel);

      Qry.Next;
    end;

    Result := Lista;
  finally
    Qry.Free;
  end;
end;

end.
