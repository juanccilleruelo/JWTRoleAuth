program JWTClient;

uses
  Vcl.Forms,
  MainClientFormU in 'MainClientFormU.pas' {Authentication};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAuthentication, Authentication);
  Application.Run;
end.
