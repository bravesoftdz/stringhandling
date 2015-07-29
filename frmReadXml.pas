unit frmReadXml;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Xml.xmldom,
  Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc, Vcl.ComCtrls, XmlDOMDocument, Tlhelp32, FileOperations;


 type
   PTOKEN_USER = ^TOKEN_USER;
   _TOKEN_USER = record
     User: TSidAndAttributes;
   end;
   TOKEN_USER = _TOKEN_USER;

type
  TForm1 = class(TForm)
    XMLDocument1: TXMLDocument;
    Button1: TButton;
    TreeView1: TTreeView;
    Memo1: TMemo;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure DomToTree (XmlNode: IXMLNode; TreeNode: TTreeNode);
    function GetUserAndDomainFromPID(ProcessId: DWORD; var User, Domain: string): Boolean;
    procedure WriteFile();
  end;

var
  Form1: TForm1;

implementation
uses txtFile;

{$R *.dfm}


procedure TForm1.WriteFile;
var
 Customer : TCustomer;
 CustomerRec : TFile;
begin
 customer.name := 'Israr Ahmed';
 Customer.age := 33;
 Customer.male := True;
 CustomerRec.CreateFile('CustomersRecord.txt');
 CustomerRec.WriteData(Customer);
end;
procedure TForm1.Button1Click(Sender: TObject);
var
 s : string;
 xmlDoc : TXmlDOMDocument;
 StartNode :  IXMLNode;
 FileName : string;
begin
 if not Assigned(XMLDocument1) then exit;

 xmlDoc.CreateDocument(XMLDocument1);
 s := XMLDocument1.XML.Text;
 Memo1.Lines.Text :=  formatxmldata(s);
 // DomToTree (XMLDocument1.DocumentElement, nil);
end;

procedure TForm1.DomToTree (XmlNode: IXMLNode; TreeNode: TTreeNode);
var
  I: Integer;
  NewTreeNode: TTreeNode;
  NodeText: string;
  AttrNode: IXMLNode;
begin
  // skip text nodes and other special cases
  if XmlNode.NodeType <> ntElement then
    Exit;
  // add the node itself
  NodeText := XmlNode.NodeName;
  if XmlNode.IsTextElement then
    NodeText := NodeText + ' = ' + XmlNode.NodeValue;
  NewTreeNode := TreeView1.Items.AddChild(TreeNode, NodeText);
  // add attributes
  for I := 0 to xmlNode.AttributeNodes.Count - 1 do
  begin
    AttrNode := xmlNode.AttributeNodes.Nodes[I];
    TreeView1.Items.AddChild(NewTreeNode,
      '[' + AttrNode.NodeName + ' = "' + AttrNode.Text + '"]');
  end;
  // add each child node
  if XmlNode.HasChildNodes then
    for I := 0 to xmlNode.ChildNodes.Count - 1 do
      DomToTree (xmlNode.ChildNodes.Nodes [I], NewTreeNode);
end;

procedure TForm1.FormCreate(Sender: TObject);

var
   hProcSnap: THandle;
   pe32: TProcessEntry32;
   Domain, User: string;
   s: string;
   IOFile : TFileOperation;
   FileRec : TFilesRecord;

 begin
   IOFile.Create;
   s := 'C:\Users\Isra.ahm\Desktop\EXCOSoftware';
   FileRec := IOFile.FindFileFromDirectory(s, '*.*');
   ListBox1.Items.Add(FileRec.FileRecord.FindData.cFileName);
   ListBox1.Items.Add(DateTimeToStr(FileRec.FileRecord.Time));
   ListBox1.Items.Add(IntToStr(FileRec.FileRecord.Size));
   ListBox1.Items.Add(IntToStr(FileRec.FileRecord.Attr));
   ListBox1.Items.Add(DateToStr(FileRec.FileRecord.TimeStamp));
   s := EmptyStr;

   // SetLength(s, 100);
   // WriteFile;
   hProcSnap := CreateToolHelp32SnapShot(TH32CS_SNAPALL, 0);
   if hProcSnap = INVALID_HANDLE_VALUE then Exit;

   pe32.dwSize := SizeOf(ProcessEntry32);

   if Process32First(hProcSnap, pe32) = True then
     while Process32Next(hProcSnap, pe32) = True do
     begin

       if GetUserAndDomainFromPID(pe32.th32ProcessID, User, Domain) then
       begin
         s := Format('%s User: %s ; Domain: %s',[StrPas(pe32.szExeFile), User, Domain]);
         //ListBox1.Items.Add(s);
       end else
         // ListBox1.Items.Add(StrPas(pe32.szExeFile));
     end;
   CloseHandle(hProcSnap);


{var
 s : string;
 xmlDoc : TXmlDOMDocument;
begin

 xmlDoc := TXmlDOMDocument.Create();
 xmlDoc.CreateDocument(XMLDocument2);
 s := XMLDocument1.XML.Text;
 }
end;

function TForm1.GetUserAndDomainFromPID(ProcessId: DWORD; var User, Domain: string): Boolean;
var
   hToken: THandle;
   cbBuf: Cardinal;
   ptiUser: PTOKEN_USER;
   snu: SID_NAME_USE;
   ProcessHandle: THandle;
   UserSize, DomainSize: DWORD;
   bSuccess: Boolean;
begin
   Result := False;
   ProcessHandle := OpenProcess(PROCESS_QUERY_INFORMATION, False, ProcessId);
   if ProcessHandle <> 0 then
   begin
   //  EnableProcessPrivilege(ProcessHandle, 'SeSecurityPrivilege', True);
     if OpenProcessToken(ProcessHandle, TOKEN_QUERY, hToken) then
     begin
       bSuccess := GetTokenInformation(hToken, TokenUser, nil, 0, cbBuf);
       ptiUser  := nil;
       while (not bSuccess) and (GetLastError = ERROR_INSUFFICIENT_BUFFER) do
       begin
         ReallocMem(ptiUser, cbBuf);
         bSuccess := GetTokenInformation(hToken, TokenUser, ptiUser, cbBuf, cbBuf);
       end;
       CloseHandle(hToken);

       if not bSuccess then
       begin
         Exit;
       end;

       UserSize := 0;
       DomainSize := 0;
       LookupAccountSid(nil, ptiUser.User.Sid, nil, UserSize, nil, DomainSize, snu);
       if (UserSize <> 0) and (DomainSize <> 0) then
       begin
         SetLength(User, UserSize);
         SetLength(Domain, DomainSize);
         if LookupAccountSid(nil, ptiUser.User.Sid, PChar(User), UserSize,
           PChar(Domain), DomainSize, snu) then
         begin
           Result := True;
           User := StrPas(PChar(User));
           Domain := StrPas(PChar(Domain));
         end;
       end;

       if bSuccess then
       begin
         FreeMem(ptiUser);
       end;
     end;
     CloseHandle(ProcessHandle);
   end;
end;




end.
