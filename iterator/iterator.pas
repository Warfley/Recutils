unit iterator;

{$mode objfpc}{$H+}
{$ModeSwitch advancedrecords}

interface

uses
  SysUtils, Generics.Collections;

type

  { TIterator }

  generic TIterator<T, TEnumerator, TArg> = record
  private type
    TTArray = Array of T;
    TTList = specialize TList<T>;
  private
    FArg: TArg;
  public
    constructor Create(constref AArg: TArg);
    function GetEnumerator: TEnumerator; {$IFDEF INLINING}inline;{$ENDIF}
    function toArray: TTArray;
    function FillList(const AList: TTList): SizeInt;
    function ToList: TTList; {$IFDEF INLINING}inline;{$ENDIF}
  end;


implementation

{ TIterator }

constructor TIterator.Create(constref AArg: TArg);
begin
  FArg := AArg;
end;

function TIterator.GetEnumerator: TEnumerator;
begin
  Result := TEnumerator.Create(FArg);
end;

function TIterator.toArray: TTArray;
var
  lst: TTList;
begin
  lst := ToList;
  try
    Result := lst.ToArray;
  finally
    lst.Free;
  end;
end;

function TIterator.FillList(const AList: TTList): SizeInt;
var
  enum: TEnumerator;
begin
  enum := GetEnumerator;
  try
    Result := 0;
    while enum.MoveNext do
    begin
      AList.Add(enum.current);
      inc(Result);
    end;
  finally
    enum.Free;
  end;
end;

function TIterator.ToList: TTList;
begin
  Result := TTList.Create;
  FillList(Result);
end;

end.

