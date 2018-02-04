unit UServicosDao;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client, System.SysUtils,

  UServicosModel;


type
  TServicosDao = class
  public
    function Obter(Id: Integer): TObjectList<TServicosModel>;
  end;

implementation

uses USistemaControl, PFuncoes;

{ TMensagemDao }

function TServicosDao.Obter(Id: Integer): TObjectList<TServicosModel>;
var
  Qry    : TFDQuery;
  Lista  : TObjectList<TServicosModel>;
  ServicosModel: TServicosModel;
begin
  Qry := TSistemaControl.GetInstance().Conexao.CriarQuery();
  Lista := TObjectList<TServicosModel>.Create;
  try
    Qry.SQL.Text := 'DECLARE @IdResponsavel INT ' +
                    'SET @IdResponsavel = :IdResponsavel ' +
                    'SELECT	IdAluno, ' +
                    '       Matricula, ' +
                    '       NomeAluno ' +
					          'FROM	VwAcessoPortalAluno a ' +
					          'WHERE @IdResponsavel IN (IdPai, IdMae, IdResponsavel, IdResponsavelSecundario) ' +
                    'ORDER	BY NomeAluno';

    Qry.ParamByName('IdResponsavel').Value := Id;
    Qry.Open;

    Qry.First;
    while Not Qry.Eof do
    begin
      ServicosModel := TServicosModel.Create;
      ServicosModel.IdAluno    := Qry.FieldByName('IdAluno').AsInteger;
      ServicosModel.Matricula  := Qry.FieldByName('Matricula').AsString;
      ServicosModel.NomeAluno  := Qry.FieldByName('NomeAluno').AsString;

      Lista.Add(ServicosModel);

      Qry.Next;
    end;

    Result := Lista;
  finally
    Qry.Free;
  end;
end;

end.
