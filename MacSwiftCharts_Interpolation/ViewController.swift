//
//  ViewController.swift
//  MacSwiftCharts_Interpolation
//
//  Created by rabbit on 2025/05/17.
//

import Cocoa
import SwiftUI


class ViewController: NSViewController {

    private var contentView: NSHostingView<ContentView>!
//    @State private var swiftChartViewModel = SwiftChartViewModel(count: 0)
    @State private var contentViewModel = ContentViewModel()

    override func viewDidAppear() {
        self.view.window!.center()
        self.view.window?.title = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
            "Set TARGETS > General > Identity > Display Name"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        contentViewModel.data = [
            .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 1))!, linear: 350, cardinal: 300, catmullRom: 250, monotone: 200, stepCenter: 150, stepEnd: 100, stepStart: 50),
            .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 2))!, linear: 380, cardinal: 330, catmullRom: 280, monotone: 230, stepCenter: 180, stepEnd: 130, stepStart: 80),
            .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 3))!, linear: 350, cardinal: 300, catmullRom: 250, monotone: 200, stepCenter: 150, stepEnd: 100, stepStart: 50),
            .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 4))!, linear: 390, cardinal: 340, catmullRom: 290, monotone: 240, stepCenter: 190, stepEnd: 140, stepStart: 90),
            .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 5))!, linear: 350, cardinal: 300, catmullRom: 250, monotone: 200, stepCenter: 150, stepEnd: 100, stepStart: 50),
            .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 6))!, linear: 370, cardinal: 320, catmullRom: 270, monotone: 220, stepCenter: 170, stepEnd: 120, stepStart: 70),
            .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 7))!, linear: 350, cardinal: 300, catmullRom: 250, monotone: 200, stepCenter: 150, stepEnd: 100, stepStart: 50),
        ]


        contentView = NSHostingView(rootView: ContentView(viewModel: contentViewModel))
        self.view.addSubview(contentView)
        contentView.frame = .init(origin: .init(x: 0, y: 0), size: .init(width: 500, height: 400))
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: contentView.superview!.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: contentView.superview!.centerYAnchor).isActive = true
//        swiftChartView.widthAnchor.constraint(equalTo: swiftChartView.superview!.widthAnchor, multiplier: 0.8).isActive = true
//        swiftChartView.heightAnchor.constraint(equalTo: swiftChartView.superview!.heightAnchor, multiplier: 0.8).isActive = true
        contentView.widthAnchor.constraint(equalTo: contentView.superview!.widthAnchor, constant: -100).isActive = true
        contentView.heightAnchor.constraint(equalTo: contentView.superview!.heightAnchor, constant: -100).isActive = true
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

