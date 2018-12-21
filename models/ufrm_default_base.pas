unit ufrm_default_base;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Rtti,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.TabControl,
  FMX.Grid.Style,
  FMX.ScrollBox,
  FMX.Grid,
  FMX.Layouts,
  FMX.ListBox,
  FMX.Edit, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, System.Actions, FMX.ActnList,
  System.ImageList, FMX.ImgList;

type
  Tfrm_default_base = class(TForm)
    lytForm: TLayout;
    ActionList_1: TActionList;
    ImageList_1: TImageList;
    Action_primeiro: TAction;
    Action_anterior: TAction;
    Action3: TAction;
    Action4: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_default_base: Tfrm_default_base;

implementation

{$R *.fmx}

end.
