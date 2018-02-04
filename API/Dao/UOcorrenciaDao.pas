unit UOcorrenciaDao;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client, System.SysUtils,

  UOcorrenciaModel;

type
  TOcorrenciaDao = class
  public
    function Obter(IdAluno: Integer): TObjectList<TOcorrenciaModel>;
  end;

implementation

uses USistemaControl, PFuncoes;

{ TOcorrenciaDao }

function TOcorrenciaDao.Obter(IdAluno: Integer): TObjectList<TOcorrenciaModel>;
var
  Qry    : TFDQuery;
  Lista  : TObjectList<TOcorrenciaModel>;
  OcorrenciaModel: TOcorrenciaModel;
begin
  Qry := TSistemaControl.GetInstance().Conexao.CriarQuery();
  Lista := TObjectList<TOcorrenciaModel>.Create;
  try
    Qry.SQL.Text := 'SELECT ao.IdAlunoObs, ' +
                    '       al.NomeAluno, ' +
                    '       DataOcorrenciaString = CONVERT( VARCHAR, ao.DataOcorrencia, 103 ), ' +
                    '       ao.DataOcorrencia, ' +
                    '       toc.NomeTipoOcorrencia, ' +
                    '       Ocorrencia = CAST( ObservacaoRegistro AS VARCHAR(8000) ) ' +
                    'FROM   TbAlunoObs ao ' +
                    'INNER  JOIN TbTipoOcorrencia toc ON toc.IdTipoOcorrencia = ao.IdTipoOcorrencia ' +
                    'INNER  JOIN TbAluno al ON al.IdAluno = ao.IdAluno ' +
                    'WHERE  ao.IdAluno = :IdAluno ' +
                    'AND    ao.StExibirInternet = 1 ' +
                    'AND YEAR(ao.DataOcorrencia) = YEAR( GETDATE() ) ' +
                    'ORDER BY ao.DataOcorrencia DESC ';

    Qry.ParamByName('IdAluno').Value := IdAluno;
    Qry.Open;

    Qry.First;
    while Not Qry.Eof do
    begin
      OcorrenciaModel := TOcorrenciaModel.Create;
      OcorrenciaModel.IdOcorrencia          := Qry.FieldByName('IdAlunoObs').AsInteger;
      OcorrenciaModel.NomeTipoOcorrencia    := Qry.FieldByName('NomeTipoOcorrencia').AsString;
      OcorrenciaModel.NomeAluno             := Qry.FieldByName('NomeAluno').AsString;
      OcorrenciaModel.DataOcorrenciaString  := Qry.FieldByName('DataOcorrenciaString').AsString;
      OcorrenciaModel.DataOcorrencia        := Qry.FieldByName('DataOcorrencia').AsDateTime;
      OcorrenciaModel.Ocorrencia            := Qry.FieldByName('Ocorrencia').AsString;

      Lista.Add(OcorrenciaModel);

      Qry.Next;
    end;

    Result := Lista;
  finally
    Qry.Free;
  end;
end;

end.
