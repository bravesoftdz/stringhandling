unit frmListCollection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, lstTList, Vcl.StdCtrls, List, StringList,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmLists = class(TForm)
    btnNext: TButton;
    btnPrevious: TButton;
    edTList: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edStringList: TEdit;
    edSearchStringList: TEdit;
    cbStringListItems: TComboBox;
    memClickEventResults: TMemo;
    btnLoadFile: TButton;
    btnSave: TButton;
    ListBox1: TListBox;
    tbTrackBar: TTrackBar;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure edSearchStringListKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnLoadFileClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }

    FCustomTList : TCustomList;
    FCustomStrinList : TCustomStringList;
    ICounter : integer;

  public
    { Public declarations }

  end;
var
  frmLists: TfrmLists;

implementation
{$R *.dfm}

procedure TfrmLists.btnLoadFileClick(Sender: TObject);
begin
  memClickEventResults.Clear;
  memClickEventResults.Lines.LoadFromFile('Log');
end;

procedure TfrmLists.btnSaveClick(Sender: TObject);
begin
  FCustomStrinList.SaveToFile('Log');
end;

procedure TfrmLists.ButtonClick(Sender: TObject);
begin
  if (Sender as TButton).Name = 'btnNext' then
    FCustomTList.MoveToNextItem
  else
    FCustomTList.MoveToPreviousItem;

  edTList.Text := FCustomTList.GetSelectedItem;
end;

// Used when user press the enter key in the edit control
procedure TfrmLists.edSearchStringListKeyPress(Sender: TObject; var Key: Char);
var
  nIndex : integer;
begin
  if Ord(key) = VK_RETURN then
  begin
    Key := #0;
    if FCustomStrinList.Find(edSearchStringList.Text, nIndex) then
    begin
     edStringList.Text := FCustomStrinList[nIndex];
     cbStringListItems.ItemIndex := nIndex;
    end;
  end;
end;

procedure TfrmLists.FormCreate(Sender: TObject);
var
  Customer1, Customer2, Customer3 : TCustomer;
  str : TStrings;
begin
  Customer1 := TCustomer.Create('Israr Ahmed', 100);
  FCustomTList := TCustomList.Create;
  FCustomTList.Add(Customer1);
  FCustomTList.SetDefaultItem(FCustomTList.First);

  Customer2 := TCustomer.Create('Anwar Ahmed', 102);
  FCustomTList.Add(Customer2);

  Customer3 := TCustomer.Create('Abrar Ahmed', 103);
  FCustomTList.Add(Customer3);

  edTList.Text := FCustomTList.GetSelectedItem;

  FCustomStrinList := TCustomStringList.Create;
  FCustomStrinList.AddStrings(['Lion', 'Cat', 'Dog']);
  FCustomStrinList.Sort;
  edStringList.Text := FCustomStrinList.Text;

  inc(ICounter);
  tbTrackBar.Min := 0;
  tbTrackBar.Max := ListBox1.Items.Count;
end;
procedure TfrmLists.FormDestroy(Sender: TObject);
begin
  if Assigned(FCustomTList) then
    FreeAndNil(FCustomTList);
  if Assigned(FCustomStrinList) then
    FreeAndNil(FCustomStrinList);
end;

procedure TfrmLists.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 str : TStrings;
begin
  if Sender is TPanel then
  begin
    Inc(ICounter);
    tbTrackBar.Position := 5;
    FCustomStrinList.Add(Format('Click at (%d - %d)', [x, y]));
    with  cbStringListItems do
    begin
      str := TStringList.Create;
      FCustomStrinList.Split(',', FCustomStrinList.DelimitedText, Str);
      Items.Assign(str);
      ItemIndex := 0;
    end;
  end;
end;

procedure TfrmLists.Panel2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 str : TStrings;
begin
  if Sender is TPanel then
  begin
    Inc(ICounter);
    tbTrackBar.Position := ICounter;
    FCustomStrinList.Add(Format('Click at (%d - %d)', [x, y]));
    with  cbStringListItems do
    begin
      str := TStringList.Create;
      FCustomStrinList.Split(',', FCustomStrinList.DelimitedText, Str);
      Items.Assign(str);
      ItemIndex := 0;
    end;
  end;
end;

end.
