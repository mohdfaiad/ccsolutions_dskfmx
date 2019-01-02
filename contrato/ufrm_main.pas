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
  FMX.ImgList,
  FMX.ActnList,
  FMX.Objects,
  FMX.Layouts,
  FMX.ListBox,
  FMX.MultiView,
  FMX.Controls.Presentation,

  ufrm_main_base_menu,

  ufrm_contrato,
  ufrm_login;

type
  Tfrm_main = class(Tfrm_main_base_menu)
    ListBoxItem_contrato: TListBoxItem;
    procedure ListBoxItem_contratoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure Tfrm_main.FormCreate(Sender: TObject);
begin
  inherited;
  frm_login := Tfrm_login.Create(Self);
  frm_login.ShowModal;

  if frm_login.ModalResult <> mrOk then begin
//    MessageDlg('Você não se autenticou. A aplicação será encerrada!', mtWarning, [mbOK], 0);
    Application.Terminate;
  end;
end;

procedure Tfrm_main.ListBoxItem_contratoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(Tfrm_contrato);
end;

end.
