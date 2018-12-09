unit ufrm_main;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.ImageList,
  System.Actions,

  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.ListBox,
  FMX.MultiView,
  FMX.ImgList,
  FMX.ActnList,
  FMX.Objects,

  ufrm_main_base_menu,

  ufrm_documento;

type
  Tfrm_main = class(Tfrm_main_base_menu)
    ListBoxItem_espaco: TListBoxItem;
    GridPanelLayout_espaco: TGridPanelLayout;
    ProgressBar_1: TProgressBar;
    GridPanelLayout_espaco_utilizado: TGridPanelLayout;
    Label1: TLabel;
    Label2: TLabel;
    ListBoxItem_meus_arquivos: TListBoxItem;
    procedure ListBoxItem_meus_arquivosClick(Sender: TObject);
  private
    FFormAtivo: TForm;
    procedure AbrirForm(aForm: TComponentClass);
  public

  end;

var
  frm_main: Tfrm_main;

implementation

{$R *.fmx}

{ Tfrm_main }

procedure Tfrm_main.AbrirForm(aForm: TComponentClass);
var
  I: Integer;
begin
  if (FFormAtivo = nil) or (Assigned(FFormAtivo) and (FFormAtivo.ClassName <> aForm.ClassName)) then begin
    for I := lytContainer.ControlsCount - 1 downto 0 do lytContainer.RemoveObject(lytContainer.Controls[I]);

    FFormAtivo.DisposeOf;
    FFormAtivo := nil;

    Application.CreateForm(aForm, FFormAtivo);
    lytContainer.AddObject(TLayout(FFormAtivo.FindComponent('lytForm')));
  end;

  MultiViewmain.HideMaster;
end;

procedure Tfrm_main.ListBoxItem_meus_arquivosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(Tfrm_documento);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
