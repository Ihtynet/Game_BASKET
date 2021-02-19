uses
  ABCObjects, GraphABC, Sounds;

var
  speed: integer;
  speedapl: integer;
  vkleft, vkright: boolean;
  player, block, good, bad: ObjectABC;

  kolgood, kolbad:integer;
  
// Клавиша нажата
procedure KeyDown(Key: integer);
begin
  case Key of
    VK_Left:  vkleft := true;
    VK_right: vkright := true; 

  end;
  
end;

// Клавиша ОТжата
procedure KeyUp(Key: integer);
begin
  case Key of
    VK_Left:  vkleft := false; 
    VK_right: vkright := false; 
  end;
end;


procedure TimerProc;
begin
  if vkleft = true then
  begin
    player.MoveOn(-speed, 0); 
  end;
  
  if vkright = true then 
  begin
    player.MoveOn(speed, 0); 
  end;
end;

procedure TimerApple;
begin
  
  if block.Center.Y >= Window.Height-50 Then
    begin
      kolbad := kolbad + 1;
      bad.Text:=inttostr(kolbad);
      block.Destroy;
      speedapl := Random(15)+5;
      block   := new PictureABC(Random(1000)+100, 10, 'data\gm_apple.png');
     end
  else
    block.MoveOn(0, speedapl);

  if player.Intersect(block) Then
  begin
      kolgood := kolgood + 1;
      good.Text:=inttostr(kolgood);
      block.Destroy;
      speedapl := Random(15)+5;
      block   := new PictureABC(Random(1000)+100, 10, 'data\gm_apple.png');
      PlaySound('D:\pascalProjects\МойВариант BOWEL\data\ding.wav');
  end;
  
end;


///////////////////////////////////////////////////
begin
  
  Window.Load('data\gm_bg.png');
  Window.CenterOnScreen;
  good    := new PictureABC(1, 1, 'data\good.png');
  bad     := new PictureABC(1150, 1, 'data\bad.png');
 
  
  player  := new PictureABC(10, 790, 'data\gm_bowel.png');
  
  block   := new PictureABC(Random(1000)+100, 10, 'data\gm_apple.png');
  speed := 10;
  speedapl := Random(15)+5;
  Window.Title := 'Передвигайте объекты';
  while true do
  begin
    TimerProc;
    TimerApple;
    OnKeyDown := KeyDown;
    OnKeyUp := KeyUp;  
    sleep(5);
  end;
end.