unit ufrm_main_base;

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
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.ImgList,
  FMX.ActnList;

type
  Tfrm_main_base = class(TForm)
    lytMain: TLayout;
    ToolBar_Top1: TToolBar;
    ActionList_1: TActionList;
    ImageList_1: TImageList;
    lytContainer: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_main_base: Tfrm_main_base;

implementation

{$R *.fmx}

end.
