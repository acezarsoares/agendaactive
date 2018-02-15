unit UTimeLineModel;

interface

uses
  System.Generics.Collections, System.JSON, REST.JSON, Data.DB, Data.Win.ADODB;

type
  TTime = class
  private
    FSubtitle: String;
    FTitle: String;

    procedure SetSubtitle(const Value: String);
    procedure SetTitle(const Value: String);
  public
    property Title: String read FTitle write SetTitle;
    property Subtitle: String read FSubtitle write SetSubtitle;
  end;

  TTimeLineModel = class
  private
    FTime: TTime;
    FSubTitulo: String;
    FIdAluno: Integer;
    FTitulo: String;
    FConteudo: String;
    FTipoPagina: String;
    FIcone: String;
    FDetalheConteudo: String;

    procedure SetTime(const Value: TTime);
    procedure SetConteudo(const Value: String);
    procedure SetIcone(const Value: String);
    procedure SetIdAluno(const Value: Integer);
    procedure SetSubTitulo(const Value: String);
    procedure SetTipoPagina(const Value: String);
    procedure SetTitulo(const Value: String);
    procedure SetDetalheConteudo(const Value: String);
  public
    constructor Create;
    destructor Destroy;

    property Titulo: String read FTitulo write SetTitulo;
    property SubTitulo: String read FSubTitulo write SetSubTitulo;
    property Conteudo: String read FConteudo write SetConteudo;
    property DetalheConteudo: String read FDetalheConteudo write SetDetalheConteudo;
    property Icone: String read FIcone write SetIcone;
    property TipoPagina: String read FTipoPagina write SetTipoPagina;
    property IdAluno: Integer read FIdAluno write SetIdAluno;
    property Time: TTime read FTime write SetTime;

    function Obter(IdResponsavel: Integer): TJSONArray; // Get
  end;

implementation

uses UTimeLineDao, uSystem.JSONUtil;

{ TTimeLineModel }

constructor TTimeLineModel.Create;
begin
  FTime := TTime.Create;
end;

destructor TTimeLineModel.Destroy;
begin
  FTime.Free;
end;

function TTimeLineModel.Obter(IdResponsavel: Integer): TJSONArray;
var
  TimeLineDao: TTimeLineDao;
  ListaTimeLine: TObjectList<TTimeLineModel>;
begin
  TimeLineDao := TTimeLineDao.Create;
  try
    ListaTimeLine := TimeLineDao.Obter(IdResponsavel);
    try
      Result := TJSONUtil.ObjetoListaParaJson<TTimeLineModel>(ListaTimeLine);
    finally
      ListaTimeLine.Free;
    end;
  finally
    TimeLineDao.Free;
  end;
end;


procedure TTimeLineModel.SetConteudo(const Value: String);
begin
  FConteudo := Value;
end;

procedure TTimeLineModel.SetDetalheConteudo(const Value: String);
begin
  FDetalheConteudo := Value;
end;

procedure TTimeLineModel.SetIcone(const Value: String);
begin
  FIcone := Value;
end;

procedure TTimeLineModel.SetIdAluno(const Value: Integer);
begin
  FIdAluno := Value;
end;

procedure TTimeLineModel.SetSubTitulo(const Value: String);
begin
  FSubTitulo := Value;
end;

procedure TTimeLineModel.SetTime(const Value: TTime);
begin

end;

procedure TTimeLineModel.SetTipoPagina(const Value: String);
begin
  FTipoPagina := Value;
end;

procedure TTimeLineModel.SetTitulo(const Value: String);
begin
  FTitulo := Value;
end;

{ TTime }

procedure TTime.SetSubtitle(const Value: String);
begin
  FSubtitle := Value;
end;

procedure TTime.SetTitle(const Value: String);
begin
  FTitle := Value;
end;

end.
