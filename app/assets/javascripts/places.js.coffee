#= require leaflet

buildings = [
  {
    name: "SUSU Building 42",
    points: [
      [50.934592,-1.397812],
      [50.934335,-1.396889],
      [50.934129,-1.397045],
      [50.934183,-1.397249],
      [50.934001,-1.397377],
      [50.933960,-1.397216],
      [50.933771,-1.397345],
      [50.933889,-1.397758],
      [50.933990,-1.397683],
      [50.934014,-1.397758],
      [50.933852,-1.397876],
      [50.933926,-1.398118],
      [50.934109,-1.397983],
      [50.934119,-1.398026],
      [50.934230,-1.397946],
      [50.934244,-1.397994],
      [50.934342,-1.397919],
      [50.934369,-1.397978]
    ]
  },{
    name: "The Shop",
    points: [
      [50.934545,-1.396953],
      [50.934406,-1.396476],
      [50.934305,-1.396551],
      [50.934447,-1.397023]
    ]
  },{
    name: "SUSU Building 40",
    points: [
      [50.934937,-1.397249],
      [50.934876,-1.397200],
      [50.934866,-1.397222],
      [50.934717,-1.397136],
      [50.934721,-1.397114],
      [50.934650,-1.397071],
      [50.934572,-1.397399],
      [50.934859,-1.397570]
    ]
  }]
    
addBuildings = (buildings, map) ->
	$.each buildings, (index) ->
		map.addLayer(
			L.polygon(this.points, {
				smoothFactor: 0.0,
				color: '#333',
				opacity: 1.0,
				fillOpacity: 0.8
			})
		)

mappedMarkers = {}
addMarkers = (markers, map) ->
	$.each markers, ->
		mappedMarkers[this.id] = new L.Marker(
			[this["latlng"][0], this["latlng"][1]]
		).addTo(map)

highlightMarker = (id, map) ->
	$.each mappedMarkers, (i, marker) ->
		map.removeLayer(marker)
	mappedMarkers[id].addTo(map)

unhighlightMarker = (id, map) ->
	map.removeLayer(mappedMarkers[id])
	$.each mappedMarkers, (i, marker) ->
		marker.addTo(map)

$ ->
  if window.map
    addBuildings buildings, window.map
    if window.markers
	    addMarkers window.markers, window.map
	  $('.place').hover ->
		  highlightMarker $(this).data('id'), window.map
		, ->
			unhighlightMarker $(this).data('id'), window.map
