unit ufrm_cliente;

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
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ImgList,
  FMX.TabControl,
  FMX.ActnList,
  FMX.Edit,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.ListView,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  Data.DB,

  ufrm_default_base,
  ufrm_dm, uDWConstsData, uRESTDWPoolerDB;

type
  Tfrm_cliente = class(Tfrm_default_base)
    clientSQLcli_codigo: TStringField;
    clientSQLusuario_usr_codigo: TStringField;
    clientSQLcli_id: TLongWordField;
    clientSQLcli_nome: TStringField;
    clientSQLcli_nome_fantasia: TStringField;
    clientSQLcli_tipo: TStringField;
    clientSQLcli_rgie: TStringField;
    clientSQLcli_cpfcnpj: TStringField;
    clientSQLcli_im: TStringField;
    clientSQLcli_suframa: TStringField;
    clientSQLcli_data: TDateField;
    clientSQLcli_status: TShortintField;
    clientSQLcli_data_deletado: TDateTimeField;
    clientSQLcli_data_registro: TDateTimeField;
  private

  public

  end;

var
  frm_cliente: Tfrm_cliente;

implementation

{$R *.fmx}

end.
