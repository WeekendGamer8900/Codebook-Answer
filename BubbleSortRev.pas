program BubbleSortRev;

const
  size = 10;
var
  i, j: integer;
  arr:  array[0..size - 1] of integer;
  sorted: boolean;

  procedure swap(var a, b: integer);
  var
    c: integer;
  begin
    c := a;
    a := b;
    b := c;
  end;

begin
  for i := 0 to size - 1 do
    Read(arr[i]);
  for i := 0 to size - 1 do
    Write(arr[i], ' ');
  writeln;
  i := 0;
  repeat
    sorted := True;
    for j := size - 2 downto i do
      if (arr[j] < arr[j + 1]) then
      begin
        swap(arr[j], arr[j + 1]);
        sorted := False;
      end;
    i := i + 1;
    for j := 0 to size - 1 do
      Write(arr[j], ' ');
    writeln;
  until sorted or (i = size - 1);
end.
