//
//  MainViewController.swift
//  BlueLightTest
//
//  Created by imac-3282 on 2023/7/31.
//

import UIKit
import CoreBluetooth

class MainViewController: UIViewController {
    
    @IBOutlet weak var bleListTableView: UITableView!
    
    @IBOutlet weak var blueLightValueLabel: UILabel!
    
    let bluetoothService = BluetoothServices.shared
    
    private var peripherals: [CBPeripheral] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    func setUI() {
        setTableView()
        setBluetooth()
    }
    
    func setBluetooth() {
        bluetoothService.startScan()
        bluetoothService.delegate = self
    }
    
    func setTableView() {
        bleListTableView.delegate = self
        bleListTableView.dataSource = self
        
        bleListTableView.register(UINib(nibName: "BlePeripheralTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: BlePeripheralTableViewCell.identifier)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peripherals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BlePeripheralTableViewCell.identifier
                                                 ,for: indexPath) as! BlePeripheralTableViewCell
        
        cell.peripheralNameLabel.text = peripherals[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        bluetoothService.connectPeripheral(peripheral: peripherals[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension MainViewController: BluetoothServicesDelegate {
    func getBLEPeripherals(peripherals: [CBPeripheral]) {
        self.peripherals = peripherals
        DispatchQueue.main.async {
            self.bleListTableView.reloadData()
        }
    }
    
    func getBlEPeripheralValue(value: UInt8) {
        DispatchQueue.main.async {
            self.blueLightValueLabel.text = String(value)
        }
    }
}
