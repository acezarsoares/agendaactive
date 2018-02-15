unit UTimeLineDao;

interface

uses
  System.Generics.Collections, System.JSON, FireDAC.Comp.Client, System.SysUtils,

  UTimeLineModel;


type
  TTimeLineDao = class
  public
    function Obter(IdResponsavel: Integer): TObjectList<TTimeLineModel>;
  end;

implementation

uses USistemaControl, PFuncoes;

{ TTimeLineDao }

function TTimeLineDao.Obter(IdResponsavel: Integer): TObjectList<TTimeLineModel>;
var
  Qry: TFDQuery;
  ListaTimeLine: TObjectList<TTimeLineModel>;
  TimeLineModel: TTimeLineModel;
begin
  Qry := TSistemaControl.GetInstance().Conexao.CriarQuery();
  ListaTimeLine := TObjectList<TTimeLineModel>.Create;
  try
    Qry.SQL.Text := 'DECLARE @IdResponsavel INT ' +
                    'SET @IdResponsavel = :IdResponsavel ' +
                    'SELECT * ' +
                    'FROM VwTimeLine ' +
                    'WHERE @IdResponsavel IN ( IdResponsavel, IdResponsavelSecundario, IdPai, IdMae ) ' +
                    'ORDER BY Id ';

    Qry.ParamByName('IdResponsavel').Value := IdResponsavel;
    Qry.Open;

    Qry.First;
    while Not Qry.Eof do
    begin
      TimeLineModel := TTimeLineModel.Create;
      TimeLineModel.Titulo          := Qry.FieldByName('Titulo').AsString;
      TimeLineModel.SubTitulo       := Qry.FieldByName('SubTitulo').AsString;
      TimeLineModel.Conteudo        := Qry.FieldByName('Conteudo').AsString;
      TimeLineModel.DetalheConteudo := Qry.FieldByName('DetalheConteudo').AsString;
      TimeLineModel.Icone           := Qry.FieldByName('Icone').AsString;
      TimeLineModel.TipoPagina      := Qry.FieldByName('TipoPagina').AsString;
      TimeLineModel.IdAluno         := Qry.FieldByName('IdAluno').AsInteger;
      TimeLineModel.Time.Title      := Qry.FieldByName('Time_Title').AsString;
      TimeLineModel.Time.Subtitle   := Qry.FieldByName('Time_Subtitle').AsString;

      ListaTimeLine.Add(TimeLineModel);

      Qry.Next;
    end;

    Result := ListaTimeLine;
  finally
    Qry.Free;
  end;
end;

end.
