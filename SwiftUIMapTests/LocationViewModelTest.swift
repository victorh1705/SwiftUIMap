//
//  LocationViewModelTest.swift
//  SwiftUIMapTests
//
//  Created by Victor Henrique de Oliveira on 07/11/22.
//

import XCTest
@testable import SwiftUIMap

class LocationViewModelTest: XCTestCase {
    
    var viewmodel: LocationViewModel?
    var locations = LocationsDataService.locations
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewmodel = LocationViewModel(
            locationService: LocationService() as LocationServiceProtocol
        )
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_mapLocationAndLocationsAndMapRegions_shouldNotBeNil_onInit() throws {
        // Given
        guard let viewmodel = viewmodel else {
            XCTFail()
            return
        }
        
        //Then
        XCTAssertNotNil(viewmodel.mapLocation, "mapLocation should be initialized")
        XCTAssertNotNil(viewmodel.locations, "locations should be initialized")
        XCTAssertNotNil(viewmodel.mapRegion, "mapRegion should be initialized")
    }
    
    //    MARK: update location
    
    func test_location_shouldBeUpdated_onLocationUpdate() throws {
        (1..<locations.count).forEach { index in
            // Given
            guard let viewmodel = viewmodel else {
                XCTFail()
                return
            }
            
            let pastLocation = viewmodel.mapLocation
            
            // When
            viewmodel.mapLocation = locations[index]
            
            //Then
            XCTAssertNotEqual(viewmodel.mapLocation, pastLocation, "mapLocation is expected to be different from \(pastLocation) but was \(viewmodel.mapLocation)")
        }
    }
    
    //    MARK: show list
    
    func test_showLocationList_shouldToggle_onMethodCall() throws {
        (0...1).forEach { index in
            // Given
            guard let viewmodel = viewmodel else {
                XCTFail()
                return
            }
            let pastState = viewmodel.showLocationList
            
            // When
            viewmodel.toggleShowLocation()
            
            //Then
            XCTAssertNotEqual(viewmodel.showLocationList, pastState)
        }
    }
    
    //    MARK: show next location
    func test_mapLocation_shouldSetMapLocatino_WhenMethodIsCalled() throws {
        locations.forEach{ location in
            // Given
            guard let viewmodel = viewmodel else {
                XCTFail()
                return
            }
            
            // When
            viewmodel.showNextLocation(location: location)
            
            //Then
            XCTAssertEqual(viewmodel.mapLocation, location, "mapLocation is expected to be \(location) but was \(viewmodel.mapLocation)")
        }
    }
    
    //    MARK: next button pressed
    
    func test_mapLocation_shouldChange_WhenNextButtonMethodIsCalled() throws {
        
        (0..<locations.count).forEach { index in
            // Given
            guard let viewmodel = viewmodel else {
                XCTFail()
                return
            }
            let pastLocation = viewmodel.mapLocation
            let expectedLocation = locations.indices.contains(index+1)
                ? locations[index+1]
                : locations.first!
            
            // When
            viewmodel.nextButtonPressed()
            
            //Then
            XCTAssertNotEqual(viewmodel.mapLocation, pastLocation)
            XCTAssertEqual(viewmodel.mapLocation, expectedLocation, "mapLocation is expected to be \(expectedLocation) but was \(viewmodel.mapLocation)")
        }
    }
}
