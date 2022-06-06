window.addEventListener('message', function(event) {
    console.log('Hola')
    console.log(event.data.show)

    if (event.data.show == true) {
        $('body').css('display', 'block');
        console.log('show')
    } else if (event.data.show == false) {
        console.log('hide');
        $('body').css('display', 'none');
    }


    $(document).keyup(function(e) {
        if (e.keyCode == 27) {
            $('body').css('display', 'none');
            $.post('https://qb-magazine/escape', JSON.stringify({}));
        }
    });
});