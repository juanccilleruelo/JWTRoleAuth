program JWTRoleAuthServer;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  Winapi.Windows,
  Winapi.ShellAPI,
  Web.WebReq,
  Web.WebBroker,
  IdHTTPWebBrokerBridge,
  MVCFramework.Commons,
  IdContext,
  WebModuleUnit1 in 'WebModuleUnit1.pas' {WebModule1: TWebModule},
  AppControllerU in 'AppControllerU.pas',
  AuthenticationU in 'AuthenticationU.pas';

{$R *.res}

procedure RunServer(APort: Integer);
var Server :TIdHTTPWebBrokerBridge;
begin
   Writeln(Format('Starting HTTP Server or port %d', [APort]));
   Server := TIdHTTPWebBrokerBridge.Create(nil);
   try
      Server.OnParseAuthentication := TMVCParseAuthentication.OnParseAuthentication;
      Server.DefaultPort           := APort;
      Server.Active := True;
      Writeln('Press RETURN to stop the server');
      ReadLn;
   finally
      Server.Free;
   end;
end;

begin
   ReportMemoryLeaksOnShutdown := True;
   try
      if WebRequestHandler <> nil then
         WebRequestHandler.WebModuleClass := WebModuleClass;
      WebRequestHandlerProc.MaxConnections := 1024;
      RunServer(8080);
   except
      on E: Exception do
         Writeln(E.ClassName, ': ', E.Message);
   end
end.
