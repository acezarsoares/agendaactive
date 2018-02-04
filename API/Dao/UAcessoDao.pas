unit UAcessoDao;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client, System.SysUtils,
  
  UAcessoModel;


type
  TAcessoDao = class
  public
    function Logar(Login, Senha: String): TObjectList<TAcessoModel>;
  end;

implementation

uses USistemaControl, PFuncoes;

{ TAcessoDao }

function TAcessoDao.Logar(Login, Senha: String): TObjectList<TAcessoModel>;
var
  Qry    : TFDQuery;
  Lista  : TObjectList<TAcessoModel>;
  AcessoModel: TAcessoModel;
begin
  Qry := TSistemaControl.GetInstance().Conexao.CriarQuery();
  Lista := TObjectList<TAcessoModel>.Create;
  try
    Qry.SQL.Text := 'SELECT * FROM ( ' +
                    'SELECT Id = IdAluno, ' +
                    '       Tipo = ''A'', ' +
                    '       Login = Matricula, ' +
                    '       Senha = Senha, ' +
                    '       Nome = NomeAluno, ' +
                    '       Email = Email ' +
                    'FROM TbAluno ' +
                    'UNION ALL ' +
                    'SELECT Id = IdProfessor, ' +
                    '       Tipo = ''P'', ' +
                    '       Login = Login, ' +
                    '       Senha = Senha, ' +                    
                    '       Nome = NomeProfessor, ' +
                    '       Email = Email ' +
                    'FROM TbProfessor ' +
                    'UNION ALL ' +
                    'SELECT Id = IdResponsavel, ' +
                    '       Tipo = ''R'', ' +
                    '       Login = Login, ' +
                    '       Senha = Senha, ' +                    
                    '       Nome = NomeResponsavel, ' +
                    '       Email = Email ' +
                    'FROM TbResponsavel ' +
                    ' ) rst ' +
                    'WHERE Login = :Login';
                    
    Qry.ParamByName('Login').Value := Login;
    Qry.Open;

    If Not Qry.Eof then
    begin      
      If ( Senha = Trim( DeCrypto( Qry.FieldByName('Senha').AsString, Qry.FieldByName('Id').AsString ) ) ) then
      begin
        Qry.First;
        while not Qry.Eof do
        begin
          AcessoModel       := TAcessoModel.Create;
          AcessoModel.Id    := Qry.FieldByName('Id').AsInteger;  
          AcessoModel.Tipo  := Qry.FieldByName('Tipo').AsString;                  
          AcessoModel.Login := Qry.FieldByName('Login').AsString;
          AcessoModel.Nome  := Qry.FieldByName('Nome').AsString;
          AcessoModel.Email := Qry.FieldByName('Email').AsString;

          Lista.Add(AcessoModel);

          Qry.Next;
        end;
      end             
    end;
    
    Result := Lista;
  finally
    Qry.Free;
  end;
end;

end.
