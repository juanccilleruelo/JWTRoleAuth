unit AuthenticationU;

interface

uses
  System.SysUtils,
  MVCFramework.Commons,
  System.Generics.Collections,
  MVCFramework,
  MVCFramework.Middleware.Authentication.RoleBasedAuthHandler;

type
  TAuthenticationSample = class(TRoleBasedAuthHandler)
  public
    procedure OnAuthentication(
      const AContext    :TWebContext;
      const UserName    :string;
      const Password    :string;
            UserRoles   :TList<string>;
      var   IsValid     :Boolean;
      const SessionData :TDictionary<string, string>
      ); override;
  end;

implementation

const HOST       = 'http://192.168.10.146';
      USERNAME_1 = 'juanc.cilleruelo';                         {ADMIN}
      PASSWORD_1 = '940FD1E8-6F8A-4FCC-9C62-407E5CE461CB';

      USERNAME_2 = 'alex.andreo';                              {MANAGER}
      PASSWORD_2 = '3E0D9327-FE5A-4186-A164-B130229C495E';

      USERNAME_3 = 'chimo.eture';                              {USER}
      PASSWORD_3 = '9276300B-B3F0-44E3-9406-086D8555784E';

      USERNAME_4 = 'soldado.desconocido';
      PASSWORD_4 = '89D9C0B1-FF2E-417B-B86E-E56D4FE7B0CB';

{ TAuthenticationSample }
procedure TAuthenticationSample.OnAuthentication(const AContext: TWebContext; const UserName, Password: string;
  UserRoles: TList<string>; var IsValid: Boolean; const SessionData: TDictionary<string, string>);
begin
   IsValid := not UserName.IsEmpty;
   if IsValid then begin
      if UserName.Equals(USERNAME_4) and Password.Equals(PASSWORD_4) then begin
         {This user raises an exception. Because the admin wants it. Of course}
         raise EMVCException.Create(500, 1024, 'This is a custom exception raised in "TAuthenticationSample.OnAuthentication"');
      end;

      // Add here all the roles that the user has. These roles will be added to the JWT token
      if UserName.Equals(USERNAME_1) and Password.Equals(PASSWORD_1) then begin
         UserRoles.Add('ADMIN'  );
         UserRoles.Add('MANAGER');
         UserRoles.Add('USER'   );
      end;

      if UserName.Equals(USERNAME_2) and Password.Equals(PASSWORD_2) then begin
         UserRoles.Add('MANAGER');
         UserRoles.Add('USER'   );
      end;

      if UserName.Equals(USERNAME_3) and Password.Equals(PASSWORD_3) then begin
         UserRoles.Add('USER');
      end;

      // You can add custom data to the logged user
      SessionData.AddOrSetValue('customkey1', 'customvalue1');
      SessionData.AddOrSetValue('customkey2', 'customvalue2');
   end
   else begin
      UserRoles.Clear;
   end;
end;

end.
