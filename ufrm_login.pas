unit ufrm_login;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Actions,
  System.ImageList,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.Objects,
  FMX.Edit,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.ActnList,
  FMX.ImgList;

type
  Tfrm_login = class(TForm)
    Layout_1: TLayout;
    GridPanelLayout_1: TGridPanelLayout;
    Label_usuario: TLabel;
    Edit1: TEdit;
    Label_senha: TLabel;
    Edit2: TEdit;
    ImageList_1: TImageList;
    ActionList_1: TActionList;
    GridPanelLayout1: TGridPanelLayout;
    Button1: TButton;
    Button2: TButton;
    Action_acessar: TAction;
    Action_cancelar: TAction;
    procedure Action_cancelarExecute(Sender: TObject);  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_login: Tfrm_login;

implementation

{$R *.fmx}

procedure Tfrm_login.Action_cancelarExecute(Sender: TObject);
begin
  Application.Terminate;
end;

end.
