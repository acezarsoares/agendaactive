unit UMensagemDao;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client, System.SysUtils,

  UMensagemModel;


type
  TMensagemDao = class
  public
    function Obter(Id, IdTipoMensagem: Integer): TObjectList<TMensagemModel>;
    procedure Incluir(MensagemModel: TMensagemModel);
  end;

implementation

uses USistemaControl, PFuncoes;

{ TMensagemDao }

procedure TMensagemDao.Incluir(MensagemModel: TMensagemModel);
var
  Qry: TFDQuery;
begin
  Qry := TSistemaControl.GetInstance().Conexao.CriarQuery();
  try
    Qry.ExecSQL('EXEC SpMobileGravarMensagem @IdMobileTipoMensagem  = :IdMobileTipoMensagem, ' +
                                            '@IdPessoaRelacionada   = :IdPessoaRelacionada, ' +
                                            '@TipoPessoaRelacionada = :TipoPessoaRelacionada, ' +
                                            '@IdAutor               = :IdAutor, ' +
                                            '@TipoAutor             = :TipoAutor, ' +
                                            '@Mensagem              = :Mensagem, ' +
                                            '@IdMobileMensagem      = NULL ',
      [MensagemModel.IdMobileTipoMensagem,
       MensagemModel.IdPessoaRelacionada,
       MensagemModel.TipoPessoaRelacionada,
       MensagemModel.IdAutor,
       MensagemModel.TipoAutor,
       MensagemModel.Mensagem]);
  finally
    Qry.Free;
  end;

end;

function TMensagemDao.Obter(Id, IdTipoMensagem: Integer): TObjectList<TMensagemModel>;
var
  Qry    : TFDQuery;
  ListaMensagem  : TObjectList<TMensagemModel>;
  MensagemModel: TMensagemModel;
begin
  Qry := TSistemaControl.GetInstance().Conexao.CriarQuery();
  ListaMensagem := TObjectList<TMensagemModel>.Create;
  try
    Qry.SQL.Text := 'SELECT	IdMobileMensagem,  ' +
                    '       IdMobileTipoMensagem, ' +
                    '       NomeMobileTipoMensagem, ' +
                    '       IdPessoaRelacionada, ' +
                    '       TipoPessoaRelacionada, ' +
                    '       IdAutor, ' +
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
      MensagemModel.IdMobileMensagem        := Qry.FieldByName('IdMobileMensagem').AsInteger;
      MensagemModel.IdMobileTipoMensagem    := Qry.FieldByName('IdMobileTipoMensagem').AsInteger;
      MensagemModel.NomeMobileTipoMensagem  := Qry.FieldByName('NomeMobileTipoMensagem').AsString;
      MensagemModel.IdPessoaRelacionada     := Qry.FieldByName('IdPessoaRelacionada').AsInteger;
      MensagemModel.TipoPessoaRelacionada   := Qry.FieldByName('TipoPessoaRelacionada').AsString;
      MensagemModel.IdAutor                 := Qry.FieldByName('IdAutor').AsInteger;
      MensagemModel.TipoAutor               := Qry.FieldByName('TipoAutor').AsString;
      MensagemModel.NomeAutor               := Qry.FieldByName('NomeAutor').AsString;
      MensagemModel.DataHoraString          := Qry.FieldByName('DataHoraString').AsString;
      MensagemModel.DataHora                := Qry.FieldByName('DataHora').AsDateTime;
      MensagemModel.Mensagem                := Qry.FieldByName('Mensagem').AsString;

      ListaMensagem.Add(MensagemModel);

      Qry.Next;
    end;

    Result := ListaMensagem;
  finally
    Qry.Free;
  end;
end;

end.
