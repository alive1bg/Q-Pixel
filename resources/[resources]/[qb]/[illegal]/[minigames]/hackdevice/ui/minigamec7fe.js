let timer_start, timer_game, timer_finish, timer_time, correct_pos, to_find, codes, sets, timerStart;
let game_started = false;
let codes_pos = 0;
let current_pos = 43;
let streak = 0;
let target = 1;
var finishTime = 40;


window.addEventListener("message", function (event) {
    let data = event.data;
    switch (data.type) {
        case 'open':
            target = data.target;
            finishTime = data.time;
            start();
            $('.minigame').css('display','block')
            break;
            case 'close':
            $('.minigame').css('display','none')
            break;        
    }
});

const sleep = (ms, fn) => {return setTimeout(fn, ms)};

const random = (min, max) => {
    return Math.floor(Math.random() * (max - min)) + min;
}
const shuffle = (arr) => {
    for (let i = arr.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        const temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
}
var numberic = true;
var alphabet = true;
var alphanumeric = true;
var greek = true;
var brailler = true;
var runes = true;
if(numberic == true){
    $('.numberic').attr('checked', 'checked')
}

if(alphabet == true){
    $('.alphaber').attr('checked', 'checked')
}
if(alphanumeric == true){
    $('.alphanumeric').attr('checked', 'checked')
}

if(greek == true){
    $('.greek').attr('checked', 'checked')
}

if(brailler == true){
    $('.braille').attr('checked', 'checked')
}

if(runes == true){
    $('.runes').attr('checked', 'checked')
}

const randomSetChar = () => {
    let str='?';
    switch(sets){
        case 'numeric':
            str="0123456789";
            break;
        case 'alphabet':
            str="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            break;
        case 'alphanumeric':
            str="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            break;
        case 'greek':
            str="ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ";
            break;
        case 'braille':
            str="⡀⡁⡂⡃⡄⡅⡆⡇⡈⡉⡊⡋⡌⡍⡎⡏⡐⡑⡒⡓⡔⡕⡖⡗⡘⡙⡚⡛⡜⡝⡞⡟⡠⡡⡢⡣⡤⡥⡦⡧⡨⡩⡪⡫⡬⡭⡮⡯⡰⡱⡲⡳⡴⡵⡶⡷⡸⡹⡺⡻⡼⡽⡾⡿"+
                "⢀⢁⢂⢃⢄⢅⢆⢇⢈⢉⢊⢋⢌⢍⢎⢏⢐⢑⢒⢓⢔⢕⢖⢗⢘⢙⢚⢛⢜⢝⢞⢟⢠⢡⢢⢣⢤⢥⢦⢧⢨⢩⢪⢫⢬⢭⢮⢯⢰⢱⢲⢳⢴⢵⢶⢷⢸⢹⢺⢻⢼⢽⢾⢿"+
                "⣀⣁⣂⣃⣄⣅⣆⣇⣈⣉⣊⣋⣌⣍⣎⣏⣐⣑⣒⣓⣔⣕⣖⣗⣘⣙⣚⣛⣜⣝⣞⣟⣠⣡⣢⣣⣤⣥⣦⣧⣨⣩⣪⣫⣬⣭⣮⣯⣰⣱⣲⣳⣴⣵⣶⣷⣸⣹⣺⣻⣼⣽⣾⣿";
            break;
        case 'runes':
            str="ᚠᚥᚧᚨᚩᚬᚭᚻᛐᛑᛒᛓᛔᛕᛖᛗᛘᛙᛚᛛᛜᛝᛞᛟᛤ";
            break;
    }
    return str.charAt(random(0,str.length));
}
// Resets
document.addEventListener("keydown", function(ev) {
    let key_pressed = ev.key;
    let valid_keys = ['a','w','s','d','ArrowUp','ArrowDown','ArrowRight','ArrowLeft','Enter'];

    if(game_started && valid_keys.includes(key_pressed) ){
        switch(key_pressed){
            case 'w':
            case 'ArrowUp':
                current_pos -= 10;
                if(current_pos < 0) current_pos += 80;
                break;
            case 's':
            case 'ArrowDown':
                current_pos += 10;
                current_pos %= 80;
                break;
            case 'a':
            case 'ArrowLeft':
                current_pos--;
                if(current_pos < 0) current_pos = 79;
                break;
            case 'd':
            case 'ArrowRight':
                current_pos++;
                current_pos %= 80;
                break;
            case 'Enter':
                check();
                return;
        }
        drawPosition();
    }
});

function check(){
    stopTimer();

    let current_attempt = (current_pos+codes_pos);
    current_attempt %= 80;

    if(game_started && current_attempt === correct_pos){
        streak++;
        if(streak == target){
            $('.text').html('HACK COMPLETE')
            $.post('http://tc-hackdevice/callback', JSON.stringify({'success': true}));
            setTimeout(function () {
                $('.minigame').css('display','none')
                setTimeout(function(){
                    location.reload()
                },500)
            },1000)
        } else{
            reset();
        }
    }else{
        reset(false);
        current_pos = correct_pos-codes_pos;
        drawPosition('green', false);
        setTimeout(function(){
            $('.text').html('HACK FAILED')
            $.post('http://tc-hackdevice/callback', JSON.stringify({'success': false}));
            setTimeout(function () {
                $('.minigame').css('display','none')
                setTimeout(function(){
                    location.reload()
                },500)
            },500)
        },500)
    }
}

let moveCodes = () => {
    codes_pos++;
    codes_pos = codes_pos % 80;

    let codes_tmp = [...codes];
    for(let i=0; i<codes_pos; i++){
        codes_tmp.push(codes_tmp[i]);
    }
    codes_tmp.splice(0, codes_pos);

    let codesElem = document.querySelector('.minigame .codes');
    codesElem.innerHTML = '';
    for(let i=0; i<80; i++){
        let div = document.createElement('div');
        div.innerHTML = codes_tmp[i];
        codesElem.append(div);
    }

    drawPosition();
}

let getGroupFromPos = (pos, count = 4) => {
    let group = [pos];
    for(let i=1; i<count; i++){
        if( pos+i >= 80 ){
            group.push( (pos+i) - 80 );
        }else{
            group.push( pos+i );
        }
    }
    return group;
}

let drawPosition = (className = 'red', deleteClass = true) => {
    let toDraw = getGroupFromPos(current_pos);
    if(deleteClass){
        document.querySelectorAll('.minigame .codes > div.red').forEach((el) => {
            el.classList.remove('red');
        });
    }
    let codesElem = document.querySelectorAll('.minigame .codes > div');
    toDraw.forEach((draw) => {
        if(draw < 0) draw = 80 + draw;
        codesElem[draw].classList.add(className);
    });
}

let charGroupsSelected = () => {
    let charGroups = [];
    document.getElementsByName('char_group[]').forEach(el => {
        if(el.checked === true){
            charGroups.push(el.value);
        }
    });
    if(charGroups.length === 0) return false;

    return charGroups;
}

function reset(restart = true){
    game_started = false;

    resetTimer();
    clearTimeout(timer_start);
    clearTimeout(timer_game);
    clearTimeout(timer_finish);

    if(restart){
        document.querySelector('.minigame .hack').classList.add('hidden');
        start();
    }
}

function start(){
    codes_pos = 0;
    current_pos = 43;

    let charGroups = charGroupsSelected();
    if(charGroups === false)
        sets = -1;
    else{
        shuffle(charGroups);
        sets = charGroups[0];
    }

    document.querySelector('.splash .text').innerHTML = 'PREPARING INTERFACE...';

    codes = [];
    for(let i = 0; i<80; i++){
        codes.push(randomSetChar()+randomSetChar());
    }
    correct_pos = random(0,80);
    to_find = getGroupFromPos(correct_pos);
    to_find = '<div>'+codes[to_find[0]]+'</div> <div>'+codes[to_find[1]]+'</div> '+
        '<div>'+codes[to_find[2]]+'</div> <div>'+codes[to_find[3]]+'</div>';

    let codesElem = document.querySelector('.minigame .codes');
    codesElem.innerHTML = '';
    for(let i=0; i<80; i++){
        let div = document.createElement('div');
        div.innerHTML = codes[i];
        codesElem.append(div);
    }

    document.querySelector('.minigame .hack .find').innerHTML = to_find;
    drawPosition();

    timer_start = sleep(1000, function(){
        document.querySelector('.splash .text').innerHTML = 'CONNECTING TO THE HOST';
        document.querySelector('.minigame .hack').classList.remove('hidden');

        timer_game = setInterval(moveCodes, 1500);

        game_started = true;
        startTimer();

        timer_finish = sleep(finishTime * 1000, function(){
            game_started = false;
            check();
        });
    });
}

function startTimer(){
    timerStart = new Date();
    timer_time = setInterval(timer,1);
}
function timer(){
    let timerNow = new Date();
    let timerDiff = new Date();
    timerDiff.setTime(timerNow - timerStart);
    let ms = timerDiff.getMilliseconds();
    let sec = timerDiff.getSeconds();
    if (ms < 10) {ms = "00"+ms;}else if (ms < 100) {ms = "0"+ms;}
    let ms2 = (999-ms);
    if (ms2 > 99) ms2 = Math.floor(ms2/10);
    if (ms2 < 10) ms2 = "0"+ms2;
    document.querySelector('.hack .timer').innerHTML = (finishTime-1-sec)+"."+ms2;
}
function stopTimer(){
    clearInterval(timer_time);
}
function resetTimer(){
    clearInterval(timer_time);
}