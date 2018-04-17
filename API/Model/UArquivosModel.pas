unit UArquivosModel;

interface

uses
  System.Classes;

type TFilesModel = class
  private
    FFileName: String;
    FFileContentBase64: TStream;
    FMensagem: String;
    procedure SetFileContentBase64(const Value: TStream);
    procedure SetFileName(const Value: String);
    procedure SetMensagem(const Value: String);

public
  property FileName          : String read FFileName write SetFileName;
  property Mensagem          : String read FMensagem write SetMensagem;
  property FileContentBase64 : TStream  read FFileContentBase64 write SetFileContentBase64;
end;

implementation

{ TFilesModel }

procedure TFilesModel.SetFileContentBase64(const Value: TStream);
begin
  FFileContentBase64 := Value;
end;

procedure TFilesModel.SetFileName(const Value: String);
begin
  FFileName := Value;
end;

procedure TFilesModel.SetMensagem(const Value: String);
begin
  FMensagem := Value;
end;

end.
