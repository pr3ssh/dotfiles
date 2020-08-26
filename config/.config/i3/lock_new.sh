#!/usr/bin/env bash
#: yuune i3lock-color wrapper

wallpaper="/home/pr3ssh/pictures/generatives/polyisland.jpg"
# or, get wallpaper variables from pywal
# eval $(cat $HOME/.cache/wal/colors.sh | grep ^wallpaper)

tmpwall="/tmp/$USER-lock.png"
eval $(xdotool getdisplaygeometry --shell)
genwp () {
    # dynamic wallpaper reload
    if [[ ! -f "/tmp/$USER-lock-wppath" ]]; then
        echo "$wallpaper" > /tmp/$USER-lock-wppath
    elif [[ "$wallpaper" != "$(cat /tmp/$USER-lock-wppath)" ]]; then
        echo "$wallpaper" > /tmp/$USER-lock-wppath
        rm $tmpwall 2&>/dev/null
    fi

    if [[ ! -f $tmpwall ]]; then
        convert "$wallpaper" -resize ${WIDTH}x -gravity center -crop ${WIDTH}x${HEIGHT}+0+0 +repage \( \
            -size 120x140 xc:none \
            -draw "roundrectangle 0,0,120,140,20,20" \
            -draw "rectangle 0,140 120,120" -normalize +level 0,50% \
            \) -gravity south -compose over -composite $tmpwall
    fi
}

runlock () {
    i3lock -n --force-clock -i $tmpwall \
        --indpos="$WIDTH/2:$HEIGHT-80" --timepos="$WIDTH/2:$HEIGHT/2" \
        --insidevercolor=00000000 --insidewrongcolor=00000000 --insidecolor=00000000 \
        --ringvercolor=b2ebf2aa --ringwrongcolor=f8bbd0aa --ringcolor=edededaa \
        --keyhlcolor=ededed99 --bshlcolor=ededed99 --separatorcolor=00000000 \
        --layoutcolor=00000000 \
        --line-uses-ring \
        --timestr="%I.%M" \
        --timecolor=fefefeff \
        --time-font="Nimbus Sans Thin" \
        --timesize=80 \
        --datestr="%A, %b %d" \
        --datecolor=fefefeff \
        --date-font="Nimbus Sans" \
        --datesize=16 \
        --radius 20 --ring-width 15 \
        --indicator \
        --veriftext="" \
        --wrongtext="" \
        --noinputtext=""
}

genwp $1
runlock
