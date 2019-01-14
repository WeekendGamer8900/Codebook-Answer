program SelectionSortRev;

const
  size = 10;
var
  i, j, min, idx: integer;
  arr: array[0..size - 1] of integer;
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
  for i := size - 1 downto 1 do
  begin
    min := arr[i];
    idx := i;
    for j := 0 to i - 1 do
    begin
      if (arr[j] < min) then
      begin
        min := arr[j];
        idx := j;
      end;
    end;
    swap(arr[i], arr[idx]);
    for j := 0 to size - 1 do
      Write(arr[j], ' ');
    writeln;
  end;
end.
