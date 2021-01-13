//
//  SettingsTableViewCell.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 08.01.2021.
//

import UIKit



class SettingsTableViewCell: UITableViewCell {

    enum SettingsCellStyle {
        case sourceSegment
        case categoryPicker
        case countryPicker
        case numberOfStepper
        case explicitSwitch
    }
    
    static let identifiable: String = "SettingsCell"
    
    static func createUINib() -> UINib {
        return UINib(nibName: "SettingsTableViewCell", bundle: nil)
    }
    
    //MARK: - Outlets
    
    var segmentControl: UISegmentedControl!
    var selectedCategoryLabel: UILabel!
    var selectedCountryLabel: UILabel!
    var stepper: UIStepper!
    var countLabel: UILabel!
    var switcher: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    
    //MARK: - Actions
    
    @objc private func stepperValue(_ sender: UIStepper) {
        countLabel.text = String(Int(sender.value))
    }
    
    @objc private func switcherChange(_ sender: UISwitch) {
        changeExplicitLabel(isOn: sender.isOn)
    }
    
    func setupCell(title: String,
                   secondaryTitle: String?,
                   cellStyle: SettingsCellStyle,
                   segmentIndex: Int = 0,
                   stepperValue: Int = 10,
                   switcherIsOn: Bool = false) {
        
        self.textLabel?.text = title
        
        switch cellStyle {
        case .sourceSegment:
            let arraySourceName = ChartURLBuilder.getMusicSourceName()
            segmentControl = UISegmentedControl(items: arraySourceName)
            
            self.addSubview(segmentControl)
            setupSegmentControl(segment: segmentControl, selectedIndex: segmentIndex)
            
        case .categoryPicker:
            self.accessoryType = .disclosureIndicator
            self.selectionStyle = .default
            
            selectedCategoryLabel = UILabel()
            self.addSubview(selectedCategoryLabel)
            
            setupLabelTitle(label: selectedCategoryLabel, text: secondaryTitle ?? "")
            
        case .countryPicker:
            self.accessoryType = .disclosureIndicator
            self.selectionStyle = .default
            
            selectedCountryLabel = UILabel()
            self.addSubview(selectedCountryLabel)
            
            setupLabelTitle(label: selectedCountryLabel, text: secondaryTitle ?? "")
            
        case .numberOfStepper:
            stepper = UIStepper()
            self.addSubview(stepper)
            
            countLabel = UILabel()
            self.addSubview(countLabel)
            
            setupStepper(stepper: stepper, value: stepperValue)
            setupCountLabel(label: countLabel)
            
            
        case .explicitSwitch:
            
            switcher = UISwitch()
            self.addSubview(switcher)
            
            setupSwitcher(switcher: switcher, isOn: switcherIsOn)
        }
    }
    
    private func setupCountLabel(label: UILabel) {
        label.text = String(Int(stepper.value))
        label.textColor = .secondaryLabel
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.rightAnchor.constraint(equalTo: stepper.leftAnchor, constant: -10).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func setupStepper(stepper: UIStepper, value: Int) {
        stepper.maximumValue = 100
        stepper.minimumValue = 10
        stepper.value = Double(value)
        stepper.stepValue = 10
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        stepper.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        stepper.addTarget(self, action: #selector(stepperValue(_:)), for: .valueChanged)
    }
    
    private func setupLabelTitle(label: UILabel, text: String) {
        label.textColor = .secondaryLabel
        label.text = text
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -35).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func setupSegmentControl(segment: UISegmentedControl, selectedIndex: Int = 0) {
        segment.selectedSegmentIndex = selectedIndex
    
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        segment.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func setupSwitcher(switcher: UISwitch, isOn: Bool) {
        
        switcher.addTarget(self, action: #selector(switcherChange(_:)), for: .valueChanged)
        
        changeExplicitLabel(isOn: isOn)
        
        switcher.isOn = isOn
        
        switcher.translatesAutoresizingMaskIntoConstraints = false
        
        switcher.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        switcher.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func changeExplicitLabel(isOn: Bool) {
        self.textLabel?.text = isOn ? "Explicit" : "Non explicit"
    }
}
