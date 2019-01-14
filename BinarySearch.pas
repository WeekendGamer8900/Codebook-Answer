program BinarySearch;

type
  intArr = array[0..9] of integer;
var
  list: intArr;
  i, r: integer;
  c: char;

  procedure print();
  var
    i: integer;
  begin
    for i := 0 to 10 - 1 do
      Write(list[i], ' ');
    writeln;
  end;

  function binarySearch(arr: intArr; target: integer): integer;
  var
    last, First, mid: integer;
  begin
    last := 10 - 1;
    First := 0;
    mid := 4;
    while (arr[mid] <> target) and (First <= last) do
    begin
      mid := (last + First) div 2;
      writeln(First, ' ', last, ' ', mid);
      if (target > arr[mid]) then
        First := mid + 1
      else if (target < arr[mid]) then
        last := mid - 1;
    end;
    if (arr[mid] <> target) then
      binarySearch := -1
    else
    begin
      while (mid > 0) and (arr[mid - 1] = target) do
        mid := mid - 1;
      binarySearch := mid;
    end;
  end;

begin
  for i := 0 to 9 do
    Read(list[i]);
  readln;
  print();
  readln(r);
  writeln(binarySearch(list, r));
end.
