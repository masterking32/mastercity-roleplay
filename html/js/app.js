var persistentNotifs = {};

window.addEventListener('message', function (event) {
    if (event.data.persist === undefined) {
        ShowNotif(event.data);
    } else {
        if (event.data.persist.toUpperCase() == 'START') {
            if (persistentNotifs[event.data.id] === undefined) {
                CreatePersistentNotif(event.data);
            } else {
                let $notification = $(persistentNotifs[event.data.id])
                $notification.addClass('notification').addClass(event.data.type);
                $notification.html(event.data.text);
            }
        } else if (event.data.persist.toUpperCase() == 'END') {
            let $notification = $(persistentNotifs[event.data.id]);
            $.when($notification.fadeOut()).done(function() {
                $notification.remove()
            });
            persistentNotifs[event.data.id] = undefined;
        }
    }
});

function CreatePersistentNotif(data) {
    var $notification = $(document.createElement('div'));
    $notification.addClass('notification').addClass(data.type);
    $notification.html(data.text);
    $notification.fadeIn();
    $('.notif-container').append($notification);
    persistentNotifs[event.data.id] = $notification;
}

function ShowNotif(data) {
    var $notification = $(document.createElement('div'));
    $notification.addClass('notification').addClass(data.type);
    $notification.html(data.text);
    $notification.fadeIn();
    $('.notif-container').append($notification);
    setTimeout(function() {
        $.when($notification.fadeOut()).done(function() {
            $notification.remove()
        });
    }, data.length != null ? data.length : 2500);
}