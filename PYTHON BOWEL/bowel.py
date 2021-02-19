import turtle
from random import random, randrange


################################
# функции

def go_left():
    player.direction = "left"


def go_right():
    player.direction = "right"

def is_connect(xa,xp,ya,yp):
    if ya-43 <= yp+40 and xa>=xp-75 and xa<=xp+75:
        return True
    else:
        return False

################################

wn=turtle.Screen()
wn.title("falling skies")
wn.bgcolor("pink")
wn.setup(width=1250,height=950)
wn.bgpic('data\gm_bg.png')
wn.tracer(0)

#добавляем яблоко
imageapl = r"data\gm_apple.gif"
wn.addshape(imageapl)
apple = turtle.Turtle()
apple.shape(imageapl)
apple.speed(10)

apple.penup()
apple.goto(0,400)
apple.direction="stop"


#добавляем корзину
imagebowel = r"data\gm_bowel.gif"
wn.addshape(imagebowel)
player = turtle.Turtle()
player.shape(imagebowel)
player.speed(0)

player.penup()
player.goto(0,-360)
player.direction="stop"
#player.write("bowel", font=("Arial", 16, "normal"))

#keyboard
wn.listen()
wn.onkeypress(go_left,"Left")
wn.onkeypress(go_right,"Right")

speedapple = 0.1

while True:
    wn.update()
    if player.direction == "left":
        x = player.xcor()
        x -= 30
        player.direction = "stop"
        player.setx(x)

    if player.direction == "right":
        x = player.xcor()
        x += 30
        player.direction = "stop"
        player.setx(x)


    ya = apple.ycor()
    if ya <=-400:
        ya = 400
        xa = randrange(-600, 600, 1)
        apple.setx(xa)
        speedapple = randrange(1,10 , 1)/10

    if is_connect(apple.xcor(),player.xcor(),apple.ycor(),player.ycor()):
        ya = 400
        xa = randrange(-600, 600, 1)
        apple.setx(xa)
        speedapple = randrange(1,10 , 1)/10


    ya -= speedapple
    apple.sety(ya)


wn.mainloop()