unit UTokenModel;

interface

type TToken = class
  private
    FToken: String;

public
    constructor Create();
    Property Token : String read Ftoken;
end;


implementation

uses
  System.SysUtils;

{ TToken }

constructor TToken.Create;
begin
  self.FToken := TGuid.NewGuid.ToString;
end;

end.
