unit PFuncoes;

interface

uses  System.SysUtils;

{ Criptografia }
function Encrypt_hexa(S: AnsiString): AnsiString;
function Encrypta(secret, password: AnsiString): AnsiString;

{ Criptografia }
function Crypto(secret, password: AnsiString; tamanho: integer): AnsiString;
function DeCrypto(s, password: AnsiString): AnsiString;
// Novas funções
function EncryptStr(const S: String; Key: Word): String;
function DecryptStr(const S: String; Key: Word): String;

implementation


function Encrypt_hexa( S: AnsiString ): AnsiString;
var hx, j: AnsiString;
    i: Integer;
begin
  hx := '';
  for i := 1 to Length(S) do
    begin
      j := IntToHex( Ord( S[i] ), 2 );   //Copy(S, i, 1 ) ) );
      //if Length(j) := 1 then j = '0' + j;
      hx := hx + j
    end;
    Result := hx;
end;

function Encrypta( secret, password: AnsiString ): AnsiString;

  function moduloInterno( n, l: integer ): Integer;
  begin
    if (n mod l) = 0 then Result := -1
    else                  Result := 0;
  end;

var char, x, l: Integer;
  S, tmp : AnsiString;
begin
  S := '';
  l := Length(Password);
  for x := 1 to Length( secret ) do
  begin
    tmp := Copy( password, (x mod l) - l * ( moduloInterno(x,l) ), 1);
    char := Ord( tmp[1] );
    S := S + Chr( Ord( secret[x] ) xor char );
  end;
  Result := S;
end;

function Crypto( secret, password: AnsiString; tamanho: integer ): AnsiString;
begin
    while Length(secret) < tamanho do
      secret := secret + ' ';

    while Length(password) < 10 do
      password := password + password;

    password := copy( password, 1, 10 );

    Result := Encrypt_hexa( Encrypta( secret, password ) );
end;

function DeCrypto( s, password: AnsiString ): AnsiString;
var i: Integer;
    temp, j: AnsiString;
begin
  temp := '';
  i := 1;
  while (i<=Length(s)) do
    begin
      j := Copy( s, i, 2 );
      temp := temp + Chr( StrToInt('$' + j) );
      i := i + 2;
    end;
  Result := Encrypta( temp, password );
end;


function EncryptStr(const S: String; Key: Word): String;
var I: Integer;
const C1 = 53761;
      C2 = 32618;
begin
  Result := S;
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(Result[I]) + Key) * C1 + C2;
  end;
end;

function DecryptStr(const S: String; Key: Word): String;
var I: Integer;
const C1 = 53761;
      C2 = 32618;
begin
  Result := S;
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(S[I]) + Key) * C1 + C2;
  end;
end;

end.
