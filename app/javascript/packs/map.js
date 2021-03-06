import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  // markers.forEach((marker) => {
  //   console.log(markers);
    markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '160px';
    element.style.height = '160px';

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
    });
  };

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 2000 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
    if (markers.length !== 0) {
      addMarkersToMap(map, markers);
      fitMapToMarkers(map, markers);
    }
  }
};

export { initMapbox };

// if (window.location.href.includes('favourites')  || window.location.href.includes('venues')) {
//       map.addControl(new mapboxgl.GeolocateControl({
//         positionOptions: {
//           enableHighAccuracy: true
//         },
//         trackUserLocation: true
//       }))
//     } else {
//       const geolocate = new mapboxgl.GeolocateControl();
//       map.addControl(geolocate);
//       window.addEventListener("load", (event) => {
//         geolocate.trigger();
//       })
//     };


