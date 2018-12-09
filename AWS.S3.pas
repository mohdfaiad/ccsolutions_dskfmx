unit AWS.S3;

interface

uses
  System.Classes,
  System.SysUtils,

  Data.Cloud.CloudAPI,
  Data.Cloud.AmazonAPI,

  FMX.Dialogs,
  FMX.ListBox,
  FMX.Memo,

  AWS.Conexao, FMX.StdCtrls;

type
  TAWSS3 = class(TAWSConexao)
  private
    const BUCKET_NAME = 'ccs-bucket-use1';
    procedure ArquivoLista;
    var   OBJECT_NAME : string;

  protected

  public
    procedure ArquivoUpload;
    procedure ArquivoDownload(ListBox: TListBoxItem);
    procedure ArquivoListar;
    procedure BucketListar(Mem: TMemo);
    procedure BucketListarTodos(Mem: TMemo);
    procedure BucketDeletar(Mem: TMemo);

  published

  end;

implementation

{ TAWSS3 }

procedure TAWSS3.ArquivoDownload(ListBox: TListBoxItem);
begin
//
end;

procedure TAWSS3.ArquivoLista;
begin
//
end;

procedure TAWSS3.ArquivoListar;
begin
//
end;

procedure TAWSS3.ArquivoUpload;
begin
//
end;

procedure TAWSS3.BucketDeletar(Mem: TMemo);
var
  AmazonConnectionInfo1 : TAWSConexao;
  ResponseInfo: TCloudResponseInfo;
  StorageService: TAmazonStorageService;
  BucketName:String;
begin
  BucketName := 'my-bucket-name-vajsep967w37'; // the bucket name must be unique
  AmazonConnectionInfo1 := TAWSS3.Create;
  StorageService := TAmazonStorageService.Create(AmazonConnectionInfo1.GetAWSConexao);
  ResponseInfo := TCloudResponseInfo.Create;

  try
    if StorageService.DeleteBucket(BucketName, ResponseInfo, amzrNotSpecified) then
      Mem.Lines.Append('Success! Bucket: ' + BucketName + ' deleted.')
    else
      Mem.Lines.Append(Format('Failure! %s', [ResponseInfo.StatusMessage]));
  finally
    StorageService.Free;
    ResponseInfo.Free;
    AmazonConnectionInfo1.Free;
  end;
end;

procedure TAWSS3.BucketListar(Mem: TMemo);
begin
//
end;

procedure TAWSS3.BucketListarTodos(Mem: TMemo);
begin
//
end;

end.
