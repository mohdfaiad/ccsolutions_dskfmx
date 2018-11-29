unit ufrm_main_default;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Menus,
  FMX.Controls.Presentation, FMX.StdCtrls, System.ImageList, FMX.ImgList,
  System.Actions, FMX.ActnList;

type
  Tfrm_main_default = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu_1: TMainMenu;
    miSistema: TMenuItem;
    miCadastros: TMenuItem;
    miModulo: TMenuItem;
    miRelatorios: TMenuItem;
    miUtilizarios: TMenuItem;
    miAjuda: TMenuItem;
    ImageList_1: TImageList;
    ActionList_1: TActionList;
    Action_sair: TAction;
    miSair: TMenuItem;
    procedure Action_sairExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_main_default: Tfrm_main_default;

implementation

{$R *.fmx}

procedure Tfrm_main_default.Action_sairExecute(Sender: TObject);
begin
  Close;
end;

end.
