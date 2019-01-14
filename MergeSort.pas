program MergeSort;

type
  intArr = array[0..9] of integer;

var
  arr, d: intArr;
  i: integer;

  procedure merge(var c, d: intArr; front, rear: integer);
  var
    posA, posB, posC, mid, i: integer;
  begin
    mid  := (front + rear) div 2;
    posA := front;
    posB := mid + 1;
    posC := front;
    if (front <> mid) then
      merge(c, d, front, mid);
    if (rear <> mid + 1) then
      merge(c, d, mid + 1, rear);
    while (posA <= mid) and (posB <= rear) do
    begin
      if c[posA] < c[posB] then
      begin
        d[posC] := c[posA];
        posA := posA + 1;
      end
      else
      begin
        d[posC] := c[posB];
        posB := posB + 1;
      end;
      posC := posC + 1;
    end;
    if posB > rear then
      for i := posA to mid do
      begin
        d[posC] := c[i];
        posC := posC + 1;
      end
    else
      for i := posB to rear do
      begin
        d[posC] := c[i];
        posC := posC + 1;
      end;
    for i := front to rear do
      c[i] := d[i];
    for i := 0 to 9 do
      Write(arr[i], ' ');
    writeln;
  end;

begin
  for i := 0 to 9 do
    Read(arr[i]);
  readln;
  for i := 0 to 9 do
    Write(arr[i], ' ');
  writeln;
  merge(arr, d, 0, 10 - 1);
end.
