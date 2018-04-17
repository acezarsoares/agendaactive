unit UArquivosDao;

interface

uses
  System.JSON;
type TArquivos = class
    public
      function GravarArquivo (Param: TJsonObject):String;
end;

implementation

uses
  System.Classes, System.netEncoding, System.SysUtils ;

{ TArquivos }

function TArquivos.GravarArquivo( Param: TJsonObject):String;
var Input : TStringStream;
    Output: TMemoryStream;
    Base64       : TBase64Encoding ;
    nomearq:String ;
begin
   nomearq := 'c:\teste\'+formatDateTime('yyyyMMddhhnnss',date)+'.jpeg';
   Base64  := TBase64Encoding.Create;
   Input   := TStringstream.Create(Param.GetValue('Arquivo').Value);
   Input.Position:=0;
   Output  := TMemoryStream.Create;
   Base64.Decode(input,Output);
   Output.Position := 0 ;

   Output.SaveToFile(nomearq);
   result := nomearq;
end;

end.
