#****************************************
#   ИГРА BOWEL на PYTHON
#   Автор: Коршунов Владимир Михайлович
#   Создана для тренировки ребят по программированию
#****************************************
import turtle
from random import random, randrange


################################
# функции

def go_left():
    obj_basket.direction = "left"


def go_right():
    obj_basket.direction = "right"

def is_connect(xa,xp,ya,yp):
    if ya-43 <= yp+40 and xa>=xp-75 and xa<=xp+75:
        return True
    else:
        return False


################################

Window=turtle.Screen()
Window.title("Game BOWEL")
Window.bgcolor("pink")
Window.setup(width=1250,height=950)
Window.bgpic('data\gm_bg.png')
Window.tracer(0)

#добавляем яблоко
imageapl = r"data\gm_apple.gif"
Window.addshape(imageapl)
obj_apple = turtle.Turtle()
obj_apple.shape(imageapl)
obj_apple.speed(10)

obj_apple.penup()
obj_apple.goto(0,400)
obj_apple.direction="stop"


#добавляем корзину
imagebowel = r"data\gm_bowel.gif"
Window.addshape(imagebowel)
obj_basket = turtle.Turtle()
obj_basket.shape(imagebowel)
obj_basket.speed(0)

obj_basket.penup()
obj_basket.goto(0,-360)
obj_basket.direction="stop"
#obj_basket.write("bowel", font=("Arial", 16, "normal"))

#************************************
#Обработка нажатий клавиш
Window.listen()
Window.onkeypress(go_left,"Left")
Window.onkeypress(go_right,"Right")

speedbwl = 30
speedapl = 0.1



while True:
    Window.update()
    if obj_basket.direction == "left":
        x = obj_basket.xcor()
        x -= speedbwl
        obj_basket.direction = "stop"
        obj_basket.setx(x)
    if obj_basket.direction == "right":
        x = obj_basket.xcor()
        x += speedbwl
        obj_basket.direction = "stop"
        obj_basket.setx(x)

    ya = obj_apple.ycor()
    if ya <=-400:
        ya = 400
        xa = randrange(-600, 600, 1)
        obj_apple.setx(xa)
        speedapl = randrange(1,10 , 1)/10
    if is_connect(obj_apple.xcor(),obj_basket.xcor(),obj_apple.ycor(),obj_basket.ycor()):
        ya = 400
        xa = randrange(-600, 600, 1)
        obj_apple.setx(xa)
        speedapl = randrange(1,10 , 1)/10
    ya -= speedapl
    obj_apple.sety(ya)


Window.mainloop()