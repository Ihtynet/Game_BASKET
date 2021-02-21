//****************************************
//   ИГРА BOWEL на ABS PASCAL
//   Автор: Коршунов Владимир Михайлович
//   Создана для тренировки ребят по программированию
//****************************************
uses
  ABCObjects, GraphABC, Sounds;

var
  speedbwl: integer;
  speedapl: integer;
  vkleft, vkright: boolean;
  obj_bowel, obj_apple, obj_good, obj_bad: ObjectABC;

  kolgood, kolbad:integer;

////////////////////////////////////  
// Процедура Клавиша нажата
procedure KeyDown(Key: integer);
begin
  case Key of
    VK_Left:  vkleft := true;
    VK_right: vkright := true; 
  end;
end;

//////////////////////////////////// 
// Процедура Клавиша ОТжата
procedure KeyUp(Key: integer);
begin
  case Key of
    VK_Left:  vkleft := false; 
    VK_right: vkright := false; 
  end;
end;

//////////////////////////////////// 
// Процедура Работа по объекту корзина
procedure MovingBowel;
begin
  if vkleft = true then
  begin
    obj_bowel.MoveOn(-speedbwl, 0); 
  end;
  
  if vkright = true then 
  begin
    obj_bowel.MoveOn(speedbwl, 0); 
  end;
end;

//////////////////////////////////// 
// Процедура Работа по объекту яблоко
procedure MovingApple;
begin
  
  if obj_apple.Center.Y >= Window.Height-50 Then
    begin
      kolbad := kolbad + 1;
      obj_bad.Text:=inttostr(kolbad);
      obj_apple.Destroy;
      speedapl := Random(15)+5;
      obj_apple   := new PictureABC(Random(1000)+100, 10, 'data\gm_apple.png');
     end
  else
    obj_apple.MoveOn(0, speedapl);

  if obj_bowel.Intersect(obj_apple) Then
  begin
      kolgood := kolgood + 1;
      obj_good.Text:=inttostr(kolgood);
      obj_apple.Destroy;
      speedapl := Random(15)+5;
      obj_apple   := new PictureABC(Random(1000)+100, 10, 'data\gm_apple.png');
      PlaySound('D:\pascalProjects\МойВариант BOWEL\data\ding.wav');
  end;
  
end;


///////////////////////////////////////////////////
begin
  
  Window.Load('data\gm_bg.png');
  Window.CenterOnScreen;
  obj_good    := new PictureABC(1, 1, 'data\good.png');
  obj_bad     := new PictureABC(1150, 1, 'data\bad.png');
 
  
  obj_bowel  := new PictureABC(10, 790, 'data\gm_bowel.png');
  
  obj_apple   := new PictureABC(Random(1000)+100, 10, 'data\gm_apple.png');
  speedbwl := 10;
  speedapl := Random(15)+5;
  Window.Title := 'Game BOWEL';
  while true do
  begin
    MovingBowel;
    MovingApple;
    OnKeyDown 	:= KeyDown;
    OnKeyUp 	:= KeyUp;  
    sleep(5);
  end;
end.