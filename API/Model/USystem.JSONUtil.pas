unit uSystem.JSONUtil;

interface

uses
  System.JSON, System.Generics.Collections, REST.JSON;

type
  TJSONUtil = class
    class function ObjetoListaParaJson<T: class>(ALista: TObjectList<T>; ANomeObjecto: String): TJSONObject; overload;
    class function ObjetoListaParaJson<T: class>(ALista: TObjectList<T>): TJSONArray; overload;
  end;

implementation

{ TJSONUtil }

class function TJSONUtil.ObjetoListaParaJson<T>(ALista: TObjectList<T>; ANomeObjecto: String): TJSONObject;
var
  VItem : T;
  VArray: TJSONArray;
begin
  VArray := TJSONArray.Create;

  for VItem in ALista do
    VArray.AddElement(TJson.ObjectToJsonObject(VItem));

  Result := TJSONObject.Create;
  Result.AddPair(ANomeObjecto, VArray);
end;

class function TJSONUtil.ObjetoListaParaJson<T>(ALista: TObjectList<T>): TJSONArray;
var
  VItem: T;
begin
  Result := TJSONArray.Create;

  for VItem in ALista do
    Result.AddElement(TJson.ObjectToJsonObject(VItem));
end;

end.
