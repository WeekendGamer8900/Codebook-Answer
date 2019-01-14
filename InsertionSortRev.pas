program InsertionSortRev;

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
  for i := size - 2 downto 0 do
  begin
    j := i + 1;
    sorted := False;
    while (j <= size - 1) and (not sorted) do
    begin
      if (arr[j] > arr[j - 1]) then
        swap(arr[j], arr[j - 1])
      else
        sorted := True;
      j := j + 1;
    end;
    for j := 0 to size - 1 do
      Write(arr[j], ' ');
    writeln;
  end;
end.
