unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids;

type
  TfPrincipal = class(TForm)
    Label1: TLabel;
    memTexto: TMemo;
    Label2: TLabel;
    edtDelimitador: TEdit;
    Label3: TLabel;
    edtSequencia: TEdit;
    btnSeparar: TButton;
    gridInfo: TStringGrid;
    Label4: TLabel;
    edtInfo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSepararClick(Sender: TObject);
    procedure gridInfoDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure gridInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparTudo;
    procedure LimparGrid;
    procedure SepararInformacoes(iSeq: Integer; sDelim: String);
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

procedure TfPrincipal.btnSepararClick(Sender: TObject);
var iSeq: Integer;
    sDelim: String;
begin
  if memTexto.Text = EmptyStr then
  begin
    ShowMessage('Texto em branco.');
    memTexto.SetFocus;
    Exit;
  end;

  if edtDelimitador.Text = EmptyStr then
  begin
    ShowMessage('Delimitador não informado.');
    edtDelimitador.SetFocus;
    Exit;
  end;

  sDelim := edtDelimitador.Text;

  if edtSequencia.Text = EmptyStr then
  begin
    ShowMessage('Sequência não informada.');
    edtSequencia.SetFocus;
    Exit;
  end;

  iSeq := StrToInt(edtSequencia.Text);
  if not(iSeq in [0..1]) then
  begin
    ShowMessage('Sequência deve ser 0 ou 1');
    edtSequencia.SetFocus;
    Exit;
  end;

  SepararInformacoes(iSeq, sDelim);
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
begin
  LimparTudo;
end;

procedure TfPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SelectNext(ActiveControl, True, True);

  if Key = #27 then
  begin
    LimparTudo;
    memTexto.SetFocus;
  end;

end;

procedure TfPrincipal.gridInfoClick(Sender: TObject);
begin
  //ShowMessage('Teste');
  edtInfo.Text := EmptyStr;
  edtInfo.Text := gridInfo.Cells[2, gridInfo.Row];
end;

procedure TfPrincipal.gridInfoDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
{
var str: String;
    rRect: TRect;
}
begin
  { *** Verificar posteriormente: títulos das colunas
  if ARow = 0 then
  begin
    str := gridInfo.Cells[ACol, ARow];
    gridInfo.Canvas.Brush.Color := clGray;
    gridInfo.Canvas.FillRect(Rect);
    gridInfo.Canvas.Font.Color := clWhite;
    gridInfo.Canvas.Font.Style := [fsBold];
    rRect := Rect;
    //InflateRect(rRect, -2, -2);
    gridInfo.Canvas.TextRect(rRect, str);
  end;
  }

end;

procedure TfPrincipal.LimparTudo;
begin
  memTexto.Clear;
  edtDelimitador.Text := EmptyStr;
  edtSequencia.Text := EmptyStr;

  LimparGrid;
end;

procedure TfPrincipal.LimparGrid;
var iCol: Integer;
begin
  for iCol := 0 to gridInfo.ColCount - 1 do
    gridInfo.Cols[iCol].Clear;

  gridInfo.RowCount   := 1;
  gridInfo.Cells[0,0] := 'Posição';
  gridInfo.Cells[1,0] := 'Tamanho';
  gridInfo.Cells[2,0] := 'Informação';
end;

procedure TfPrincipal.SepararInformacoes(iSeq: Integer; sDelim: String);

  procedure AddGrid(iLinha, iSeq, iTamanho: Integer; sTexto: String);
  begin
    gridInfo.RowCount := iLinha + 1;
    gridInfo.Cells[0, iLinha] := IntToStr(iSeq);
    gridInfo.Cells[1, iLinha] := IntToStr(iTamanho);
    gridInfo.Cells[2, iLinha] := sTexto;
  end;

var
  iPosicao, iTamanho, iTotal, iLinha: Integer;
  sInformacao, sTexto, sChar: String;
begin
  LimparGrid;

  sInformacao := memTexto.Text;
  sTexto := EmptyStr;

  iTotal := Length(sInformacao);
  iLinha := 1;

  for iPosicao := 1 to iTotal do
  begin
    sChar := Copy(sInformacao, iPosicao, 1);

    if sChar <> sDelim then
      sTexto := sTexto + sChar
    else
    begin
      iTamanho := Length(sTexto);
      AddGrid(iLinha, iSeq, iTamanho, sTexto);
      Inc(iSeq);
      Inc(iLinha);
      sTexto := EmptyStr;
    end;
  end;
end;

end.
