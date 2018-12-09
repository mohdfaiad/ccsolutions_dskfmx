unit AWS.Conexao;

interface

uses
  System.SysUtils,

  Data.Cloud.CloudAPI,
  Data.Cloud.AmazonAPI;

type
  TAWSConexao = class
  private
    AWSConexao: TAmazonConnectionInfo;
    const AWSACCESSKEYID = 'AKIAJRW2ONJTUT2C26PQ';
    const AWSSECRETKEY = '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';
    procedure AWSConfiguracao;
  protected

  public
    constructor Create;
    destructor Destroy; override;
    function GetAWSConexao: TAmazonConnectionInfo;
  published

  end;

implementation

{ TAWSConnection }

destructor TAWSConexao.Destroy;
begin
  FreeAndNil(AWSConexao);
  inherited;
end;

function TAWSConexao.GetAWSConexao: TAmazonConnectionInfo;
begin
  Result := AWSConexao;
end;

procedure TAWSConexao.AWSConfiguracao;
begin
  AWSConexao.AccountKey          := AWSSECRETKEY;
  AWSConexao.AccountName         := AWSACCESSKEYID;
  AWSConexao.ConsistentRead      := True;
  AWSConexao.MFAAuthCode         := '';
  AWSConexao.MFASerialNumber     := '';
  AWSConexao.Protocol            := 'http';
  AWSConexao.QueueEndpoint       := 'queue.amazonaws.com';
  AWSConexao.Region              := amzrUSEast1;
  AWSConexao.RequestProxyHost    := '';
  AWSConexao.RequestProxyPort    := 0;
  AWSConexao.StorageEndpoint     := 's3.amazonaws.com';
  AWSConexao.TableEndpoint       := 'sdb.amazonaws.com';
  AWSConexao.Tag                 := 0;
  AWSConexao.UseDefaultEndpoints := True;
end;

constructor TAWSConexao.Create;
begin
  AWSConexao := TAmazonConnectionInfo.Create(Nil);
  AWSConfiguracao();
end;

end.
