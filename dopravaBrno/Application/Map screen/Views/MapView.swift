//
//  MapView.swift
//  dopravaBrno
//
//  Created by Thành Đỗ Long on 20/03/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import Foundation
import MapKit

public final class MapView: UIView {
    
    @IBOutlet weak var map: MKMapView! {
        didSet {
            map.showsUserLocation = true
            map.mapType = .standard
            map.userTrackingMode = .follow
        }
    }
    
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var zoomUserLocationButton: UIButton!
    @IBOutlet weak var container: UIView! {
        didSet {
            container.layer.cornerRadius = 10.0
        }
    }
}
