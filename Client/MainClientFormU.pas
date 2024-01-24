unit MainClientFormU;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  MVCFramework.Middleware.JWT,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TAuthentication = class(TForm)
    MemoToken: TMemo;
    MemoContentJSON: TMemo;
    Panel1: TPanel;
    BtnGetResourceC: TButton;
    BtnLoginUser1: TButton;
    Splitter1: TSplitter;
    MemoContentHTML: TMemo;
    Splitter2: TSplitter;
    BtnLoginUser2: TButton;
    BtnGetResourceB: TButton;
    BtnGetResourceA: TButton;
    BtnLoginUser3: TButton;
    BtnLoginUser4: TButton;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    BtnLogOut: TButton;
    procedure BtnGetResourceAClick(Sender: TObject);
    procedure BtnGetResourceBClick(Sender: TObject);
    procedure BtnGetResourceCClick(Sender: TObject);
    procedure BtnLoginUser1Click(Sender: TObject);
    procedure BtnLoginUser2Click(Sender: TObject);
    procedure BtnLoginUser4Click(Sender: TObject);
    procedure BtnLoginUser3Click(Sender: TObject);
    procedure BtnLogOutClick(Sender: TObject);
  private
    FJWToken :string; {JSON Web Token. Authentication Token}
    procedure SetJWToken(const Value: string);
    property  JWToken :string read FJWToken write SetJWToken;
  public
  end;

var
  Authentication: TAuthentication;

implementation

{$R *.dfm}

uses
  MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient,
  MVCFramework.SystemJSONUtils,
  System.JSON;

const HOST     = 'http://192.168.10.146';
      USERNAME_1 = 'juanc.cilleruelo';                      {ADMIN}
      PASSWORD_1 = '940FD1E8-6F8A-4FCC-9C62-407E5CE461CB';

      USERNAME_2 = 'alex.andreo';                           {MANAGER}
      PASSWORD_2 = '3E0D9327-FE5A-4186-A164-B130229C495E';

      USERNAME_3 = 'chimo.eture';                           {USER}
      PASSWORD_3 = '9276300B-B3F0-44E3-9406-086D8555784E';

      USERNAME_4 = 'soldado.desconocido';
      PASSWORD_4 = '89D9C0B1-FF2E-417B-B86E-E56D4FE7B0CB';

procedure TAuthentication.BtnGetResourceAClick(Sender: TObject);
var Client :IMVCRESTClient;
    Resp   :IMVCRESTResponse;
begin
   if FJWToken.IsEmpty then begin
      ShowMessage('The user need to be loged');
      Exit;
   end;

   Client := TMVCRESTClient.New.BaseURL(HOST, 8080);
   Client.ReadTimeOut(0);
   Client.SetBearerAuthorization(FJWToken);
   Client.AddQueryStringParam('firstname', 'Daniele')
         .AddQueryStringParam('lastname' , 'Teti'   );

   { Getting JSON response }
   Resp := Client.Accept( 'application/json').Get('/admin/resourceA');
   if not Resp.Success then begin
      ShowMessage(Resp.Content);
   end;

   MemoContentJSON.Lines.Text := Resp.Content;
   {------ ------}

   { Getting HTML response }
   (*Resp := Client.Accept('text/html').Get('/admin/resourceA');
   if not Resp.Success then begin
      ShowMessage(Resp.Content);
   end;

   MemoContentHTML.Lines.Text := Resp.Content;*)
   {------ ------}

end;

procedure TAuthentication.BtnGetResourceBClick(Sender: TObject);
var Client :IMVCRESTClient;
    Resp   :IMVCRESTResponse;
begin
   if FJWToken.IsEmpty then begin
      ShowMessage('The user need to be loged');
      Exit;
   end;

   Client := TMVCRESTClient.New.BaseURL(HOST, 8080);
   Client.ReadTimeOut(0);
   Client.SetBearerAuthorization(FJWToken);
   Client.AddQueryStringParam('firstname', 'Daniele')
         .AddQueryStringParam('lastname' , 'Teti'   );

   { Getting JSON response }
   Resp := Client.Accept( 'application/json').Get('/admin/resourceB');
   if not Resp.Success then begin
      ShowMessage(Resp.Content);
   end;

   MemoContentJSON.Lines.Text := Resp.Content;
end;

procedure TAuthentication.BtnGetResourceCClick(Sender: TObject);
var Client :IMVCRESTClient;
    Resp   :IMVCRESTResponse;
begin
   if FJWToken.IsEmpty then begin
      ShowMessage('The user need to be loged');
      Exit;
   end;

   Client := TMVCRESTClient.New.BaseURL(HOST, 8080);
   Client.ReadTimeOut(0);
   Client.SetBearerAuthorization(FJWToken);
   Client.AddQueryStringParam('firstname', 'Daniele')
         .AddQueryStringParam('lastname' , 'Teti'   );

   { Getting JSON response }
   Resp := Client.Accept( 'application/json').Get('/admin/resourceC');
   if not Resp.Success then begin
      ShowMessage(Resp.Content);
   end;

   MemoContentJSON.Lines.Text := Resp.Content;
end;

procedure TAuthentication.BtnLoginUser1Click(Sender: TObject);
var Client :IMVCRESTClient;
    Rest   :IMVCRESTResponse;
    JSON   :TJSONObject;
begin
   Client := TMVCRESTClient.New.BaseURL(HOST, 8080);
   Client.ReadTimeOut(0);
   Client.SetBasicAuthorization(USERNAME_1, PASSWORD_1);

   Rest := Client.Post('/login');
   if not Rest.Success then begin
      ShowMessage('HTTP ERROR: '         + Rest.StatusCode.ToString + sLineBreak +
                  'HTTP ERROR MESSAGE: ' + Rest.StatusText + sLineBreak +
                  'ERROR MESSAGE: '      + Rest.Content);
      Exit;
   end;

   JSON := TSystemJSON.StringAsJSONObject(Rest.Content);
   try
      JWToken := JSON.GetValue('token').Value;
      Self.Caption := 'Authentication (User 1) Admin';
   finally
      JSON.Free;
   end;
end;

procedure TAuthentication.BtnLoginUser2Click(Sender: TObject);
var Client :IMVCRESTClient;
    Rest   :IMVCRESTResponse;
    JSON   :TJSONObject;
begin
   Client := TMVCRESTClient.New.BaseURL(HOST, 8080);
   Client.ReadTimeOut(0);

   Rest := Client.Post('/login', Format('{"jwtusername":"%s","jwtpassword":"%s"}', [USERNAME_2, PASSWORD_2]));
   if not Rest.Success then begin
     ShowMessage('HTTP ERROR: '         + Rest.StatusCode.ToString + sLineBreak +
                 'HTTP ERROR MESSAGE: ' + Rest.StatusText + sLineBreak +
                 'ERROR MESSAGE: '      + Rest.Content);
     Exit;
   end;

   JSON := TSystemJSON.StringAsJSONObject(Rest.Content);
   try
      JWToken := JSON.GetValue('token').Value;
      Self.Caption := 'Authentication (User 2) Manager';
   finally
      JSON.Free;
   end;

end;

procedure TAuthentication.BtnLoginUser3Click(Sender: TObject);
var Client :IMVCRESTClient;
    Rest   :IMVCRESTResponse;
    JSON   :TJSONObject;
begin
   Client := TMVCRESTClient.New.BaseURL(HOST, 8080);
   Client.ReadTimeOut(0);

   Rest := Client.Post('/login', Format('{"jwtusername":"%s","jwtpassword":"%s"}', [USERNAME_3, PASSWORD_3]));
   if not Rest.Success then begin
     ShowMessage('HTTP ERROR: '         + Rest.StatusCode.ToString + sLineBreak +
                 'HTTP ERROR MESSAGE: ' + Rest.StatusText + sLineBreak +
                 'ERROR MESSAGE: '      + Rest.Content);
     Exit;
   end;

   JSON := TSystemJSON.StringAsJSONObject(Rest.Content);
   try
      JWToken := JSON.GetValue('token').Value;
      Self.Caption := 'Authentication (User 2) User';
   finally
      JSON.Free;
   end;
end;

procedure TAuthentication.BtnLoginUser4Click(Sender: TObject);
var Client :IMVCRESTClient;
    Rest   :IMVCRESTResponse;
    JSON   :TJSONObject;
begin
   Client := TMVCRESTClient.New.BaseURL(HOST, 8080);
   Client.ReadTimeOut(0);
   Client.SetBasicAuthorization(USERNAME_4, PASSWORD_4);

   Rest := Client.Post('/login');
   if not Rest.Success then begin
      ShowMessage('HTTP ERROR: '         + Rest.StatusCode.ToString + sLineBreak +
                  'HTTP ERROR MESSAGE: ' + Rest.StatusText + sLineBreak +
                  'ERROR MESSAGE: '      + Rest.Content);
      Exit;
   end;

   {It cannot execute the next part of the code due to the received exception.}

   JSON := TSystemJSON.StringAsJSONObject(Rest.Content);
   try
      JWToken := JSON.GetValue('token').Value;
   finally
      JSON.Free;
   end;
end;

procedure TAuthentication.BtnLogOutClick(Sender: TObject);
begin
   JWToken := '';
   Self.Caption := 'Authentication';
end;

procedure TAuthentication.SetJWToken(const Value: string);
begin
   FJWToken := Value;
   MemoToken.Lines.Text := Value;
end;

end.
