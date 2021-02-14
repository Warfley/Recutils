unit Tuple;

{$mode objfpc}{$H+}
{$ModeSwitch advancedrecords}

interface

uses
  Classes, SysUtils;

type

  { TPair }

  generic TPair<TFirst, TSecond> = record
  public type
    TSpecializedPair = specialize TPair<TFirst, TSecond>;
  public
    First: TFirst;
    Second: TSecond;
  private
    class operator Initialize(var pair: TSpecializedPair);
  public
    constructor Create(constref AFirst: TFirst; constref ASecond: TSecond);
  end;

  { TTriple }

  generic TTriple<TFirst, TSecond, TThird> = record
  public type
    TSpecializedTriple = specialize TTriple<TFirst, TSecond, TThird>;
  public
    First: TFirst;
    Second: TSecond;
    Third: TThird;
  private
    class operator Initialize(var triple: TSpecializedTriple);
  public
    constructor Create(constref AFirst: TFirst; constref ASecond: TSecond;
                       constref AThird: TThird);
  end;

  { TQuadruple }

  generic TQuadruple<TFirst, TSecond, TThird, TFourth> = record
  public type
    TSpecializedQuadruple = specialize TQuadruple<TFirst, TSecond, TThird, TFourth>;
  public
    First: TFirst;
    Second: TSecond;
    Third: TThird;
    Fourth: TFourth;
  private
    class operator Initialize(var quadruple: TSpecializedQuadruple);
  public
    constructor Create(constref AFirst: TFirst; constref ASecond: TSecond;
                       constref AThird: TThird; constref AFourth: TFourth);
  end;

  { TQuintuple }

  generic TQuintuple<TFirst, TSecond, TThird, TFourth, TFifth> = record
  public type
    TSpecializedQuintuple = specialize TQuintuple<TFirst, TSecond, TThird,
                                                  TFourth, TFifth>;
  public
    First: TFirst;
    Second: TSecond;
    Third: TThird;
    Fourth: TFourth;
    Fifth: TFifth;
  private
    class operator Initialize(var quintuple: TQuintuple);
  public
    constructor Create(constref AFirst: TFirst; constref ASecond: TSecond;
                       constref AThird: TThird; constref AFourth: TFourth;
                       constref AFifth: TFifth);
  end;

implementation

{ TQuintuple }

class operator TQuintuple.Initialize(var quintuple: TQuintuple);
begin
  quintuple.First := Default(TFirst);
  quintuple.Second := Default(TSecond);
  quintuple.Third := Default(TThird);
  quintuple.Fourth := Default(TFourth);
  quintuple.Fifth := Default(TFifth);
end;

constructor TQuintuple.Create(constref AFirst: TFirst; constref
  ASecond: TSecond; constref AThird: TThird; constref AFourth: TFourth;
  constref AFifth: TFifth);
begin
  First := AFirst;
  Second := ASecond;
  Third := AThird;
  Fourth := AFourth;
  Fifth := AFifth;
end;

{ TQuadruple }

class operator TQuadruple.Initialize(var quadruple: TSpecializedQuadruple);
begin
  quadruple.First := Default(TFirst);
  quadruple.Second := Default(TSecond);
  quadruple.Third := Default(TThird);
  quadruple.Fourth := Default(TFourth);
end;

constructor TQuadruple.Create(constref AFirst: TFirst; constref
  ASecond: TSecond; constref AThird: TThird; constref AFourth: TFourth);
begin
  First := AFirst;
  Second := ASecond;
  Third := AThird;
  Fourth := AFourth;
end;

{ TTriple }

class operator TTriple.Initialize(var triple: TSpecializedTriple);
begin
  triple.First := Default(TFirst);
  triple.Second := Default(TSecond);
  triple.Third := Default(TThird);
end;

constructor TTriple.Create(constref AFirst: TFirst; constref ASecond: TSecond;
  constref AThird: TThird);
begin
  First := AFirst;
  Second := ASecond;
  Third := AThird;
end;

{ TPair }

class operator TPair.Initialize(var pair: TSpecializedPair);
begin
  pair.First := Default(TFirst);
  pair.Second := Default(TSecond);
end;

constructor TPair.Create(constref AFirst: TFirst; constref ASecond: TSecond);
begin
  First := AFirst;
  Second := ASecond;
end;

end.

