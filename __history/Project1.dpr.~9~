program Project1;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles,
  TeamAddUnit in 'TeamAddUnit.pas' {AddForm},
  PlayerAddUnit in 'PlayerAddUnit.pas' {AddPlayerForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Dark');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAddForm, AddForm);
  Application.CreateForm(TAddPlayerForm, AddPlayerForm);
  Application.Run;
end.
