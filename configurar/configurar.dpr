program configurar;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrm_configurar in 'ufrm_configurar.pas' {frm_configurar};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_configurar, frm_configurar);
  Application.Run;
end.
