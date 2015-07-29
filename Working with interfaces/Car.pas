unit Car;

interface
uses Recyclable;
type
TCar = class (TInterfacedObject, IRecycable)
  private
    CarName : string;
    CarAge : byte;
    CarIsRecycable : boolean;
    function GetIsRecycable : boolean;
  Published
    property Name : string read CarName;
    property Age : Byte read CarAge write CarAge;
    property IsRecycable : Boolean read GetIsRecycable;
    Constructor Create(Name : string);
end;

implementation
Constructor TCar.Create(Name: string);
begin
   CarName := Name;
   Age := 0;
   CarIsRecycable := True;
end;

function TCar.GetIsRecycable : boolean;
begin
  Result := IsRecycable;
end;

end.
