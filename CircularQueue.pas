program CircularQueue;

const
  size = 10;
type
  queuetype = record
    front, rear, Count: integer;
    Data: array[1..size] of integer;
  end;
var
  queue: queueType;

  procedure init(var q: queueType);
  var
    i: integer;
  begin
    q.front := 1;
    q.rear  := 0;
    q.Count := 0;
    for i := 1 to size do
      q.Data[i] := 0;
  end;

  function isFull(var q: queueType): boolean;
  begin
    isFull := q.Count = size;
  end;

  function isEmpty(var q: queueType): boolean;
  begin
    isEmpty := q.Count = 0;
  end;

  procedure enqueue(var q: queueType; d: integer);
  begin
    if not isFull(q) then
    begin
      q.rear := q.rear + 1;
      if q.rear > size then
        q.rear := 1;
      q.Data[q.rear] := d;
      q.Count  := q.Count + 1;
    end;
  end;

  function dequeue(var q: queueType): integer;
  begin
    if not isEmpty(q) then
    begin
      dequeue := q.Data[q.front];
      q.front := q.front + 1;
      if q.front > size then
        q.front := 1;
      q.Count := q.Count - 1;
    end;
  end;

  procedure print(var s: queueType);
  var
    i: integer;
  begin
    if (s.rear >= s.front) then
      for i := s.front to s.rear do
        Write(s.Data[i], ' ')
    else
    begin
      for i := s.front to size do
        Write(s.Data[i], ' ');
      for i := 1 to s.rear do
        Write(s.Data[i], ' ');
    end;
    writeln;
  end;

var
  s: char;
  d: integer;
begin
  init(queue);
  repeat
    Read(s);
    if (s = 'q') then
    begin
      readln(d);
      if (isFull(queue)) then
      else
      begin
        enqueue(queue, d);
      end;
      print(queue);
    end
    else if (s = 'd') then
    begin
      if (isEmpty(queue)) then
        writeln
      else
      begin
        d := dequeue(queue);
        writeln(d);
      end;
    end;
  until s = 'e';
end.
