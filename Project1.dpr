program Project1;

uses
  Forms,
  MainProg in 'MainProg.pas' {Form1},
  Star1 in 'Star1.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
