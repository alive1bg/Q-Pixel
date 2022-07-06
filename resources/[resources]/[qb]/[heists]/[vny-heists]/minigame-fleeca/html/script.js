class NoPixel_Fleeca{

    range = (start, end, length = end - start + 1) => {
        return Array.from({ length }, (_, i) => start + i)
    }
    random = (min, max) => {
        return Math.floor(Math.random() * (max - min)) + min;
    }
    shuffle = (arr) => {
        for (let i = arr.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            const temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
    }
    
    shapes = ['square', 'rectangle', 'circle', 'triangle'];
    colors = ['blue', 'green', 'red', 'orange', 'yellow', 'purple', 'black', 'white'];
    types = [
        {'type': 'shape','text': 'SHAPE'},
        {'type': 'shape_color','text': 'SHAPE COLOR'},
        {'type': 'text_color','text': 'TEXT COLOR'},
        {'type': 'text_shape','text': 'SHAPE TEXT'},
        {'type': 'text_bg_color','text': 'TEXT BACKGROUND COLOR'},
        {'type': 'background_color','text': 'BACKGROUND COLOR'},
        {'type': 'number_color','text': 'NUMBER COLOR'}
    ];

    create(){
        let real_numbers, impostor_numbers, minigame, group, background_colors, types, quiz_numbers;

        real_numbers = this.range(1, 4);
        this.shuffle(real_numbers);

        impostor_numbers = this.range(1, 4);
        this.shuffle(impostor_numbers);

        minigame = {
            'real_numbers': real_numbers,
            'impostor_numbers': impostor_numbers,
            'groups': []
        };

        for(let i = 0; i < 4; i++){
            group = [];

            background_colors = this.colors;
            this.shuffle(background_colors);

            group['real_number'] = real_numbers[i];
            group['impostor_number'] = impostor_numbers[i];

            group['shape'] = this.shapes[this.random(0, this.shapes.length)];
            group['background_color'] = background_colors[0];
            group['shape_color'] = background_colors[1];
            group['text_bg_color'] = this.colors[this.random(0, this.colors.length)];
            group['number_color'] = this.colors[this.random(0, this.colors.length)];

            group['text_shape'] = this.shapes[this.random(0, this.shapes.length)];
            group['text_color'] = this.colors[this.random(0, this.colors.length)];

            minigame['groups'].push(group);
        }

        quiz_numbers = this.range(0, 3);
        this.shuffle(quiz_numbers);

        types = this.types;
        this.shuffle(types);

        minigame['quiz1'] = {
            'pos': quiz_numbers[0],
            'type': types[0],
            'solution': minigame['groups'][quiz_numbers[0]][types[0]['type']]
        };

        minigame['quiz2'] = {
            'pos': quiz_numbers[1],
            'type': types[1],
            'solution': minigame['groups'][quiz_numbers[1]][types[1]['type']]
        };

        minigame['solution'] = minigame['groups'][quiz_numbers[0]][types[0]['type']] +
            ' ' + minigame['groups'][quiz_numbers[1]][types[1]['type']];

        return minigame;
    }
}

let timer_start, timer_numbers, timer_game, timer_splash, data, speed, durationGame, roundTotal;
let mode = 'fleeca';
let minigame = new NoPixel_Fleeca();
let streak = 0;

let sleep = (ms, fn) => {return setTimeout(fn, ms)};

let audio_splash = document.querySelector('.splash audio');
let audio_timer = document.querySelector('.timer audio');

// Options

document.querySelectorAll('.game_mode .button').forEach(el => {
    el.addEventListener('click', function(ev){
        let new_mode = ev.target.dataset.mode;
        if(new_mode !== mode){
            let b = document.querySelector('body').classList;
            b.remove(mode);
            b.add(new_mode);
            document.querySelector('.game_mode .button.active').classList.remove('active');
            ev.target.classList.add('active');
            mode = new_mode;
            streak = 0;
            reset(true);
        }
    });
});

// Process answer
document.querySelector('#answer').addEventListener('keydown', function(e) {
    if (e.key === 'Enter' && document.querySelector('.solution').offsetHeight === 0) {
        clearTimeout(timer_game);
        audio_timer.pause();

        const answer = e.target.value.toLowerCase().trim();
        let wrapper = document.querySelector('.answer-wrapper');
        if(data.solution === answer){
            wrapper.classList.remove('wrong');
            wrapper.classList.add('right');
            streak++;
            if( (mode === 'fleeca' && streak === roundTotal) ){
                splash_screen();
                document.querySelector('.splash .fa').innerHTML = '&#xf21b;';
                document.querySelector('.splash .message').innerText = "The system has been bypassed.";
                sleep(5000, function(){ 
                    document.querySelector('.minigame').classList.add('hidden');
                    $.post('https://minigame-fleeca/ResultGames', JSON.stringify({
                        result : true
                    }));
                });
            }else{
                reset(false);
            }
        }else{
            //Failed
            streak = 0;
            splash_screen();
            document.querySelector('.splash .fa').innerHTML = '&#xf05e;';
            document.querySelector('.splash .message').innerText = "The system didn't accept your answer";
            sleep(5000, function(){ 
                document.querySelector('.minigame').classList.add('hidden');
                $.post('https://minigame-fleeca/ResultGames', JSON.stringify({
                    result : false
                }));
            });
        }
    }
});

let splash_screen = (show = true) => {
    if(show){
        document.querySelectorAll('.groups, .inputs').forEach(el => {el.classList.add('hidden');});
        document.querySelector('.splash').classList.remove('hidden');
    }else{
        document.querySelector('.splash').classList.add('hidden');
        document.querySelectorAll('.groups').forEach(el => {el.classList.remove('hidden');});
    }
}

let reset = (gameDuration , gameRoundsTotal) => {
    document.querySelector('.minigame').classList.remove('hidden');
    clearTimeout(timer_start);
    clearTimeout(timer_numbers);
    clearTimeout(timer_game);
    clearTimeout(timer_splash);

    audio_splash.pause();
    audio_splash.currentTime = 0;

    audio_timer.pause();
    audio_timer.currentTime = 0;

    document.querySelectorAll('.real_number').forEach(el => {
        el.innerHTML = '&nbsp;';
        el.style.fontSize = '190px';
        el.classList.remove('hidden');
    });
    document.querySelectorAll('.groups .shape, .groups .text, .groups .number, .inputs').forEach(el => {
        el.classList.add('hidden');
    });
    document.querySelectorAll('.group .shape').forEach(el => {
        minigame.shapes.forEach(shape => {
            el.classList.remove(shape);
        });
    });
    document.querySelectorAll('.group, .group div, .group .shape').forEach(el => {
        el.classList.forEach(cl => {
            if( /^(bg_|txt_)/.test(cl) ) {
                el.classList.remove(cl);
            }
        });
    });

    document.querySelector(".progress-bar").style.width = '100%';

    document.querySelector('.answer-wrapper').classList.remove('wrong', 'right')
    document.querySelector('.solution').classList.add('hidden');
    document.querySelector('#answer').value = '';

    if(gameDuration){
        durationGame = gameDuration
        roundTotal = gameRoundsTotal;
        splash();
    }else{
        start();
    }
}

let start = () => {
    data = minigame.create();
    console.log(data.solution)
    data.groups.forEach(function(group, i) {
        let g = document.querySelectorAll('.groups .group')[i];
        g.classList.add('bg_'+group.background_color);
        g.querySelector('.real_number').innerHTML = group.real_number;
        g.querySelector('.shape').classList.add(group.shape, 'bg_'+group.shape_color);
        g.querySelector('.text').classList.add('txt_'+group.text_bg_color);
        g.querySelector('.text').innerHTML = group.text_color+'<br>'+group.text_shape;
        g.querySelector('.number').classList.add('txt_'+group.number_color);
        g.querySelector('.number').innerHTML = group.impostor_number;
    });

    document.querySelector('.quiz1').innerHTML = data.quiz1.type.text + ' ('+data['real_numbers'][data.quiz1.pos]+')';
    document.querySelector('.quiz2').innerHTML = data.quiz2.type.text + ' ('+data['real_numbers'][data.quiz2.pos]+')';

    document.querySelector('.solution .real_numbers').innerHTML = data.real_numbers.join(' ');
    document.querySelector('.solution .solution_text').innerHTML = data.solution;

    timer_start = sleep(1000, function(){
        document.querySelectorAll('.real_number').forEach(el => {el.style.fontSize = '0px';});

        timer_numbers = sleep(2000, function(){
            document.querySelectorAll('.real_number').forEach(el => {el.classList.add('hidden');});
            document.querySelectorAll('.groups .shape, .groups .text, .groups .number, .inputs').forEach(
                el => {el.classList.remove('hidden');});
            document.querySelector('#answer').focus({preventScroll: true});

            document.querySelector(".progress-bar").style.transition = 'width '+(durationGame / 1000)+'s linear';
            document.querySelector(".progress-bar").style.width = '0';
            // console.log("Timer for end",durationGame)
            timer_game = sleep(durationGame, function(){
                //This if Timer habis
                streak = 0;
                audio_timer.pause();
                splash_screen();
                document.querySelector('.splash .fa').innerHTML = '&#xf05e;';
                document.querySelector('.splash .message').innerText = "The system didn't accept your answer";
                sleep(5000, function(){ 
                    document.querySelector('.minigame').classList.add('hidden');
                    $.post('https://minigame-fleeca/ResultGames', JSON.stringify({
                        result : false
                    }));
                });
            });
        });
    });

}

let splash = () => {
    splash_screen();
    document.querySelector('.splash .fa').innerHTML = '&#xf21b;';
    document.querySelector('.splash .message').innerText = 'Device booting up...';
    timer_splash = sleep(3000, function(){
        document.querySelector('.splash .message').innerText = 'Dialing...';

        timer_splash = sleep(8000, function(){
            document.querySelector('.splash .message').innerText = 'Establishing connection...';

            timer_splash = sleep(6000, function(){
                document.querySelector('.splash .message').innerText = 'Doing some hackermans stuff...';

                timer_splash = sleep(6000, function(){
                    document.querySelector('.splash .message').innerText = 'Access code flagged; requires human captcha input...';

                    timer_splash = sleep(6000, function(){
                        document.querySelector('.splash').classList.add('hidden');
                        document.querySelector('.groups').classList.remove('hidden');
                        start();
                    });
                });
            });
        });
    });
}

// reset(9500,6) Testing

window.addEventListener('message',function(event){
    const data = event.data;
    if (data.action == "OPEN_FLEECA") {
        reset(data.duration, data.rounds)
    }
});