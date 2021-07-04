program ProjectClient;

uses
  Vcl.Forms,
  UnitClient in 'UnitClient.pas' {Form1},
  ViaCEP.Core in 'ViaCEP.Core.pas',
  ViaCEP.Intf in 'ViaCEP.Intf.pas',
  ViaCEP.Model in 'ViaCEP.Model.pas',
  UnitFunction in 'UnitFunction.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Cliente, frm_Cliente);
  Application.Run;
end.
