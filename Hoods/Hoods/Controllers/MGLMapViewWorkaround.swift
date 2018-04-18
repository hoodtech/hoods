//
//  MGLMapViewWorkaround.swift
//  Hoods
//
//  Created by Andrew Carvajal on 3/31/18.
//  Copyright © 2018 Hoods. All rights reserved.
//

import Mapbox

class MGLMapViewWorkaround: MGLMapView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
