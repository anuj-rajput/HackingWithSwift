//
//  ViewController.swift
//  DetectABeacon
//
//  Created by Anuj Rajput on 04/10/20.
//

import CoreLocation
import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var distanceReading: UILabel!
    var locationManager: CLLocationManager?
    var isDetected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        view.backgroundColor = .gray
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    func startScanning() {
        ["2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6",
         "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0",
         "74278BDA-B644-4520-8F0C-720EAF059935",
         "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5",
         "B9407F30-F5F8-466E-AFF9-25556B57FE6D"]
            .map { (str) -> UUID in
                UUID(uuidString: str)!
            }
            .forEach { uuid in
                // FIXME: This is not working because of multiple beacons
                locationManager?.startRangingBeacons(in: .init(uuid: uuid, major: 123, minor: 456, identifier: "Beacon"))
            }
    }
    
    func update(distance: CLProximity) {
        UIView.animate(withDuration: 1) {
            switch distance {
            case .far:
                self.view.backgroundColor = .systemBlue
                self.distanceReading.text = "FAR"
                
            case .near:
                self.view.backgroundColor = .systemOrange
                self.distanceReading.text = "NEAR"
                
            case .immediate:
                self.view.backgroundColor = .systemRed
                self.distanceReading.text = "RIGHT HERE"
                
            default:
                self.view.backgroundColor = .systemGray
                self.distanceReading.text = "UNKNOWN"
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if let beacon = beacons.first {
            update(distance: beacon.proximity)
            
            if !isDetected {
                isDetected.toggle()
                let ac = UIAlertController(title: "Beacon Found", message: "UUID: \(beacon.uuid) Major: \(beacon.major) Minor: \(beacon.minor)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Okay", style: .default))
                present(ac, animated: true)
            }
        } else {
            update(distance: .unknown)
        }
    }
}

