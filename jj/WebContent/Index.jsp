<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	if(session.getAttribute("twitter")==null)
		response.sendRedirect("login.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./assets/css/Buttons.css">
<link rel="stylesheet" type="text/css" href="./assets/css/index.css">
<link rel="stylesheet" type="text/css" href="./assets/css/login.css">
<title>Insert title here</title>
</head>
<body>
<div class="cabecera">
<div id="divlogo"><img id="logoCab" src="./assets/img/LOGO.png" alt="logo"/></div>
<div id="divbusca"><a href="Index.jsp"/><img id="busca" src="./assets/img/buscaLogo.png" alt="logoBusca"/></a></div>
<div id="divpublica"><a href="Post.jsp"/><img id="publica" src="./assets/img/publica.png" alt="logoPublica"/></a></div>
<div id="divchatea"><img id="chatea" src="./assets/img/chatea.png" alt="logoChatea"/></div>
<div id="divlogin"><section class="row1">  
 <div class="seccion">
  <div class="boton-linea-ext">
    <span class="linea1"></span>
    <span class="linea2"></span>
    <span class="linea3"></span>
    <span class="linea4"></span>
    <a id="modalBtn" class="button" href="logout">CERRAR SESIÓN</a>
  </div>
 </div>
</section></div>
</div>
 <div id="cuerpoIndex">
    <div id="map">
        <img id="localiza" src="./assets/img/localiza.png" alt="localiza"/>
    </div>
    <img id="localiza" src="./assets/img/localiza.png" alt="localiza"/>
	<input id="autocomplete" type="text"
      placeholder="Introduce una localización">
</div>
    <script>

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -33.8688, lng: 151.2195},
          zoom: 13
        });
        var input = /** @type {!HTMLInputElement} */(
            document.getElementById('autocomplete'));

        var types = document.getElementById('type-selector');
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);

        var infowindow = new google.maps.InfoWindow();
        var marker = new google.maps.Marker({
          map: map,
          anchorPoint: new google.maps.Point(0, -29)
        });

        autocomplete.addListener('place_changed', function() {
          infowindow.close();
          marker.setVisible(false);
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          marker.setIcon(/** @type {google.maps.Icon} */({
            url: place.icon,
            size: new google.maps.Size(71, 71),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(35, 35)
          }));
          marker.setPosition(place.geometry.location);
          marker.setVisible(true);

          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }

          infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
          infowindow.open(map, marker);
        });

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        function setupClickListener(id, types) {
          var radioButton = document.getElementById(id);
          radioButton.addEventListener('click', function() {
            autocomplete.setTypes(types);
          });
        }

        setupClickListener('changetype-all', []);
        setupClickListener('changetype-address', ['address']);
        setupClickListener('changetype-establishment', ['establishment']);
        setupClickListener('changetype-geocode', ['geocode']);
      }
    </script>
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBbYLfQmvKGhhqz1nNee2CtW_Xv87dKHn4&libraries=places&callback=initMap"
        async defer></script>
  </body>
</html>