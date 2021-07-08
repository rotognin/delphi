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
  private
    { Private declarations }
  public
    { Public declarations }
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
begin
  // Verificar
  if (edtArquivo.Text = EmptyStr) then
  begin
    ShowMessage('Arquivo não informado.');
    edtArquivo.SetFocus;
    Exit;
  end;

  if not(FileExists(edtArquivo.Text)) then
  begin
    ShowMessage('O arquivo informado não existe.');
    edtArquivo.SetFocus;
    Exit;
  end;

  if (edtDelimitador.Text = EmptyStr) then
  begin
    ShowMessage('Delimitador não informado.');
    edtDelimitador.SetFocus;
    Exit;
  end;

  if (edtSequencia.Text = EmptyStr) then
  begin
    ShowMessage('Sequência não informada.' + #13 + 'Informar 0 ou 1');
    edtSequencia.SetFocus;
    Exit;
  end;





end;

procedure TfPrincipal.FormCreate(Sender: TObject);
begin
  //
  gridArquivo.Cells[0, 0] := 'Linha';
  gridArquivo.Cells[1, 0] := 'Tamanho';
  gridArquivo.Cells[2, 0] := 'Informações';
  gridArquivo.Cells[3, 0] := 'Texto';

  gridInfo.Cells[0, 0] := 'Posição';
  gridInfo.Cells[1, 0] := 'Tamanho';
  GridInfo.Cells[2, 0] := 'Informação';

  // Se vier um arquivo como parâmetro, já setar o mesmo
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

    if not(FileExists(ParamStr(2))) then
    begin
      ShowMessage('O arquivo informado não existe.');
      edtArquivo.SetFocus;
      Exit;
    end;
  end;


end;

end.
