
PICKLEDYAMSMAN SAID 12 MINUTES AGO
ok so while playing with the code I don't think you have your Note Model fully realized yet

PICKLEDYAMSMAN SAID 11 MINUTES AGO
you don't have a method for visible_to but you are passing it in the params

PICKLEDYAMSMAN SAID 9 MINUTES AGO
also, your create is calling current_user but you haven't set that up either

PICKLEDYAMSMAN SAID 8 MINUTES AGO
and lastly removing if session[:user_id] in create fixed a lot for me in the tests

PICKLEDYAMSMAN SAID 8 MINUTES AGO
I hope some of that makes sense

PICKLEDYAMSMAN SAID 7 MINUTES AGO
The first 2 should at least, just make your visible_to and current_user methods
CODEBYLINE SAID A MINUTE AGO
Yes--all of it makes sense, but it will take me a while to process. I spent a lot of time tweaking it, copying and pasting and lost track, frankly. But what got me here was--no matter what I did, adding or subtracting blocks of code, didn't seem to affect the error code.

CODEBYLINE SAID A MINUTE AGO
But I will take notes of what you said and work on it. Thank you!


PICKLEDYAMSMAN SAID A MINUTE AGO
with those steps I got rid of it!

PICKLEDYAMSMAN SAID A FEW SECONDS AGO
Awesome, and if you need help after that just ask in here. Someone will be back at 9am EST




So what about the permissions Avi talks about in the video--` PERMISSIONS = { :admin => 0, :user => 10, :guest => 100}`


ENOCH2K2 SAID 18 MINUTES AGO
That would work, but not relevant for this lab

ENOCH2K2 SAID 17 MINUTES AGO
basically same thing as the role enum
    CODEBYLINE SAID 17 MINUTES AGO
    That's what I thought! That confused me.


ENOCH2K2 SAID 17 MINUTES AGO
:smile:

ENOCH2K2 SAID 16 MINUTES AGO
think of CanCan as a helper method
    CODEBYLINE SAID 16 MINUTES AGO
    So what would be a good example to follow in order to understand this lab?

    CODEBYLINE SAID 16 MINUTES AGO
    The tutorial linked at the bottom (from SitePoint) is excellent, but also not quite relevant.

    CODEBYLINE SAID 15 MINUTES AGO
    Tried reading the documentation--but that's really tough for a beginner


ENOCH2K2 SAID 12 MINUTES AGO
but you can totally do iteration like that :smile:
    CODEBYLINE SAID 12 MINUTES AGO
    :smile: Will find a way.

    CODEBYLINE SAID 12 MINUTES AGO
    Thanks!


ENOCH2K2 SAID 12 MINUTES AGO
np! Those are two big hints how to do it btw :smile:

ENOCH2K2 SAID 12 MINUTES AGO
It's very simple

ENOCH2K2 SAID 12 MINUTES AGO
So just keep that in mind :grinning:
