function pack(){
    sed -e 's/ *//g' \
            -e 's/99/A/g' \
            -e 's/88/9/g' \
            -e 's/77/8/g' \
            -e 's/66/7/g' \
            -e 's/55/6/g' \
            -e 's/44/5/g' \
            -e 's/33/4/g' \
            -e 's/22/3/g' \
            -e 's/11/2/g' \
            -e 's/00/1/g' 
}

function board(){
     echo '+----+'
     sed 's/.*/|&|/g'
     echo '+----+'
     
}

function pad(){

}

function trans(){
    local i j idx BOARD
    
    BOARD ="$(cat)"
    
    for i in 0 1 2 3; do
        for j in 0 1 2 3; do
            idx =$[$j*5+$i]
            echo -n "${BOARD:$idx:1}"
        done
        echo
    done
}

function takeSpace(){
    spaces | shuf | head -1
}

function takeTile(){
        {yes 0 | head -9; echo 1;} | shuf | head -1
}

function repl(){
    local i =$1 j =$2 c =$3 offset BOARD
    
    BOARD = "$(cat)"
    
    offset =$[$i*5+$j]
    
    head -c $offset <<< "$BOARD"
    echo -n $c
    tail -c $[20-$offset-1] <<< "$BOARD"
}

function createTile(){
    local i j c offset BOARD
    
    BOARD = "$(cat)"
    
    takeTile | {
            read tile
            
            takeSpace <<< "$BOARD" | {
                    read i j 
                    
                    if[ -z "$i" ]; then
                        echo you lose
                        exit
                    fi
                    
                    repl  $i $j $tile <<<"$BOARD"
}

function right(){
        rev | pack | pad | rev
}

function left(){
        pack | pad
}

function up(){
        trans | left | trans
}

function down(){
        trans | right | trans
}

BOARD =$(yes '     ' | head -4 |createTile | createTile)

while true; do

    clear
    print_board <<<"$BOARD"
    
    read -n 1 
    case $reply in
        
        h) ACTION = left ;;
        k) ACTION = right ;;
        m) ACTION = down ;;
        u) ACTION = up ;;
    esac
    
    BOARD = "$($ACTION <<< "$BOARD")"


