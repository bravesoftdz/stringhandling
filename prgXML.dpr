program prgXML;

uses
  Vcl.Forms,
  frmReadXml in 'frmReadXml.pas' {Form1},
  XmlParser in 'XmlParser.pas',
  AirplanU in 'AirplanU.pas',
  XmlDOMDocument in 'XmlDOMDocument.pas',
  txtFile in 'txtFile.pas',
  FileOperations in 'FileOperations.pas',
  lstTList in 'lstTList.pas',
  frmListCollection in 'frmListCollection.pas' {frmLists},
  List in 'Working with lists\List.pas',
  StringList in 'Working with lists\StringList.pas',
  Recyclable in 'Working with interfaces\Recyclable.pas',
  Car in 'Working with interfaces\Car.pas',
  Ball in 'Inheritance\Ball.pas',
  FootBall in 'Inheritance\FootBall.pas',
  frmBallData in 'Inheritance\frmBallData.pas' {frmBall},
  AbstractBasePolygon in 'Abstraction\AbstractBasePolygon.pas',
  TriangleChild in 'Abstraction\TriangleChild.pas',
  clsTest in 'Object oriented programming\clsTest.pas',
  clsEncapsulation in 'Object oriented programming\clsEncapsulation.pas',
  clsTObjectList in 'Working with lists\clsTObjectList.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmBall, frmBall);
  // Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmLists, frmLists);
  Application.Run;
end.

