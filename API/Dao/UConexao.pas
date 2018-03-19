unit uConexao;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.FB, FireDAC.Phys.MSSQL, FireDAC.Phys.ODBCBase, System.SysUtils, FireDAC.DApt, FireDAC.VCLUI.Wait;

type
  TConexao = class
  private
    FConn: TFDConnection;
    procedure ConfigurarConexao;
    constructor Create;
    destructor Destroy;
  public
    function GetConn: TFDConnection;
    function CriarQuery: TFDQuery;
  end;

implementation

{ TConexao }

procedure TConexao.ConfigurarConexao;
begin
  FConn.Params.Clear;
  FConn.Params.Add('DriverID=MSSQL');
  //FConn.Params.Add('Server=10.10.10.131,1412');
  FConn.Params.Add('Server=EC2AMAZ-HMIL9EU\SQL2008');
  FConn.Params.Add('Database=dbSigaModelo_v29');
  FConn.Params.Add('User_Name=sa');
  FConn.Params.Add('Password=Active123');
end;

constructor TConexao.Create;
begin
  Self.ConfigurarConexao();
end;

function TConexao.CriarQuery: TFDQuery;
var
  VQuery: TFDQuery;
begin
  VQuery := TFDQuery.Create(nil);
  VQuery.Connection := FConn;
  Result := VQuery;
end;

destructor TConexao.Destroy;
begin
  FConn.Free;
end;

function TConexao.GetConn: TFDConnection;
begin
  if not Assigned(FConn) then
     FConn := TFDConnection.Create(nil);

  Result := FConn;
end;

end.
