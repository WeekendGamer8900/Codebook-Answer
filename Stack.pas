program StackSim;

const
  size = 10;

type
  stackType = record
    top:  integer;
    Data: array[1..size] of integer;
  end;
var
  stack: stackType;

  procedure init(var s: stackType);
  var
    i: integer;
  begin
    s.top := 0;
    for i := 1 to size do
      s.Data[i] := 0;
  end;

  function isFull(var s: stackType): boolean;
  begin
    isFull := s.top = size;
  end;

  function isEmpty(var s: stackType): boolean;
  begin
    isEmpty := s.top = 0;
  end;

  procedure push(var s: stackType; d: integer);
  begin
    if not isFull(s) then
    begin
      s.top := s.top + 1;
      s.Data[s.top] := d;
    end;
  end;

  function pop(var s: stackType): integer;
  begin
    if not isEmpty(s) then
    begin
      pop := s.Data[s.top];
      s.top := s.top - 1;
    end;
  end;

  procedure print(var s: stackType);
  var
    i: integer;
  begin
    for i := 1 to s.top do
    begin
      Write(s.Data[i], ' ');
    end;
    writeln;
  end;

var
  s: char;
  d: integer;
begin
  init(stack);
  repeat
    Read(s);
    if (s = 'i') then
    begin
      readln(d);
      if (isFull(stack)) then
      else
      begin
        push(stack, d);
      end;
      print(stack);
    end
    else if (s = 'o') then
    begin
      if (isEmpty(stack)) then
        writeln
      else
      begin
        d := pop(stack);
        writeln(d);
      end;
    end
  until s = 'e';
end.
