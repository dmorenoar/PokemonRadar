//
//  MapView.swift
//  PokemonRadar
//
//  Created by DAM on 31/10/2018.
//  Copyright © 2018 DAM. All rights reserved.
//

import UIKit
import GoogleMaps

class MapView: UIViewController, GMSMapViewDelegate {

    
    let infoMarker = GMSMarker()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func mapView(_ mapView: GMSMapView, didTapPOIWithPlaceID placeID: String, name: String, location: CLLocationCoordinate2D) {
        print("You tapped \(name): \(placeID), \(location.latitude), \(location.longitude)")
    
        infoMarker.snippet = placeID
        infoMarker.position = location
        infoMarker.title = name
        infoMarker.opacity = 0
        infoMarker.infoWindowAnchor.y = 1
        infoMarker.map = mapView
        mapView.selectedMarker = infoMarker
    
    
    }
    
    
    
    
    override func loadView() {
        
        let panoView = GMSPanoramaView(frame: .zero)
        panoView.camera = GMSPanoramaCamera(heading: 180, pitch: -10, zoom: 1)
        self.view = panoView
        
        panoView.moveNearCoordinate(CLLocationCoordinate2D(latitude: -33.732, longitude: 150.312))
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 48.858, longitude: 2.294, zoom: 12)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self
        self.view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 48.858, longitude: 2.294)
        marker.title = "Torre Eiffel"
        marker.snippet = "Paris"
        
        
        marker.panoramaView = panoView //Añadimos el streeview
        
        
        marker.map = mapView
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
