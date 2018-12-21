program contrato;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrm_contrato in 'ufrm_contrato.pas' {frm_contrato},
  ufrm_default_base in '..\models\ufrm_default_base.pas' {frm_default_base},
  ufrm_main_base in '..\models\ufrm_main_base.pas' {frm_main_base},
  ufrm_main_base_menu in '..\models\ufrm_main_base_menu.pas' {frm_main_base_menu},
  ufrm_main in 'ufrm_main.pas' {frm_main},
  ufrm_login in '..\ufrm_login.pas' {frm_login};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_main, frm_main);
  Application.CreateForm(Tfrm_login, frm_login);
  Application.Run;
end.
