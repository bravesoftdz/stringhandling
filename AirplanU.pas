unit AirplanU;

interface
uses SysUtils;
const
  Airliner = 0;
  Commuter = 1;
  PrivateCraft = 2;
  TakingOff = 0;
  Cruising = 1;
  Landing = 2;
  OmRamp = 3;
  MsgChange = 0;
  MsgTakeOff = 1;
  MsgLand = 2;
  MsgReport = 3;
type
TAirplan = Class
  private
    Name : string;
    Speed : integer;
    Altitude : integer;
    heading : integer;
    Status : integer;
    Kind : integer;
    Ceiling : integer;
  protected
    Procedure TakeOff (Dir : integer) ; virtual;
    Procedure Land ; virtual;
  public
    Constructor Create(AName : string; AKind : integer = Airliner);
    function SendMessage (Msg : integer; var Response : string;
                          Spt : integer; Dir : integer; Alt : integer) : boolean;

    // function overloading
    function GetStatus(var StatusString : string) : integer; overload; virtual;
    function GetStatus : integer; overload;

    function GetSpeed : integer;
    function GetHeading : integer;
    function GetAltitude : integer;
    function GetName : string;
End;

implementation

// Constructor
Constructor TAirplan.Create(AName: string; AKind: Integer = 0);
begin
  inherited create;
  Name := AName;
  Kind := AKind;
  Status := OmRamp;
  case AKind of
    Airliner : Ceiling := 35000;
    Commuter : Ceiling := 20000;
    PrivateCraft : Ceiling := 8000;
  end;
end;

// Take off function
procedure TAirplan.TakeOff(Dir: Integer);
begin
  heading := Dir; 
  Status := TakingOff; 
end;


procedure TAirPlan.Land;
begin
  Speed := 0;
  Heading := 0;
  Altitude := 0;
  Status := OmRamp;
end;

// Send message
function TAirplan.SendMessage(Msg: Integer; var Response: string; Spt: Integer; Dir: Integer; Alt: Integer) : boolean;
Begin 
  Result := True; 
  case Msg of
    MsgTakeOff :    // case 0
     if Status <> OmRamp then begin 
       Response := Name + ': I am alread in the air '; 
       Result := False;
     end else 
      TakeOff(dir);
    MsgChange :  // case 1
    begin 
      if Speed > 500 then
        Response := 'Command Error: Speed can not be more than 500'; 
      if Dir > 360 then
        Response := 'Command Error : Heading can not be over 360 degree'; 
      if Alt > Ceiling then
        Response := Name  + ' : I can''t go that hight';
      if (Spt = 0) and (Dir = 0) and (Alt = 0) then
        Response := Name + ' : Huh?';
      if Response <> '' then begin 
        Result := False; 
        Exit;
      end;
      if Status = OmRamp then begin
        Response := Name + ' : I '' am on the ground';
        Result := False;
      end else begin
        Speed := Spt;
        Heading := Dir;
        Altitude := Alt;
        Status := Cruising;
      end;
   end;
   MsgLand : // case 3
    if Status = OmRamp then begin
      Response := Name + ': I am already on the ground';
      Result := False;
    end else
     Land;
   MsgReport : // case 4
   begin
     GetStatus(Response);
     Exit;
   end;
  end; // end of case statement
  if Result then
    Response := Name + ': Roger.';
end;

//****************************  Get status function **************************
function TAirplan.GetStatus(var StatusString: string) : integer;
begin
StatusString := Format('%s, Altiture: %d, Heading: %d, ' +
                  'Speed: %d', [Name, Altitude, Heading, Speed]);

Result := Status;
end;

//******************************************************
function TAirplan.GetStatus : integer;
begin
  result := Status;
end;

//******************************************************
function TAirplan.GetSpeed : integer;
begin
  Result := Speed;
end;

//******************************************************
function TAirplan.GetHeading : integer;
begin
  Result := heading;
end;

//******************************************************
function TAirplan.GetAltitude : integer;
begin
  Result := Altitude;
end;

//******************************************************
function TAirplan.GetName : string;
begin
  Result := Name;
end;
End. // end of interface

