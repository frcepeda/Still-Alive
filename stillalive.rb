#! /usr/bin/env ruby

trap('SIGINT') { puts; exit 1 }
trap('SIGWINCH') { getScreenSize }

def getScreenSize
    $columns = `tput cols`.to_i
    $lines = `tput lines`.to_i

    if ($columns.nil? or $lines.nil?)
        $columns = ENV['COLUMNS'].to_i
        $lines = ENV['LINES'].to_i
    end

    if ($columns.nil? or $lines.nil?)
        $columns = ENV['COLUMNS'].to_i
        $lines = ENV['LINES'].to_i
    end

    if ($columns.nil? or $lines.nil?)
        $columns = 80
        $lines = 25
    end
end

BEATSIZE = 0.5
x = 2

$logo = "*               .,-:;#;:=,*           . :H@@@MM@M#H/.,+%;,*        ,/X+ +M@@M@MM%=,-%HMMM@X/,*      -+@MM; $M@@MH+-,;XMMMM@MMMM@+-*     ;@M@@M- XM@X;. -+XXXXXHHH@M@M\#@/.*   ,%MM@@MH ,@%=            .---=-=:=,.*   =@\#@@@MX .,              -%HX$$%%%+;*  =-./@M@M$                  .;@MMMM@MM:*  X@/ -$MM/                    .+MM@@@M$* ,@M@H: :@:                    . =X\#@@@@-* ,@@@MMX, .                    /H- ;@M@M=* .H@@@@M@+,                    %MM+..%\#$.*  /MMMM@MMH/.                  XM@MH; =;*   /%+%$XHH@$=              , .H@@@@MX,*    .=--------.           -%H.,@@@@@MX,*    .%MM@@@HHHXX$$$%+= .:$MMX =M@@MM%.*      =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=*        =%@M@M\#@$-.=$@MM@@@M; %M%=*          ,:+$+-,/H#MMMMMMM@= =,*                =++%%%%+/:-."

$cake = "*            ,:/+/-*            /M/              .,-=;#;-*       .:/= ;MH/,    ,=/+%$XH@MM\#@:*      -$#\#@+$##\#@H@MMM#######H:.    -/H#* .,H@H@ X#####\#@ -H####\#@+-     -+H##\#@x*  .,@##H;      +XM##M/,     =%@##\#@X;-*X%-  :M#########\#$.    .:%M##\#@%:*M##H,   +H@@@$/-.  ,;$M##\#@%,          -*M###M=,,---,.-%%H####M$:           ,+@##*@#################\#@/.          :%#\#@$-*M################H,         ;HM##M$=*##################.    .=$M##M$=*#################H..;XM##M$=         .:+*M###################\#@%=          =+@MH%*@#################M/.         =+H#X%=*=+M###############M,     -/X#X+;.*  .;XM###########H=    ,/X#H+:,*    .=+HM#######M+/+HM@+=.*         ,:/%XM####H/.*              ,.:=-."

class Object
    def beats
        return self * BEATSIZE
    end
end

def writeLine(line, beats)
    puts ""
    begin
        stars = line.scan(/[*]/).count
    rescue
        stars = 0
    end
    (($columns - (line.size - stars))/2).times { printf ' ' }
    writeChar(line, beats, 0)
end

def writeChar(line, beats, i)
    counter = 0
    if line[i] != '*'
        printf line[i]
        sleep beats.beats / line.size
    else
        sleep 0.5.beats
    end
    i += 1
    writeChar(line, beats, i) if i < line.size
end

def drawApertureLogo
    puts ""
    for char in $logo.split(//)
        if char == '*'
            puts
            (($columns - 42)/2).times { printf ' ' }
        else
            printf char
        end
        sleep 10.beats / $logo.split(//).count
    end
    return 10
end

def drawCake
    puts ""
    for char in $cake.split(//)
        if char == '*'
            puts
            (($columns - 40)/2).times { printf ' ' }
            else
            printf char
        end
            sleep 10.beats / $logo.split(//).count
    end
    return 10
end

getScreenSize

printf "3.."
sleep 1.beats
printf "2.."
sleep 1.beats
printf "1.."
sleep 1.beats

($lines - 1).times { puts }

writeLine "This was a triumph", 2.5
sleep 5.beats
writeLine "I'm making a note here", 3.5
sleep 1.beats
writeLine "HUGE SUCCESS.", 2.5
sleep 3.beats
writeLine "It's hard to overstate my satisfaction.", 10
sleep 5.beats
puts ""
writeLine "Aperture Science", 2.5
sleep 5.beats
writeLine "We do what we must** because** we can.", 5
sleep 3.5.beats
writeLine "For the good of all of us", 6
sleep 0.5.beats
writeLine "Except the ones who are dead", 3.5
sleep 1.beats
puts ""
writeLine "But there's no sense crying over every mistake.", 7.5
sleep 0.5.beats
writeLine "You just keep on trying till you run out of cake.", 7.5
sleep 0.5.beats
writeLine "And the Science gets done.", 3.5
sleep 0.5.beats
writeLine "And you make a neat gun.", 3.5
sleep 0.5.beats
writeLine "For the people who are still alive.", 6
sleep (11 - drawApertureLogo).beats
puts
writeLine "I'm not even angry.", 3.5
sleep 5.beats
writeLine "I'm being so** sincere* right now.", 5
sleep 3.5.beats
writeLine "Even though you broke my heart and killed me.", 9
sleep 4.5.beats
writeLine "And tore me to pieces.", 3
sleep 5.beats
writeLine "And threw every piece** into** a fire.", 5
sleep 3.5.beats
writeLine "As they burned** it hurt because", 5
sleep 0.5.beats
writeLine "I was so happy for you!", 3.5
sleep 1.5.beats
puts ""
writeLine "Now these points of data make a beautiful line.", 7.5
sleep 0.5.beats
writeLine "And we're out of beta.", 4
sleep 0.beats
writeLine "We're releasing on time.", 3.5
sleep 0.5.beats
writeLine "So I'm GLaD. I got burned.", 3.5
sleep 0.5.beats
writeLine "Think of all the things we learned", 3.5
sleep 0.5.beats
writeLine "For the people who are still alive.", 6
sleep (13 - drawCake).beats
puts ""
writeLine "Go ahead and leave me.", 3
sleep 4.5.beats
writeLine "I think I'd prefer** to stay** inside.", 5
sleep 3.5.beats
writeLine "Maybe you'll find someone else to help you.", 9
sleep 5.beats
writeLine "Maybe Black Mesa*.*.*.", 4
sleep 3.5.beats
writeLine "THAT WAS A JOKE.** HA HA.** FAT CHANCE.", 4.5
sleep 3.5.beats
writeLine "Anyway, this cake is great.", 6
sleep 0.5.beats
writeLine "It's so delicious and moist.", 3.5
sleep 1.beats
puts ""
writeLine "Look at me still talking when there's Science to do.", 7.5
sleep 0.5.beats
writeLine "When I look out there, it makes me GLaD I'm not you.", 7.5
sleep 0.5.beats
writeLine "I've experiments to run,", 3.5
sleep 0.5.beats
writeLine "there is research to be done.", 3.5
sleep 0.5.beats
writeLine "On the people who are still alive.", 5.5
sleep 2.beats
puts ""
writeLine "And believe me I am still alive.", 6
sleep 1.5.beats
writeLine "I'm doing Science and I'm still alive.", 6.5
sleep 2.beats
writeLine "I feel fantastic and I'm still alive.", 6
sleep 2.beats
writeLine "While you're dying I'll be still alive.", 6
sleep 1.5.beats
writeLine "And when you're dead I will be still alive.", 6
sleep 2.beats
puts ""
writeLine "Still alive", 2.5
sleep 1.5.beats
writeLine "STILL ALIVE", 2.5
sleep 3.beats
puts ""
puts ""