unit InerfaceEdit;

interface
type
IPaint = Interface
  procedure Paint;
End;

TSquare = class(TInterfacedObject, IPaint)
private
  IDraw : integer;
public
  procedure Paint;

end;
implementation
procedure TSquare.Paint;
begin

end;
end.
