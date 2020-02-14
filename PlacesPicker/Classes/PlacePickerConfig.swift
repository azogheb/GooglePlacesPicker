//
//  PlacePickerConfig.swift
//  PlacePicker-iOS
//
//  Created by Piotr Bernad on 05/07/2019.
//  Copyright © 2019 Piotr Bernad. All rights reserved.
//

import Foundation
import GooglePlaces

@objc public class PlacePickerConfig : NSObject {
    public let listRenderer: PlacesListRenderer
    @objc public let placeFields: GMSPlaceField
    public let pickerRenderer: PickerRenderer
    @objc public let placesFilter: GMSAutocompleteFilter?
    public let initialCoordinate: CLLocationCoordinate2D?
    @objc public let initialZoom: Float
    
    @objc public static func defaultConfig() -> PlacePickerConfig {
        return PlacePickerConfig()
    }
    
    @objc public static func initWithInitialCoordinate(initialCoordinate: CLLocationCoordinate2D) -> PlacePickerConfig {
    
        return PlacePickerConfig.init(initialCoordinate: initialCoordinate)
    }
    
    public init(listRenderer: PlacesListRenderer = DefaultPlacesListRenderer(),
                placeFields: GMSPlaceField = GMSPlaceField.defaultFields,
                placesFilter: GMSAutocompleteFilter? = nil,
                pickerRenderer: PickerRenderer = DefaultPickerRenderer(),
                initialCoordinate: CLLocationCoordinate2D? = nil,
                initialZoom: Float = 13.0) {
        self.listRenderer = listRenderer
        self.placeFields = placeFields
        self.placesFilter = placesFilter
        self.pickerRenderer = pickerRenderer
        self.initialZoom = initialZoom
        self.initialCoordinate = initialCoordinate
    }
}

extension GMSPlaceField {
    public static var defaultFields: GMSPlaceField {
        return GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
                                       UInt(GMSPlaceField.placeID.rawValue) |
                                       UInt(GMSPlaceField.addressComponents.rawValue) |
                                       UInt(GMSPlaceField.coordinate.rawValue) |
                                       UInt(GMSPlaceField.formattedAddress.rawValue) |
                                       UInt(GMSPlaceField.photos.rawValue))!
    }
}

