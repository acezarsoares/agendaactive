unit uSistemaControl;

interface

uses
  UConexao, System.SysUtils;

type
  TSistemaControl = class
  private
    FConexao     : TConexao;

    class var FInstance: TSistemaControl;

  public
    constructor Create();
    destructor Destroy; override;

    class function GetInstance: TSistemaControl;

     property Conexao: TConexao read FConexao write FConexao;
  end;

implementation

{ TSistemaControl }

constructor TSistemaControl.Create();
begin
  FConexao     := TConexao.Create;
end;

destructor TSistemaControl.Destroy;
begin
  FConexao.Free;

  inherited;
end;

class function TSistemaControl.GetInstance: TSistemaControl;
begin
  if not Assigned(Self.FInstance) then
  begin
    Self.FInstance := TSistemaControl.Create();
  end;

  Result := Self.FInstance;
end;

end.
