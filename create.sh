
function create(){
    if [ ! -f "./files/$1.mp3" ]; then
        aws.exe polly synthesize-speech \
            --output-format mp3 \
            --voice-id Ivy \
            --text $2 \
            ./files/$1.mp3
    else
      echo skipping $1
    fi
}

function convert(){

    for file in files/*.mp3
    do
        newname=${file%.mp3}
        if [ ! -f "$newname.wav" ]; then
            ffmpeg -i "$file" -y -ar 32000 $newname.wav
        fi
    done

}

create "about" "Create with AWS Polly, US English , Ivy, female"
create "armed" "Armed!"
create "disarm" "Disrmed!"
create "a-lnch" "Auto launch!"
create "a-tune" "Auto tune!"
create "a-trim" "Auto trim"
create "f-acro" "Flightmode: Acro"
create "f-hrz" "Flightmode: Horizon"
create "f-angl" "Flightmode: Angle"
create "f-mnl" "Flightmode: Manual"
create "rth" "Return to home"
create "f-hold" "Position Hold!"
create "mision" "Mission started"
create "hello" "Hello Master! How can i serve you today?"
create "flp-up" "Flaps up"
create "flp-md" "Flaps mid"
create "flp-dn" "Flaps down"
create "day" "have a nice day!"
create "landng" "Landing!"
create "beeper" "Ha! ha! you need the beeper"


convert
