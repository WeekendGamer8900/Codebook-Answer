program SequentialSearch;

var
  i, d: integer;
  l: array[0..9] of integer;
begin
  for i := 0 to 9 do
    Read(l[i]);
  for i := 0 to 9 do
    Write(l[i], ' ');
  writeln;
  readln(d);
  i := 0;
  while (i < 10) and (l[i] <> d) do
  begin
    writeln(i);
    i := i + 1;
  end;
  if i > 9 then
    writeln(-1)
  else
    writeln(i);
end.
