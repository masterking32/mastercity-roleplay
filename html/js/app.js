window.addEventListener('message', function (event) {
    switch(event.data.action) {
        case 'shortnotif':
        case 'notif':
        case 'longnotif':
            ShowNotif(event.data);
            break;
        default:
            ShowNotif(event.data);
            break;
    }
});

function ShowNotif(data) {
    var $notification = $('.notification.template').clone();
    $notification.removeClass('template');
    $notification.addClass(data.type);
    $notification.html(data.text);
    $notification.fadeIn();
    $('.notif-container').append($notification);
    setTimeout(function() {
        $.when($notification.fadeOut()).done(function() {
            $notification.remove()
        });
    }, data.length != null ? data.length : 2500);
}