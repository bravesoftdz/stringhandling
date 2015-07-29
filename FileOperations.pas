unit FileOperations;

//******************************************
interface
uses sysutils, System.Classes;

const _SearchString = '*.*'; // define constants

type
TFilesRecord = record
  FileRecord : TSearchRec
end;

TFileOperation = class
private
  FFile : TextFile;
public
  Constructor Create();
  function DeleteFileFromDisk(FileName : string) : boolean;
  function FindFileFromDirectory(Directory : string; SearchFile : string) : TFilesRecord;

end;

//******************************************
implementation
Constructor TFileOperation.Create();
var
  cxFile : TFileStream;
  s : string;
begin
  cxFile.Create('Temp.txt', fmCreate or fmOpenWrite);
  s := 'Hello';
  cxFile.write(s, Length(s));
end;

function TFileOperation.DeleteFileFromDisk(FileName : string) : boolean;

begin
  Result := DeleteFile(FileName);
end; // End

function TFileOperation.FindFileFromDirectory(Directory : string; SearchFile : string) : TFilesRecord;
var
  FileRec : array of TFilesRecord;
  SearchRec : TSearchRec;
  Index : integer;
begin
  if (LastDelimiter('\', Directory) = 0) then
    Directory := Directory + SearchFile
  else
    Directory := Directory + '\' + SearchFile;

  Index := 0;
  Inc(Index);
  if (FindFirst(Directory, faAnyFile, SearchRec) = 0) then exit;
  SetLength(Filerec, Index);
  FileRec[Index].FileRecord := SearchRec;
  Result := FileRec[Index];
  while FindNext(SearchRec) = 0 do
  begin
    Inc(Index);
    SetLength(Filerec, Index);
    with FileRec[Index] do
      FileRecord := SearchRec;
  end;
end;  // End
end. // End of file
