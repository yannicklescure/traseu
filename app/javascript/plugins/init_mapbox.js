import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js'
const mapElement = document.getElementById('map');
// import polyline from '@mapbox/polyline';
var polyline = require('@mapbox/polyline');

const addMarkers = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infowindow);
    new mapboxgl.Marker()
    .setLngLat([ marker.lng, marker.lat ])
    .setPopup(popup)
    .addTo(map);
  });
};

const pathFinder = (map, markers) => {
  // debugger
  // {lat: -13.5228392, lng: -71.967627,
  //  lat:-12.0621065, lng: -77.0365256,

  //Arequipa Longitud: -71.5350000,
  //Arequipa Latitud: -16.3988900,

  // Puno Longitud: -70.0198975,
  // Puno Latitud: -15.8422003,

  // api takes long,lat;
  const coords = `-71.967627,-13.5228392;-77.0365256,-12.0621065;-71.5350000,-16.3988900;-70.0430588,-15.8275436`;
  const mapboxApiKey = mapElement.dataset.mapboxApiKey;
  const url = `https://api.mapbox.com/optimized-trips/v1/mapbox/driving/${coords}?access_token=${mapboxApiKey}`;
  fetch(url)
    .then(response => response.json())
    .then(data => {
      // geoJSON takes LAT , LON
      // `data.trips[0].geometry` is the Geoline String from the API
      const polyLine = data.trips[0].geometry;
      // reverse (Lonng and lat) to (Lat and Lon)
      const geoJSON = polyline.decode(polyLine).map(coord => [coord[1], coord[0]] );

      const options = {
        "id": "myroute",
        "type": "line",
        "source": {
          "type": "geojson",
          "data": {
          "type": "Feature",
          "properties": {},
          "geometry": {
            "type": "LineString",
            "coordinates":
              geoJSON
            }
          }
        },
        "layout": {
          "line-join": "round",
          "line-cap": "round"
        },
        "paint": {
          "line-color": "#3F3D56",
          "line-width": 3
        }
      };
      map.addLayer(options);
    })
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 6, duration: 0 });
};


const initMapBox = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });

  const markers = JSON.parse(mapElement.dataset.markers);

  fitMapToMarkers(map, markers);
  addMarkers(map, markers);
  // pathfinder prototype
  pathFinder(map, markers);
};

export { initMapBox };

