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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

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
