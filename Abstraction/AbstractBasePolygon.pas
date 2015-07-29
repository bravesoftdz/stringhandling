unit AbstractBasePolygon;

interface
type
TPolygon = class
private
  sideLength : byte;
  sideCount : byte;
  function GetSideLength : byte;
  procedure SetSideLength(Length: byte);
public
  function GetSideCount : byte; virtual; abstract;
  procedure SetSideCount (Count : byte); virtual; abstract;
  function GetAreaA : single; virtual; abstract;
published
  property Length : byte read GetSideCount write SetSideCount;
  property Count : byte read GetSideCount write SetSideCount;
  Constructor Create(Length : byte);
end;
implementation

{ constructor }
Constructor TPolygon.Create(Length: Byte);
begin
  sideLength := Length;
end;

{ method to get sidelength variable }
function TPolygon.GetSideLength;
begin
  Result := sideLength;
end;

{ method to set sidelength variable }
Procedure TPolygon.SetSideLength(Length: Byte);
begin
  sideLength := Length;
end;
end.