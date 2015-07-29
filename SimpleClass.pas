unit SimpleClass;

interface


const
 Airliner = 0;
 Commuter = 1;
 PrivateCraft = 2;
 TakingOf = 0;

type


TVehicle = Class
private
  CurrentGear : integer;
  Started : boolean;
  Speed : integer;
protected
  procedure StartProcedure;
public
  HaveKey : Boolean;
  Start : Boolean;
  Procedure GetGear(Gear : integer);
  Procedure Accelerate (Accelerator : integer);
  Procedure Brake (Factor : integer);
  Constructor Create();
  Constructor CreateModel (Model : string);
End;

implementation

end.
