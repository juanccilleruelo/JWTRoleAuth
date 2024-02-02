unit AppControllerU;

interface

uses
  MVCFramework,
  MVCFramework.Commons,
  MVCFramework.Logger,
  Web.HTTPApp,
  MVCFramework.Middleware.Authentication.RoleBasedAuthHandler;

type

  [MVCPath('/')]
  TApp1MainController = class(TMVCController)
  public
    [MVCPath('/public')]
    [MVCHTTPMethod([httpGET])]
    procedure PublicSection(ctx: TWebContext);
  end;

  [MVCPath('/admin')]
  [MVCRequiresAuthentication] { Defines that all control methods require authentication }
  TAdminController = class(TMVCController)
  protected
    {Executed before any action on this controller}
    procedure OnBeforeAction(AContext :TWebContext; const AActionName :string; var AHandled :Boolean); override;
  public
    [MVCPath('/resourceA')]
    [MVCProduces('text/html')]
    [MVCHTTPMethod([httpGET])]
    [MVCRequiresRole('ADMIN')] { Define the role required to access this method }
    procedure ResourceA_HTML;

    [MVCPath('/resourceA')]
    [MVCProduces('application/json')]
    [MVCHTTPMethod([httpGET])]
    [MVCRequiresRole('ADMIN')]
    procedure ResourceA_JSON;

    [MVCPath('/resourceB')]
    [MVCProduces('application/json')]
    [MVCHTTPMethod([httpGET])]
    [MVCRequiresRole('MANAGER')]
    procedure ResourceB;

    [MVCPath('/resourceC')]
    [MVCProduces('application/json')]
    [MVCHTTPMethod([httpGET])]
    [MVCRequiresRole('USER')]
    procedure ResourceC;
  end;

implementation

uses
  System.SysUtils,
  System.JSON,
  System.Classes,
  System.Generics.Collections;

{ TApp1MainController }

procedure TApp1MainController.PublicSection(ctx: TWebContext);
var JObj :TJSONObject;
begin
   JObj := TJSONObject.Create;
   JObj.AddPair('message', 'This is a public section');
   Render(JObj);
end;

{ TAdminController }

procedure TAdminController.OnBeforeAction(AContext: TWebContext; const AActionName :string; var AHandled: Boolean);
begin
   inherited;
   Assert(AContext.LoggedUser.CustomData['customkey1'] = 'customvalue1', 'customkey1 not valid');
   Assert(AContext.LoggedUser.CustomData['customkey2'] = 'customvalue2', 'customkey2 not valid');
   AHandled := False;
end;

procedure TAdminController.ResourceA_HTML;
var Pair :TPair<String, String>;
begin
   ContentType := TMVCMediaType.TEXT_PLAIN;
   ResponseStream.AppendLine('Hey! Hello ' + Context.LoggedUser.UserName + ', now you are a logged user and this is a protected content!');

   ResponseStream.AppendLine('As logged user you have the following roles: ' + sLineBreak +
   string.Join(sLineBreak, Context.LoggedUser.Roles.ToArray));

   ResponseStream.AppendLine('You CustomClaims are: ' + sLineBreak);

   for Pair in Context.LoggedUser.CustomData do begin
     ResponseStream.AppendFormat('%s = %s' + sLineBreak, [Pair.Key, Pair.Value]);
   end;

   RenderResponseStream;
end;

procedure TAdminController.ResourceA_JSON;
var JObj        :TJSONObject;
    JArr        :TJSONArray;
    QueryParams :TStrings;
    i           :Integer;
    Pair        :TPair<string, string>;
begin
   ContentType := TMVCMediaType.APPLICATION_JSON;
   JObj := TJSONObject.Create;
   JObj.AddPair('message', 'This is protected content accessible only by ADMIN');

   JArr := TJSONArray.Create;
   JObj.AddPair('querystringparameters', JArr);

   QueryParams := Context.Request.QueryStringParams;
   for i := 0 to QueryParams.Count - 1 do begin
      JArr.AddElement(TJSONObject.Create(TJSONPair.Create(
         QueryParams.Names[I],
         QueryParams.ValueFromIndex[I])));
   end;

   JArr := TJSONArray.Create;
   JObj.AddPair('customclaims', JArr);
   for Pair in Context.LoggedUser.CustomData do begin
      JArr.AddElement(TJSONObject.Create(TJSONPair.Create(Pair.Key, Pair.Value)));
   end;

   Render(JObj);
end;

procedure TAdminController.ResourceB;
var JObj        :TJSONObject;
    JArr        :TJSONArray;
    QueryParams :TStrings;
    i           :Integer;
    Pair        :TPair<string, string>;
begin
   ContentType := TMVCMediaType.APPLICATION_JSON;
   JObj := TJSONObject.Create;
   JObj.AddPair('message', 'This is protected content accessible only by ADMIN and MANAGER');

   JArr := TJSONArray.Create;
   JObj.AddPair('querystringparameters', JArr);

   QueryParams := Context.Request.QueryStringParams;
   for i := 0 to QueryParams.Count - 1 do begin
      JArr.AddElement(TJSONObject.Create(TJSONPair.Create(
         QueryParams.Names[I],
         QueryParams.ValueFromIndex[I])));
   end;

   JArr := TJSONArray.Create;
   JObj.AddPair('customclaims', JArr);
   for Pair in Context.LoggedUser.CustomData do begin
      JArr.AddElement(TJSONObject.Create(TJSONPair.Create(Pair.Key, Pair.Value)));
   end;

   Render(JObj);
end;

procedure TAdminController.ResourceC;
var JObj        :TJSONObject;
    JArr        :TJSONArray;
    QueryParams :TStrings;
    i           :Integer;
    Pair        :TPair<string, string>;
begin
   ContentType := TMVCMediaType.APPLICATION_JSON;
   JObj := TJSONObject.Create;
   JObj.AddPair('message', 'This is protected content accessible only by ADMIN and MANAGER and USER');

   JArr := TJSONArray.Create;
   JObj.AddPair('querystringparameters', JArr);

   QueryParams := Context.Request.QueryStringParams;
   for i := 0 to QueryParams.Count - 1 do begin
      JArr.AddElement(TJSONObject.Create(TJSONPair.Create(
         QueryParams.Names[I],
         QueryParams.ValueFromIndex[I])));
   end;

   JArr := TJSONArray.Create;
   JObj.AddPair('customclaims', JArr);
   for Pair in Context.LoggedUser.CustomData do begin
      JArr.AddElement(TJSONObject.Create(TJSONPair.Create(Pair.Key, Pair.Value)));
   end;

   Render(JObj);
end;

end.
