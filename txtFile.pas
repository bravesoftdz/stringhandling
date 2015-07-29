unit txtFile;

interface
uses dialogs, sysUtils;
type

TCustomer = record
  name : string[20];
  age : integer;
  male : boolean;
end;


 TFile = class
   private
    txFile : TextFile;
    CustomerFile : File of TCustomer;
   public
    constructor Create();
    procedure CreateFile(Name : string);
    procedure ReadData(); overload;
    procedure ReadData(customer : TCustomer); overload;
    procedure WriteData(); overload;
    procedure WriteData(customer : TCustomer) ; overload;
 end;
implementation
Constructor TFile.Create;
Begin

End;

procedure TFile.CreateFile(Name : string);
var
 tFile : TextFile;
begin
  AssignFile(txFile, Name);
end;

procedure TFile.ReadData;
var
  FileDate : string;
begin
 while not Eof(txFile) do
 begin
   Readln(txFile, FileDate);
   ShowMessage(FileDate);
 end;
  CloseFile(txFile);
end;


Procedure TFile.ReadData(customer: TCustomer);
begin

end;
procedure TFile.WriteData(customer : TCustomer);
begin
  Rewrite(CustomerFile);
  Write(CustomerFile, customer);
  CloseFile(CustomerFile);
end;

procedure TFile.WriteData;
begin
 Rewrite(txFile);
 Writeln(txFile, 'Hello');
 Writeln(txFile, 'World');
end;

end.
