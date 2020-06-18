let bankColor = "green"

$(function () {
    window.addEventListener('message', function (event) {
        if (event.data.type === "openBank") {
            $('#bankui').fadeTo(10, 1.0)
            $('#depositval').val('');
            $('#withdrawval').val('');
            if (event.data.color === "green") {
                $('.logo-area').html('<img src="img/logo.png" class="logo">');
            } else if (event.data.color === "red") {
                $('.logo-area').html('<img src="img/logo-red.png" class="logo">');
                updateColors('red')
            } else if (event.data.color === "blue") {
                $('.logo-area').html('<img src="img/logo-blue.png" class="logo">');
                updateColors('blue')
            }
        } else if (event.data.type === "closeAll") {
            $('#bankui').fadeTo(10, 0.0)
        } else if (event.data.type === "updateBalance") {
            let money = formatter.format(event.data.balance)
            money = money.substring(1)
            $('.balance').html(money);
        }
    });
});

function updateColors(color) {
    bankColor = color
    $(".btn").addClass(color + "-btn");
    $(".btn-quick").addClass(color + "-btn");
    $(".container").addClass(color + "-border");
    $(".info-label").addClass(color + "-color");
    $(".close").addClass(color + "-close");
}

function removeColors(color) {
    setTimeout(function () {
        if (color != 'green') {
            $('.logo-area').html('<img src="img/logo.png" class="logo">');
            $(".btn").removeClass(color + "-btn");
            $(".btn-quick").removeClass(color + "-btn");
            $(".container").removeClass(color + "-border");
            $(".info-label").removeClass(color + "-color");
            $(".close").removeClass(color + "-close");
        }
    }, 2500);
}

$('.close').click(function () {
    $('bankui').hide();
    removeColors(bankColor)
    $.post('http://orp-banking/NUIFocusOff', JSON.stringify({}));
});

$('#withdraw').click(function (e) {
    e.preventDefault();
    $.post('http://orp-banking/withdrawl', JSON.stringify({
        amountw: $('#withdrawval').val()
    }));
    $('#withdrawval').val('');
});

$('#deposit').click(function (e) {
    e.preventDefault();
    $.post('http://orp-banking/deposit', JSON.stringify({
        amount: $('#depositval').val()
    }));
    $('#depositval').val('');
});

$('#withdraw-100').click(function (e) {
    e.preventDefault();
    $.post('http://orp-banking/withdrawl', JSON.stringify({
        amountw: 100
    }));
});

$('#withdraw-250').click(function (e) {
    e.preventDefault();
    $.post('http://orp-banking/withdrawl', JSON.stringify({
        amountw: 250
    }));
});

$('#withdraw-500').click(function (e) {
    e.preventDefault();
    $.post('http://orp-banking/withdrawl', JSON.stringify({
        amountw: 500
    }));
});

$('#transfer').click(function (e) {
    e.preventDefault();
    $.post('http://orp-banking/transfer', JSON.stringify({
        to: $('#idval').val(),
        amountt: $('#transferval').val()
    }));
    $('#transferval').val('');
});

document.onkeyup = function (data) {
    if (data.which == 27) {
        // $('bankui').hide();
        $('#bankui').fadeTo(10, 0.0)
        removeColors(bankColor)
        $.post('http://orp-banking/NUIFocusOff', JSON.stringify({}))
    }
}

var formatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
});