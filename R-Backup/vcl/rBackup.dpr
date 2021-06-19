program rBackup;

uses
  Vcl.Forms,
  uPrincipal in '..\pas\uPrincipal.pas' {fPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
