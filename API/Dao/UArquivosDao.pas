unit UArquivosDao;

interface
type TArquivos = class
    public
      function GravarArquivo (Mensagem, FileBase64: String):String;
end;

implementation

uses
  System.Classes, System.netEncoding, System.SysUtils ;

{ TArquivos }

function TArquivos.GravarArquivo( Mensagem, FileBase64: String):String;
var Input,Output : TStringStream;
    Base64       : TBase64Encoding ;
    nomearq:String ;
begin
   Base64 := TBase64Encoding.Create;
   Input := TStringstream.Create();
   input.WriteString( FileBase64 );
   Output := TStringStream.Create;
   Base64.Decode(input,Output);
   nomearq := 'c:\teste\'+formatDateTime('yyyyMMddhhnnss',date)+'.jpeg';
   Output.SaveToFile(nomearq);

   result := nomearq;

end;

end.
