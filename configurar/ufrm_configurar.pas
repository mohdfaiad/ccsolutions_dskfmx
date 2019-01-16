unit ufrm_configurar;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Actions,
  System.ImageList,
  System.IniFiles,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.TabControl,
  FMX.ActnList,
  FMX.ImgList,
  FMX.ListBox,
  FMX.Edit,
  FMX.Layouts;

type
  Tfrm_configurar = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Panel2: TPanel;
    Button_salvar: TButton;
    Button_fechar: TButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    TabItem3: TTabItem;
    Action_salvar: TAction;
    Action_cancelar: TAction;
    Action_fechar: TAction;
    Edit_db_nomebanco: TEdit;
    Label2: TLabel;
    ComboBox_db_tipo: TComboBox;
    Label3: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Label4: TLabel;
    Edit_db_enderecoservidor: TEdit;
    Label5: TLabel;
    Edit_db_senha: TEdit;
    Layout5: TLayout;
    Label6: TLabel;
    Edit_db_usuario: TEdit;
    Label7: TLabel;
    Edit_db_porta: TEdit;
    Layout4: TLayout;
    Label8: TLabel;
    Edit_swbs_usuario: TEdit;
    Label9: TLabel;
    Edit_swbs_senha: TEdit;
    Layout6: TLayout;
    Label11: TLabel;
    Edit_swbs_porta: TEdit;
    CheckBox_swbs_autenticacao: TCheckBox;
    Layout7: TLayout;
    Label10: TLabel;
    Edit_cwbs_porta: TEdit;
    Layout8: TLayout;
    Label12: TLabel;
    Edit_cwbs_usuario: TEdit;
    Label13: TLabel;
    Edit_cwbs_senha: TEdit;
    CheckBox_cwbs_autenticacao: TCheckBox;
    Label14: TLabel;
    Edit_cwbs_endereco: TEdit;
    procedure Action_fecharExecute(Sender: TObject);
    procedure Action_salvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    arqIniBancoDados,
    arqIniClienteWBS,
    arqIniServidorWBS: TIniFile;
    dir: String;

    CONST
      pasta           = 'config\';
      fileBancoDados  = 'database.ini';
      fileClienteWBS  = 'cwebservice.ini';
      fileServidorWBS = 'swebservice.ini';

    procedure lerArqIniBancoDados;
    procedure escreverArqIniBancoDados;

    procedure lerArqIniClienteWBS;
    procedure escreverArqIniClienteWBS;

    procedure lerArqIniServidorWBS;
    procedure escreverArqIniServidorWBS;

    function booleanCheckbox(checkbox: TCheckBox): Boolean;

  public

  end;

var
  frm_configurar: Tfrm_configurar;

implementation

{$R *.fmx}

{ Tfrm_configurar }

procedure Tfrm_configurar.Action_fecharExecute(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_configurar.Action_salvarExecute(Sender: TObject);
begin
  try
    try
      escreverArqIniBancoDados;
      escreverArqIniClienteWBS;
      escreverArqIniServidorWBS;

      ShowMessage('Configuração salva com sucesso!');
    except on E: Exception do
      ShowMessage('Error: ' + E.Message);
    end;
  finally
  end;
end;

function Tfrm_configurar.booleanCheckbox(checkbox: TCheckBox): Boolean;
begin
  if checkbox.IsChecked then begin
    Result := True;
  end else begin
    Result := False;
  end;
end;

procedure Tfrm_configurar.Button1Click(Sender: TObject);
begin
  ShowMessage(ComboBox_db_tipo.Items.Text);
end;

procedure Tfrm_configurar.escreverArqIniBancoDados;
var
  dir: String;
begin
  dir := ExtractFilePath(ExtractFileDir(GetCurrentDir)) + pasta + fileBancoDados;

  try
    try
      arqIniBancoDados := TIniFile.Create(dir);

      arqIniBancoDados.WriteString('DATABASE', 'DATABASE', Edit_db_nomebanco.Text);
      arqIniBancoDados.WriteString('DATABASE', 'USER_NAME', Edit_db_usuario.Text);
      arqIniBancoDados.WriteString('DATABASE', 'PASSWORD', Edit_db_senha.Text);
      arqIniBancoDados.WriteString('DATABASE', 'SERVER', Edit_db_enderecoservidor.Text);
      arqIniBancoDados.WriteInteger('DATABASE', 'PORT', Edit_db_porta.Text.ToInteger);
      arqIniBancoDados.WriteString('DATABASE', 'DRIVERID', ComboBox_db_tipo.Items.Text);

    except on E: Exception do
      ShowMessage('Error: ' + E.Message);
    end;
  finally
    arqIniBancoDados.Free;
  end;
end;

procedure Tfrm_configurar.escreverArqIniClienteWBS;
var
  dir: String;
begin
  dir := ExtractFilePath(ExtractFileDir(GetCurrentDir)) + pasta + fileClienteWBS;

  try
    try
      arqIniClienteWBS := TIniFile.Create(dir);

      arqIniClienteWBS.WriteString('CWBS', 'SERVIDOR_ENDERECO', Edit_cwbs_endereco.Text);
      arqIniClienteWBS.WriteInteger('CWBS', 'SERVIDOR_PORTA', Edit_cwbs_porta.Text.ToInteger);
      arqIniClienteWBS.WriteString('CWBS', 'SERVIDOR_USUARIO', Edit_cwbs_usuario.Text);
      arqIniClienteWBS.WriteString('CWBS', 'SERVIDOR_SENHA', Edit_cwbs_senha.Text);
      arqIniClienteWBS.WriteBool('CWBS', 'SERVIDOR_AUTENTICACAO', booleanCheckbox(CheckBox_cwbs_autenticacao));
    except on E: Exception do
      ShowMessage('Error: ' + E.Message);
    end;
  finally
    arqIniClienteWBS.Free;
  end;
end;

procedure Tfrm_configurar.escreverArqIniServidorWBS;
var
  dir: String;
begin
  dir := ExtractFilePath(ExtractFileDir(GetCurrentDir)) + pasta + fileServidorWBS;

  try
    try
      arqIniServidorWBS := TIniFile.Create(dir);

      arqIniServidorWBS.WriteInteger('SWBS', 'SERVIDOR_PORTA', Edit_swbs_porta.Text.ToInteger);
      arqIniServidorWBS.WriteString('SWBS', 'SERVIDOR_USUARIO', Edit_swbs_usuario.Text);
      arqIniServidorWBS.WriteString('SWBS', 'SERVIDOR_SENHA', Edit_swbs_senha.Text);
      arqIniServidorWBS.WriteBool('SWBS', 'SERVIDOR_AUTENTICACAO', booleanCheckbox(CheckBox_swbs_autenticacao));

    except on E: Exception do
      ShowMessage('Error: ' + E.Message);
    end;
  finally
    arqIniServidorWBS.Free;
  end;
end;

procedure Tfrm_configurar.FormShow(Sender: TObject);
begin
  lerArqIniBancoDados;
  lerArqIniClienteWBS;
  lerArqIniServidorWBS;
end;

procedure Tfrm_configurar.lerArqIniBancoDados;
var
  dir: String;
begin
  dir := ExtractFilePath(ExtractFileDir(GetCurrentDir)) + pasta + fileBancoDados;

  try
    try
      arqIniBancoDados := TIniFile.Create(dir);

      Edit_db_nomebanco.Text := arqIniBancoDados.ReadString('DATABASE', 'DATABASE', 'dbcloud');
      Edit_db_usuario.Text := arqIniBancoDados.ReadString('DATABASE', 'USER_NAME', 'root');
      Edit_db_senha.Text := arqIniBancoDados.ReadString('DATABASE', 'PASSWORD', 'root');
      Edit_db_enderecoservidor.Text := arqIniBancoDados.ReadString('DATABASE', 'SERVER', '127.0.0.1');
      Edit_db_porta.Text := arqIniBancoDados.ReadInteger('DATABASE', 'PORT', 3306).ToString;
//      ComboBox_db_tipo.Items.Add(arqIniBancoDados.ReadString('DATABASE', 'DRIVERID', ''));

    except on E: Exception do
      ShowMessage('Error: ' + E.Message);
    end;
  finally
    arqIniBancoDados.Free;
  end;
end;

procedure Tfrm_configurar.lerArqIniClienteWBS;
var
  dir: String;
begin
  dir := ExtractFilePath(ExtractFileDir(GetCurrentDir)) + pasta + fileClienteWBS;

  try
    try
      arqIniClienteWBS := TIniFile.Create(dir);

      Edit_cwbs_endereco.Text := arqIniClienteWBS.ReadString('CWBS', 'SERVIDOR_ENDERECO', '127.0.0.1');
      Edit_cwbs_porta.Text := arqIniClienteWBS.ReadInteger('CWBS', 'SERVIDOR_PORTA', 80).ToString;
      Edit_cwbs_usuario.Text := arqIniClienteWBS.ReadString('CWBS', 'SERVIDOR_USUARIO', 'root');
      Edit_cwbs_senha.Text := arqIniClienteWBS.ReadString('CWBS', 'SERVIDOR_SENHA', 'root');
      CheckBox_cwbs_autenticacao.IsChecked := arqIniClienteWBS.ReadBool('CWBS', 'SERVIDOR_AUTENTICACAO', True);
    except on E: Exception do
      ShowMessage('Error: ' + E.Message);
    end;
  finally
    arqIniClienteWBS.Free;
  end;
end;

procedure Tfrm_configurar.lerArqIniServidorWBS;
var
  dir: String;
begin
  dir := ExtractFilePath(ExtractFileDir(GetCurrentDir)) + pasta + fileServidorWBS;

  try
    try
      arqIniServidorWBS := TIniFile.Create(dir);

      Edit_Swbs_porta.Text := arqIniServidorWBS.ReadInteger('SWBS', 'SERVIDOR_PORTA', 80).ToString;
      Edit_swbs_usuario.Text := arqIniServidorWBS.ReadString('SWBS', 'SERVIDOR_USUARIO', 'root');
      Edit_swbs_senha.Text := arqIniServidorWBS.ReadString('SWBS', 'SERVIDOR_SENHA', 'root');
      CheckBox_swbs_autenticacao.IsChecked := arqIniServidorWBS.ReadBool('SWBS', 'SERVIDOR_AUTENTICACAO', True);
    except on E: Exception do
      ShowMessage('Error: ' + E.Message);
    end;
  finally
    arqIniServidorWBS.Free;
  end;
end;

end.
