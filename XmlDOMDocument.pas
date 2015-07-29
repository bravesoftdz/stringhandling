unit XmlDOMDocument;

interface
uses XMLDom, XMLDoc;
type
 TXmlDOMDocument = class
 private
  iXML : IDOMDocument;
 public
  procedure CreateDocument(var XMLDoc: TXMLDocument);
  procedure EmptyXMLDocument(var XMLDoc: TXMLDocument);
  procedure AddAttribute(iNode : IDOMNode; name, value : string);
 end;

implementation

procedure TXmlDOMDocument.CreateDocument(var XMLDoc: TXMLDocument);
var
 iRoot, iNode, iNode2, iChild, iAttribute: IDOMNode;
 iXml: IDOMDocument;
begin
 EmptyXMLDocument(XMLDoc); // Clear document content
 iXML := XMLDoc.DOMDocument; // Root
 iRoot := iXML.appendChild(iXml.createElement('xml'));
 iNode := iRoot.appendChild(iXml.createElement('Test0'));
 iNode.appendChild(iXml.createElement('Test1'));
 iChild := iNode.appendChild(iXML.createElement('Test2'));
 iChild.appendChild(ixml.createElement('Test3'));
 iNode.insertBefore(ixml.createElement('Test4'), iChild);
 AddAttribute (iChild, 'Name', 'Israr Ahmed');
 AddAttribute (iChild, 'Caption', 'Job');
 AddAttribute (iChild, 'Font.Name', 'Thoma'); // sub-elements?
 AddAttribute (iChild, 'Left', '30');
 AddAttribute (iChild, 'Hint', 'Custom Value');

end;

procedure TXMLDomDocument.EmptyXMLDocument(var XMLDoc: TXMLDocument);
begin
   XMLDoc.Active := False;
   XMLDoc.XML.Text := '';
   XMLDoc.Active := True;
end;

procedure TXmlDOMDocument.AddAttribute(iNode: IDOMNode; name: string; value: string);
var
 iAttribute : IDOMNode;
begin
 iAttribute := iNode.ownerDocument.createAttribute(name);
 iAttribute.nodeValue := value;
 iNode.attributes.setNamedItem(iAttribute);
end;

end.
