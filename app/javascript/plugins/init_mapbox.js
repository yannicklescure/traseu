import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js'
const mapElement = document.getElementById('map');
// import polyline from '@mapbox/polyline';
var polyline = require('@mapbox/polyline');

const markersArray = [];
const addMarkers = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infowindow);
    const newMarker = new mapboxgl.Marker()
    .setLngLat([ marker.lng, marker.lat ])
    .setPopup(popup)
    .addTo(map);
    markersArray.push(newMarker);
  });
};

let layers = [];
const pathFinder = (map, markers) => {
  // debugger
  // {lat: -13.5228392, lng: -71.967627,
  //  lat:-12.0621065, lng: -77.0365256,

  //Arequipa Longitud: -71.5350000,
  //Arequipa Latitud: -16.3988900,

  // Puno Longitud: -70.0198975,
  // Puno Latitud: -15.8422003,

  // api takes long,lat;
  const coords_old = `-71.967627,-13.5228392;-77.0365256,-12.0621065;-71.5350000,-16.3988900;-70.0430588,-15.8275436`;
  // console.log(coords_old);
  let coords = [];
  // debugger
  markers.forEach((marker) => {
    coords.push(`${marker.lng},${marker.lat}`);
  });
  coords = coords.join(';');
  // console.log(coords);
  // coords = `-71.967627,-13.5228392;-77.0365256,-12.0621065;-71.5350000,-16.3988900;-70.0430588,-15.8275436`;
  const mapboxApiKey = mapElement.dataset.mapboxApiKey;
  const url = `https://api.mapbox.com/optimized-trips/v1/mapbox/driving/${coords}?access_token=${mapboxApiKey}`;

  const lastLayer = layers.length > 0 ? layers[layers.length-1] : undefined;
  if (lastLayer !== undefined) map.removeLayer(lastLayer);

  if (markers.length <= 1) {
    // debugger
    layers = [];
    return;
  }

  fetch(url)
    .then(response => response.json())
    .then(data => {

      // if (markers.length == 1) {
      //   layers = [];
      //   map.removeLayer(lastLayer);
      // }
      // if (layers.length > 0 && markers.length > 0) {
        // debugger
        // const lastLayer = layers[layers.length-1];
        // layers.splice(layers.length-1, 1);
        // map.removeLayer(lastLayer);
      // }
      // if (markers.length < 2) return;

      // geoJSON takes LAT , LON
      // `data.trips[0].geometry` is the Geoline String from the API
      const polyLine = data.trips[0].geometry;
      // reverse (Lonng and lat) to (Lat and Lon)
      const geoJSON = polyline.decode(polyLine).map(coord => [coord[1], coord[0]] );
      const routeName = `my-route-${new Date().getTime()}`
      layers.push(routeName);

      let options = {
        "id": routeName,
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
  let markers = JSON.parse(mapElement.dataset.markers);
  const createTogglers = document.querySelectorAll('.city-toggler-create');
  const deleteTogglers = document.querySelectorAll('.city-toggler-delete');

  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });

  if (markers.length > 0) {
    Array.from(createTogglers).forEach(toggler=> {
      toggler.addEventListener('click', () => {
        if (markersArray.length < 1) markers = [];
         // console.log('create toggler', event.target.dataset);
        const markerData = event.target.dataset;
        const newMarker = new mapboxgl.Marker()
          .setLngLat([ markerData.lng, markerData.lat ])
          .addTo(map);
        markersArray.push(newMarker);
        // console.log('marker array', markersArray);ker
        markers.push({lat: markerData.lat, lng: markerData.lng});
        pathFinder(map, markers);
      });
    });

    Array.from(deleteTogglers).forEach(toggler=> {
      toggler.addEventListener('click', () => {
        // console.log('delete toggler', event.target.dataset);
        const markerData = event.target.dataset;
        const newMarker = new mapboxgl.Marker()
          .setLngLat([ markerData.lng, markerData.lat ])
        markersArray.forEach((marker, index) => {
          // console.log('delete function', marker.getLngLat());
          if (marker.getLngLat().lat === newMarker.getLngLat().lat && marker.getLngLat().lng === newMarker.getLngLat().lng) {
            // console.log('delete function newmarker', newMarker.getLngLat());
            marker.remove();
            markersArray.splice(index, 1);
          }
        });
        const modifiedMarkersArray = markersArray.map(marker => {
          return { lng: marker.getLngLat().lng, lat: marker.getLngLat().lat }
        })
        pathFinder(map, modifiedMarkersArray);
      });
    });

    fitMapToMarkers(map, markers);
    addMarkers(map, markers);
    // pathfinder prototype
    pathFinder(map, markers);
  }
};

export { initMapBox, pathFinder, addMarkers };

