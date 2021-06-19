unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfPrincipal = class(TForm)
    lbxMensagem: TListBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

procedure TfPrincipal.FormShow(Sender: TObject);

  procedure AddMsg(sMsg: String; bFim: Boolean = false);
  begin
    if (sMsg <> EmptyStr) then
      lbxMensagem.Items.add(' - ' + sMsg);

    if (bFim) then
      lbxMensagem.Items.add(' ------- Fim de Rotina ------');
  end;

  function CopiarArquivo(sArq: String; sOrigem: String; sDestino: String): Boolean;
  begin
    Result := false;
    Result := CopyFile(PChar(sOrigem + sArq), PChar(sDestino + sArq), true);
  end;

var
  fArq: TextFile;
  sArq, sTxt, sOrigem, sDestino: string;
  bOk: Boolean;

begin
  {
    Passar 3 parâmetros para esse executável
    1 - Arquivo txt com a lista dos arquivos a serem copiados
    2 - Pasta de origem a ser lida
    3 - Pasta de destino para onde os arquivos serão copiados
  }

  // Atribuir os parâmetros às variáveis
  sTxt     := EmptyStr;
  sOrigem  := EmptyStr;
  sDestino := EmptyStr;

  sTxt     := ParamStr(1);
  sOrigem  := ParamStr(2);
  sDestino := ParamStr(3);

  AddMsg('Iniciando a rotina de cópia de arquivos');

  try
    if sTxt = EmptyStr then
    begin
      AddMsg('Primeiro parâmetro não passado... [ arquivo txt ]', true);
      Exit;
    end;

    if sOrigem = EmptyStr then
    begin
      AddMsg('Segundo parâmetro não passado... [ pasta de origem ]', true);
      Exit;
    end;

    // Para refatorar futuramente:
    // Poderá deixar a pasta de destino em branco, aí o programa cria
    // uma pasta dentro da origem com data e hora. (Backup-ddmmyyyy-hhmmss)
    // Exemplo: "T:\Comp-3\Ac-Dados\Backup-16112020-182810"
    if sDestino = EmptyStr then
    begin
      AddMsg('Terceiro parâmetro não passado... [ pasta de destino ]', true);
    end;

    // Ver se o arquivo texto existe
    if not(FileExists(sTxt)) then
    begin
      AddMsg('Arquivo passado não existe: ' + sTxt, true);
      Exit;
    end;

    // Ver se a pasta de origem existe
    if not(DirectoryExists(sOrigem)) then
    begin
      AddMsg('Pasta de origem inexistente: ' + sDestino, true);
      Exit;
    end;

    if Copy(sOrigem, Length(sOrigem), 1) <> '\' then
      sOrigem := sOrigem + '\';

    // Ver se a pasta de destino existe
    if not(DirectoryExists(sDestino)) then
    begin
      // Se a pasta não existir, tenta criar
      if not(CreateDir(sDestino)) then
      begin
        AddMsg('Pasta de destino inexistente: ' + sDestino, true);
        Exit;
      end;
    end;

    if Copy(sDestino, Length(sDestino), 1) <> '\' then
      sDestino := sDestino + '\';

    AddMsg('Iniciando a cópia dos arquivos');

    AssignFile(fArq, sTxt);
    Reset(fArq);

    while not EOF(fArq) do
    begin
      sArq := EmptyStr;
      ReadLn(fArq, sArq);

      if sArq <> EmptyStr then
      begin
        if not(FileExists(sOrigem + sArq)) then
          AddMsg('Arquivo inexistente na pasta de origem: [ ' + sArq + ' ]')
        else
        begin
          AddMsg('Copiar o arquivo: ' + sArq);

          bOk := CopiarArquivo(sArq, sOrigem, sDestino);
          if (bOk) then
            AddMsg('OK')
          Else
            AddMsg('Falha ao copiar o arquivo: ' + sArq, true);
        end;
      end;
    end;

    CloseFile(fArq);

    AddMsg('', true);

  except
    on exc: Exception do
    begin
      AddMsg('Excessão: [ ' + exc.Message + ' ]', true);
    end;
  end;


end;

end.
