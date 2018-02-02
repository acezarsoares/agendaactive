unit ServerMethodsUnit;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth;

type
  TAgendaEscolar = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;

implementation


{$R *.dfm}


uses System.StrUtils, Web.HTTPApp, Datasnap.DSHTTPWebBroker;

function TAgendaEscolar.EchoString(Value: string): string;
var
    module : TWebModule;
    token : String;
begin
  module := GetDataSnapWebModule;
  token := module.Request.GetFieldByName('Token');
  if token <> '9e107d9d372bb6826bd81d3542a419d6' then
    Result := 'Token Inváido'
  else
    Result := Value;
end;

function TAgendaEscolar.ReverseString(Value: string): string;
var
    module : TWebModule;
    token : String;
Begin
  module := GetDataSnapWebModule;
  token := module.Request.GetFieldByName('Token');
  if token <> '9e107d9d372bb6826bd81d3542a419d6' then
    Result := 'Token Inváido'
  else
    Result := System.StrUtils.ReverseString(Value);
end;

end.

