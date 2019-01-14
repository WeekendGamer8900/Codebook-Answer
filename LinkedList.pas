program LinkedListSim;

const
  size = 10;
type
  nodeType = record
    Next: integer;
    Data: integer;
  end;

  listType = record
    list: array[1..size] of nodeType;
    head: integer;
  end;

var
  linkedList: listType;
  d, s: integer;
  action: char;

  procedure init(var l: listType);
  var
    i: integer;
  begin
    for i := 1 to size do
    begin
      l.list[i].Next := -1;
      l.list[i].Data := 0;
    end;
    l.head := -1;
  end;

  function searchFreeNode(var l: listType): integer;
  var
    i: integer;
  begin
    i := 1;
    while (i <= size) and (l.list[i].Data <> 0) do
      i := i + 1;
    if i > size then
      searchFreeNode := -1
    else
      searchFreeNode := i;
  end;

  procedure insertBegin(var l: listType; d: integer);
  var
    freepos: integer;
  begin
    freepos := searchFreeNode(l);
    if freepos = -1 then
    else
    begin
      l.list[freepos].Data := d;
      l.list[freepos].Next := l.head;
      l.head := freepos;
    end;
  end;

  function search(l: listType; d: integer): integer;
  var
    i: integer;
  begin
    i := l.head;
    while (i <> -1) and (l.list[i].Data <> d) do
    begin
      i := l.list[i].Next;
    end;
    search := i;
  end;

  function searchOrder(l: listType; d: integer): integer;
  var
    i, j: integer;
  begin
    i := l.head;
    j := 1;
    while (i <> -1) and (l.list[i].Data <> d) do
    begin
      i := l.list[i].Next;
      j := j + 1;
    end;
    if i <> -1 then
      searchOrder := j
    else
      searchOrder := -1;
  end;

  procedure insertAfter(after, d: integer; var l: listType);
  var
    freepos, afterpos: integer;
  begin
    freepos := searchFreeNode(l);
    if freepos = -1 then
    begin
    end
    else
    begin
      afterpos := search(l, after);
      if afterpos = -1 then
      begin
      end
      else
      begin
        l.list[freepos].Data  := d;
        l.list[freepos].Next  := l.list[afterpos].Next;
        l.list[afterpos].Next := freepos;
      end;
    end;
  end;

  procedure Delete(var l: listType; x: integer);
  var
    pos, i: integer;
  begin
    pos := -1;
    i := l.head;
    while (i <> -1) and (l.list[i].Data <> x) do
    begin
      pos := i;
      i := l.list[i].Next;
    end;
    if i = -1 then
    else
    begin
      if pos <> -1 then
        l.list[pos].Next := l.list[i].Next
      else
        l.head := l.list[i].Next;
      l.list[i].Data := 0;
    end;
  end;

  procedure print(l: listType);
  var
    i: integer;
  begin
    i := l.head;
    while (i <> -1) do
    begin
      Write(l.list[i].Data, ' ');
      i := l.list[i].Next;
    end;
    writeln;
  end;

begin
  init(linkedList);
  repeat
    Read(action);
    case action of
      'b':
      begin
        readln(d);
        insertBegin(linkedList, d);
        print(linkedList);
      end;
      'i':
      begin
        Read(s);
        readln(d);
        insertAfter(s, d, linkedList);
        print(linkedList);
      end;
      'd':
      begin
        readln(s);
        Delete(linkedList, s);
        print(linkedList);
      end;
      's':
      begin
        readln(s);
        writeln(searchOrder(linkedList, s));
      end;
    end;
  until action = 'e';
end.
