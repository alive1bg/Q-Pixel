const random = (min, max) => {
    return Math.floor(Math.random() * (max - min)) + min;
}
let sleep = (ms, fn) => {return setTimeout(fn, ms)};

let timer_game, order, speed;
let numbers = 1;
let game_started = false;
let game_playing = false;
var speeda = 1;

// Resets

window.addEventListener("message", function (event) {
    let data = event.data;
    switch (data.type)
    {
    case 'open':
        speeda = data.speed;
        numbers = data.numbers;
        $('.groups').removeClass('hidden');
        $('.splash').addClass('hidden');
        $(".minigame").css("display", "block");
        start();
        break;
    }
});

const getCookieValue = (name) => (
    document.cookie.match('(^|;)\\s*' + name + '\\s*=\\s*([^;]+)')?.pop() || ''
)

let validate = (ev) => {
    if(game_playing === false) return;
    
    if(parseInt(ev.target.dataset.number, 10) === order){
        ev.target.classList.add('good');
        order++;
        if(order > numbers){
            game_started = false;
            game_playing = false;
            $('.sub_message').addClass('hidden');
            $('.message').html('Finger print recognize complete');
            $('.groups').addClass('hidden');
            $('.splash').removeClass('hidden');
            $.post('http://tc-slider/callback', JSON.stringify({'success': true}));
            setTimeout(function () {
                $(".minigame").css("display", "none");
                location.reload()
            },1500)
        }
    }else{
        game_started = false;
        game_playing = false;
        ev.target.classList.add('bad');
        document.querySelector('.groups').classList.remove('playing');
        $('.sub_message').addClass('hidden');
        $('.message').html('Finger print recognize failed');
        $('.groups').addClass('hidden');
        $('.splash').removeClass('hidden');
        $.post('http://tc-slider/callback', JSON.stringify({'success': false}));
        setTimeout(function () {
            $(".minigame").css("display", "none");
            location.reload()
        },1500)
    }
}

let reset = () => {
    document.querySelector('.splash').classList.add('hidden');
    document.querySelector('.groups').classList.remove('hidden','playing');
    document.querySelector('.groups').innerHTML = '';

    start();
}
let newPos = (element) => {
    let top = element.offsetTop;
    let left = element.offsetLeft;
    let new_top = random(10,755);
    let new_left = random(10,1420);
    let diff_top = new_top - top;
    let diff_left = new_left - left;
    let duration = random(10,40)*100;
    
    new mojs.Html({
        el: '#'+element.id,
        x: {
            0:diff_left,
            duration: duration,
            easing: 'linear.none'
        },
        y: {
            0:diff_top,
            duration: duration,
            easing: 'linear.none'
        },
        duration: duration+50,
        onComplete() {
            if(element.offsetTop === 0 && element.offsetLeft === 0) {
                this.pause();
                return;
            }
            element.style = 'top: '+new_top+'px; left: '+new_left+'px; transform: none;';
            newPos(element);
        },
        onUpdate() {
            if(game_started === false) this.pause();
        }
    }).play();
}

let start = () => {
    order = 1;
    game_started = true;
    game_playing = false;
    
    for(let i=1; i<=numbers; i++){
        let group = document.createElement('div');
        group.id = 'pos'+i;
        group.classList.add('group','bg'+random(1,9));
        group.dataset.number = i.toString();
        group.style.top = random(10,755)+'px';
        group.style.left = random(10,1420)+'px';
        group.innerHTML = i.toString();
        group.addEventListener('pointerdown', validate);
        document.querySelector('.groups').append(group);
    }
    document.querySelectorAll('.group').forEach(el => { newPos(el) });
    
    speed = speeda;
    timer_game = sleep(speed * 1000, function(){
        document.querySelector('.groups').classList.add('playing'); 
        game_playing = true;
    });
}