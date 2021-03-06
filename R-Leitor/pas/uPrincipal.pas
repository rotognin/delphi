unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TfPrincipal = class(TForm)
    Label1: TLabel;
    edtArquivo: TEdit;
    btnBuscar: TButton;
    Label2: TLabel;
    edtDelimitador: TEdit;
    Label3: TLabel;
    edtSequencia: TEdit;
    gridArquivo: TStringGrid;
    gridInfo: TStringGrid;
    Label4: TLabel;
    edtInformacao: TEdit;
    btnSeparar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnSepararClick(Sender: TObject);
    procedure gridArquivoClick(Sender: TObject);
    procedure gridInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparGrid;
    procedure LimparGridArquivo;
    procedure SepararInformacoes(iSeq: Integer; sDelim, sLinha: String);
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

procedure TfPrincipal.btnBuscarClick(Sender: TObject);
var sArquivo: String;
    oDlg: TOpenDialog;
begin
  // Buscar o arquivo
  sArquivo := EmptyStr;
  oDlg := TOpenDialog.Create(nil);

  try
    oDlg.InitialDir := GetCurrentDir;
    oDlg.Filter := 'Arquivos com Delimitadores (*.*)|*.*';
    if oDlg.Execute then
      sArquivo := oDlg.FileName;

  finally
    oDlg.Free;
  end;

  if (sArquivo <> EmptyStr) then
    edtArquivo.Text := sArquivo;
end;

procedure TfPrincipal.btnSepararClick(Sender: TObject);
var iLinha, iTamanho, iQtd, iIdx: Integer;
    tArq: TextFile;
    sLinha, sDelim: String;

begin
  LimparGridArquivo;
  LimparGrid;

  // Verificar
  if (edtArquivo.Text = EmptyStr) then
  begin
    ShowMessage('Arquivo n?o informado.');
    edtArquivo.SetFocus;
    Exit;
  end;

  if not(FileExists(edtArquivo.Text)) then
  begin
    ShowMessage('O arquivo informado n?o existe.');
    edtArquivo.SetFocus;
    Exit;
  end;

  if (edtDelimitador.Text = EmptyStr) then
  begin
    ShowMessage('Delimitador n?o informado.');
    edtDelimitador.SetFocus;
    Exit;
  end;

  if (edtSequencia.Text = EmptyStr) then
  begin
    ShowMessage('Sequ?ncia n?o informada.' + #13 + 'Informar 0 ou 1');
    edtSequencia.SetFocus;
    Exit;
  end;

  sDelim := Copy(edtDelimitador.Text, 1, 1);
  iLinha := 0;

  AssignFile(tArq, edtArquivo.Text);
  Reset(tArq);

  while not(EOF(tArq)) do
  begin
    ReadLn(tArq, sLinha);
    Inc(iLinha);

    iTamanho := Length(sLinha);
    iQtd     := 0;

    for iIdx := 1 to iTamanho do
      if (sLinha[iIdx] = sDelim) then
        Inc(iQtd);

    // Adicionar as linhas na grid
    gridArquivo.RowCount := iLinha + 1;
    gridArquivo.Cells[0, iLinha] := IntToStr(iLinha);
    gridArquivo.Cells[1, iLinha] := IntToStr(iTamanho);
    gridArquivo.Cells[2, iLinha] := IntToStr(iQtd);
    gridArquivo.Cells[3, iLinha] := sLinha;
  end;

  CloseFile(tArq);
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
begin
  //
  LimparGridArquivo;
  LimparGrid;

  gridArquivo.ColWidths[3] := 900;
  gridInfo.ColWidths[2] := 700;

  // Se vier um arquivo como par?metro, j? setar o mesmo
  if ParamStr(1) <> EmptyStr then
  begin
    edtArquivo.Text := ParamStr(1);

    if ParamStr(2) <> EmptyStr then
      edtDelimitador.Text := ParamStr(2)
    else
      edtDelimitador.Text := ';';

    if ParamStr(3) <> EmptyStr then
      edtSequencia.Text := ParamStr(3)
    else
      edtSequencia.Text := '0';

    if not(FileExists(ParamStr(1))) then
    begin
      ShowMessage('O arquivo informado n?o existe.');
      edtArquivo.SetFocus;
      Exit;
    end;

    btnSepararClick(Sender);
  end;

end;

procedure TfPrincipal.gridArquivoClick(Sender: TObject);
begin
  //
  SepararInformacoes(StrToInt(edtSequencia.Text), edtDelimitador.Text, gridArquivo.Cells[3, gridArquivo.Row]);
end;

procedure TfPrincipal.gridInfoClick(Sender: TObject);
begin
  edtInformacao.Text := EmptyStr;
  edtInformacao.Text := gridInfo.Cells[2, gridInfo.Row];
end;

procedure TfPrincipal.LimparGrid;
var iCol: Integer;
begin
  for iCol := 0 to gridInfo.ColCount - 1 do
    gridInfo.Cols[iCol].Clear;

  gridInfo.RowCount   := 1;
  gridInfo.Cells[0,0] := 'Posi??o';
  gridInfo.Cells[1,0] := 'Tamanho';
  gridInfo.Cells[2,0] := 'Informa??o';
end;

procedure TfPrincipal.LimparGridArquivo;
var iCol: Integer;
begin
  for iCol := 0 to gridArquivo.ColCount - 1 do
    gridArquivo.Cols[iCol].Clear;

  gridArquivo.RowCount   := 1;
  gridArquivo.Cells[0,0] := 'Posi??o';
  gridArquivo.Cells[1,0] := 'Tamanho';
  gridArquivo.Cells[2,0] := 'Informa??o';
end;

procedure TfPrincipal.SepararInformacoes(iSeq: Integer; sDelim, sLinha: String);

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

  sInformacao := sLinha;
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
