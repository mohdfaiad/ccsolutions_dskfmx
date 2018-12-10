unit ufrm_arquivo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Layouts, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.ListView;

type
  Tfrm_arquivo = class(TForm)
    lytForm: TLayout;
    ListView_1: TListView;
    ToolBar_1: TToolBar;
    ListView_arquivos: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_arquivo: Tfrm_arquivo;

implementation

{$R *.fmx}

end.
