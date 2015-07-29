unit lstTList;

interface
type
TCustomer = Class // Customer class
  private
    CustomerName : string;
    CustomerNumber : integer;
  public
    property Name : string read CustomerName;
    property Number : integer read CustomerNumber;
    Constructor Create(const CustomerName : string; const CustomerNumber : integer);
End;

implementation

// Constructor
Constructor TCustomer.Create(const CustomerName: string; const CustomerNumber : integer);
begin
  self.CustomerName := CustomerName;
  self.CustomerNumber := CustomerNumber;
end;

end. // End of unit
