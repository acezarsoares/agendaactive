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
  public
    constructor Create;
    destructor Destroy; override;

    function GetConn: TFDConnection;
    function CriarQuery: TFDQuery;
  end;

implementation

{ TConexao }

procedure TConexao.ConfigurarConexao;
begin
  FConn.Params.Clear;
  FConn.Params.Add('DriverID=MSSQL');
  FConn.Params.Add('Server=10.10.10.131,1412');
  FConn.Params.Add('Database=dbSigaFacho');
  FConn.Params.Add('User_Name=sa');
  FConn.Params.Add('Password=active');
end;

constructor TConexao.Create;
begin
  FConn := TFDConnection.Create(nil);

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

  inherited;
end;

function TConexao.GetConn: TFDConnection;
begin
  Result := FConn;
end;

end.
