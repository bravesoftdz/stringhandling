unit XmlParser;

interface
uses xmldom, XMLIntf, msxmldom, XMLDoc, SysUtils, MSXML ;
type
Txml = Class
  private
  fileName : String;
  xml : IXMLDocument;
  public
  constructor Create(FileName : string);
  function GetFirstChild : string;
End;


implementation
Constructor Txml.Create(FileName: string);
begin
  if not FileExists(FileName) then exit;
  xml := LoadXMLDocument(FileName);

  if (xml.DocumentElement = nil) or (xml.DocumentElement.NodeName <> 'Vehicle') then
  exit;
end;

function Txml.GetFirstChild : string;
var
node : IXMLDomNode;

begin
  result := '';
end;

end.
