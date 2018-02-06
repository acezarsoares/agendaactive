unit UMensagemTipoDao;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client, System.SysUtils,

  UMensagemTipoModel;


type
  TMensagemTipoDao = class
  public
    function Obter(Id: Integer): TObjectList<TMensagemTipoModel>;
  end;

implementation

uses USistemaControl, PFuncoes;

{ TMensagemTipoDao }

function TMensagemTipoDao.Obter(Id: Integer): TObjectList<TMensagemTipoModel>;
var
  Qry    : TFDQuery;
  ListaMensagemTipo  : TObjectList<TMensagemTipoModel>;
  MensagemTipoModel: TMensagemTipoModel;
begin
  Qry := TSistemaControl.GetInstance().Conexao.CriarQuery();
  ListaMensagemTipo := TObjectList<TMensagemTipoModel>.Create;
  try
    Qry.SQL.Text := 'DECLARE @Id INT ' +
                    'SET @Id = :Id ' +
                    'SELECT IdMobileTipoMensagem, ' +
                    '       NomeMobileTipoMensagem, ' +
                    '	      QtdeNAOLida = ( SELECT COUNT(*) ' +
          				  '                       FROM TbMobileMensagem mm ' +
				            '                       WHERE mtm.IdMobileTipoMensagem = mm.IdMobileTipoMensagem ' +
				            '                       AND IdPessoaRelacionada = @Id ' +
  				          '               			  AND IdAutor <> @Id ' +
				            '			                  AND IdPessoaLeitura IS NULL ' +
          				  ' 			) ' +
				            'FROM TbMobileTipoMensagem mtm ' +
                    'WHERE StAtivo = 1 ' +
				            'AND IdMobileTipoMensagem > 0 ' +
				            'ORDER BY NomeMobileTipoMensagem ';

    Qry.ParamByName('Id').Value := Id;
    Qry.Open;

    Qry.First;
    while Not Qry.Eof do
    begin
      MensagemTipoModel := TMensagemTipoModel.Create;
      MensagemTipoModel.IdMobileTipoMensagem   := Qry.FieldByName('IdMobileTipoMensagem').AsInteger;
      MensagemTipoModel.NomeMobileTipoMensagem := Qry.FieldByName('NomeMobileTipoMensagem').AsString;
      MensagemTipoModel.QtdeNAOLida            := Qry.FieldByName('QtdeNAOLida').AsInteger;

      ListaMensagemTipo.Add(MensagemTipoModel);

      Qry.Next;
    end;

    Result := ListaMensagemTipo;
  finally
    Qry.Free;
  end;
end;

end.
