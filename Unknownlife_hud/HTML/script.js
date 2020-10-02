$(document).ready(function() {

    $.post('http://Unknownlife_hud/getMinimapAnchor', JSON.stringify({}));

    window.addEventListener('message', function(event) {
        var data = event.data;

        if (data.show != null) {
            if (data.show == true) {
                $('.container').show();
            } else {
                $('.container').hide();
            }
        }

        if (data.minimapTopY != null) {
            $('.container').css('top', data.minimapTopY + data.minimapHeight - $('.container').height() + "px");
        }

        if (data.showVhud != null) {
            if (data.showVhud === true) {
                // $("#vehicle-container").css('opacity', '1.0');
                $("#vehicle-container").removeClass("slide-out");
                $("#vehicle-container").addClass("slide-in");
            } else {
                // $("#vehicle-container").css('opacity', '0.0');
                $("#vehicle-container").removeClass("slide-in");
                $("#vehicle-container").addClass("slide-out");
                setProgressSpeed(0, 0);
            }
        }

        if (data.kmh != null && data.maxSpeed != null) {
            $('#kmh').text(data.kmh);
            setProgressSpeed(data.kmh, data.maxSpeed);
        }

        if (data.gear != null) {
            $('.gear').text(data.gear);
        }

        if (data.fuel != null) {
            $('.fuel').text(data.fuel + "%");
            $('.fuel-container').css('background', `linear-gradient(to top, rgba(20, 200, 180, 0.5) ${data.fuel}%, rgba(0, 0, 0, 0.5) ${data.fuel}%)`);
            $('.fuel-container-bar').css('background', `linear-gradient(to right, rgba(20, 200, 180, 0.5) ${data.fuel}%, rgba(0, 0, 0, 0.5) ${data.fuel}%)`);
        }

        if (data.lightsOn != null && data.highbeamsOn != null) {
            if (data.lightsOn == true && data.highbeamsOn == false) {
                $('#hl1, #hl2, #hl3, #hl4, #hl5, #hl6').css('fill', '#16BD17');
            } else if (data.lightsOn == true && data.highbeamsOn == true) {
                $('#hl1, #hl2, #hl3, #hl4, #hl5, #hl6').css('fill', '#31a0e1');
            } else {
                $('#hl1, #hl2, #hl3, #hl4, #hl5, #hl6').css('fill', 'white');
            }
        }

        if (data.seatbelt != null) {
            if (data.seatbelt == true) {
                $('#seatbelt').attr('src', 'images/cinto2.png');
            } else {
                $('#seatbelt').attr('src', 'images/cinto0.png');
            }
        }

        if (data.health != null) {
            if (data.health == 105) {
				$('#health').css('background', `linear-gradient(to top, rgba(225, 51, 49, 0.6) 100%, rgba(0, 0, 0, 0.5) 100%)`);
			} else {
				$('#health').css('background', `linear-gradient(to top, rgba(225, 51, 49, 0.6) ${data.health}%, rgba(0, 0, 0, 0.5) ${data.health}%)`);
			}
        }

        if (data.armour != null) {
            $('#armour').css('background', `linear-gradient(to top, rgba( 49, 116, 225, 0.6) ${data.armour}%, rgba(0, 0, 0, 0.5) ${data.armour}%)`);
        }

        if (data.stamina != null) {
            $('#stamina').css('background', `linear-gradient(to top, rgba( 200, 150, 25, 0.6) ${data.stamina}%, rgba(0, 0, 0, 0.5) ${data.stamina}%)`);
        }

        if (data.hunger != null) {
            $('#hunger').css('background', `linear-gradient(to top, rgba( 200, 100, 50, 0.6) ${data.hunger}%, rgba(0, 0, 0, 0.5) ${data.hunger}%)`);
        }

        if (data.thirst != null) {
            $('#thirst').css('background', `linear-gradient(to top, rgba( 20, 150, 220, 0.6) ${data.thirst}%, rgba(0, 0, 0, 0.5) ${data.thirst}%)`);
        }

        if (data.micrange != null) {
            $('#micrange').text(data.micrange);
        }

        if (data.micOn != null) {
            if (data.micOn == true) {
                $('#signal').toggleClass("pulse");
            } else {
                $('#signal').toggleClass("pulse");
            }
        }

        if (data.date != null) {
            $('#date').text(data.date);
        }
    });


    function setProgressSpeed(value, max) {
        var element = '.progress-speed';
        var hue = Math.floor(Math.max(125 * (1 - value / max), 0));

        var circle = document.querySelector(element);

        createGradient($('svg')[0], 'MyGradient', [
            { offset: '0%', 'stop-color': 'hsl(0,50%,50%)' },
            // { offset: '10%', 'stop-color': 'hsl(0,50%,50%)' },
            // { offset: '20%', 'stop-color': 'hsl(0,50%,50%)' },
            // { offset: '30%', 'stop-color': 'hsl(0,50%,50%)' },
            // { offset: '40%', 'stop-color': 'hsl(0,50%,50%)' },
            // { offset: '50%', 'stop-color': 'hsl(0,50%,50%)' },
            // { offset: '60%', 'stop-color': 'hsl(0,50%,50%)' },
            // { offset: '70%', 'stop-color': 'hsl(0,50%,50%)' },
            // { offset: '80%', 'stop-color': 'hsl(0,50%,50%)' },
            // { offset: '90%', 'stop-color': 'hsl(0,50%,50%)' },
            { offset: '100%', 'stop-color': `hsl(${hue},50%,50%)` }
        ]);

        $(element).attr('stroke', 'url(#MyGradient)');

        // circle.style.stroke = "hsl(" + hue + ",50%,50%)";
        // document.querySelector('.sealtbelt-svg').style.fill = "hsl(" + hue + ",100%,50%)";
        var radius = circle.r.baseVal.value;
        var circumference = radius * 2 * Math.PI;
        var html = $(element).parent().parent().find('.speed');
        var percent = value * 100 / max;

        circle.style.strokeDasharray = `${circumference} ${circumference}`;
        // circle.style.strokeDashoffset = `${circumference}`;

        const offset = circumference - ((-percent * 60) / 100) / 100 * circumference;
        circle.style.strokeDashoffset = -offset;

        html.text(value);
    }

    function createGradient(svg, id, stops) {
        var svgNS = svg.namespaceURI;
        var grad = document.createElementNS(svgNS, 'linearGradient');
        grad.setAttribute('id', id);
        for (var i = 0; i < stops.length; i++) {
            var attrs = stops[i];
            var stop = document.createElementNS(svgNS, 'stop');
            for (var attr in attrs) {
                if (attrs.hasOwnProperty(attr)) stop.setAttribute(attr, attrs[attr]);
            }
            grad.appendChild(stop);
        }

        var defs = svg.querySelector('defs') ||
            svg.insertBefore(document.createElementNS(svgNS, 'defs'), svg.firstChild);
        return defs.appendChild(grad);
    }
});