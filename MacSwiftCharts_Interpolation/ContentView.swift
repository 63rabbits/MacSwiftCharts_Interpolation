//
//  ContentView.swift
//  MacSwiftCharts_Interpolation
//
//  Created by rabbit on 2025/05/17.
//

import SwiftUI
import Charts


// MARK: - Swift Chart View

struct ChartData: Identifiable {
    var id = UUID()
    let date: Date
    let linear: Int
    let cardinal: Int
    let catmullRom: Int
    let monotone: Int
    let stepCenter: Int
    let stepEnd: Int
    let stepStart: Int
}

struct ContentView: View {

    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        Chart {
            ForEach(viewModel.data) { element in
                LineMark(
                    x: .value("date", element.date, unit: .day),
                    y: .value("linear", element.linear),
                    series: .value("", "linear")
                )
                .foregroundStyle(.pink)
                .symbol(.asterisk)
                .interpolationMethod(.linear)

                LineMark(
                    x: .value("date", element.date, unit: .day),
                    y: .value("cardinal", element.cardinal),
                    series: .value("", "cardinal")
                )
                .foregroundStyle(.yellow)
                .symbol(.circle)
                .interpolationMethod(.cardinal)

                LineMark(
                    x: .value("date", element.date, unit: .day),
                    y: .value("catmullRom", element.catmullRom),
                    series: .value("", "catmullRom")
                )
                .foregroundStyle(.orange)
                .symbol(.cross)
                .interpolationMethod(.catmullRom)

                LineMark(
                    x: .value("date", element.date, unit: .day),
                    y: .value("monotone", element.monotone),
                    series: .value("", "monotone")
                )
                .foregroundStyle(.purple)
                .symbol(.diamond)
                .interpolationMethod(.monotone)

                LineMark(
                    x: .value("date", element.date, unit: .day),
                    y: .value("stepCenter", element.stepCenter),
                    series: .value("", "stepCenter")
                )
                .foregroundStyle(.green)
                .symbol(.pentagon)
                .interpolationMethod(.stepCenter)

                LineMark(
                    x: .value("date", element.date, unit: .day),
                    y: .value("stepEnd", element.stepEnd),
                    series: .value("", "stepEnd")
                )
                .foregroundStyle(.red)
                .symbol(.plus)
                .interpolationMethod(.stepEnd)

                LineMark(
                    x: .value("date", element.date, unit: .day),
                    y: .value("stepStart", element.stepStart),
                    series: .value("", "stepStart")
                )
                .foregroundStyle(.gray)
                .symbol(.square)
                .interpolationMethod(.stepStart)
            }
        }
        .chartForegroundStyleScale([    // for Legend
            "linear": .pink,
            "cardinal": .yellow,
            "catmullRom": .orange,
            "monotone": .purple,
            "stepCenter": .green,
            "stepEnd": .red,
            "stepStart": .gray,
        ])
        .chartSymbolScale([             // for Legend
            "linear": .asterisk,
            "cardinal": .circle,
            "catmullRom": .cross,
            "monotone": .diamond,
            "stepCenter": .pentagon,
            "stepEnd": .plus,
            "stepStart": .square,
        ])
        .chartLegend(
            position: .top,
            alignment: .leading,
            spacing: 10
        )
        .chartXAxis {
            AxisMarks(values: .stride(by: .day, count: 1)) { value in
                if let date = value.as(Date.self) {
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel(centered: true) {
                        Text(date.formatted(.dateTime.weekday()))
                    }
                }
            }
        }
        .chartXAxisLabel(position: .bottom, alignment: .center, spacing: 10) {
            Text("Date").font(.title3)
        }
        .chartYAxisLabel(position: .trailing, alignment: .center, spacing: 10) {
            Text("Count").font(.title3)
        }




        .frame(maxWidth: 500, minHeight: 400)   // delete if use autolayout
    }
}

class ContentViewModel: ObservableObject {

    @Published var data: [ChartData] = []

    init(_ chartData: [ChartData] = []) {
        self.data = chartData
    }
}




// MARK: - Previews

#Preview {
    ContentView(viewModel: ContentViewModel(
        [
            .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 1))!, linear: 350, cardinal: 300, catmullRom: 250, monotone: 200, stepCenter: 150, stepEnd: 100, stepStart: 50),
            .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 2))!, linear: 380, cardinal: 330, catmullRom: 280, monotone: 230, stepCenter: 180, stepEnd: 130, stepStart: 80),
            .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 3))!, linear: 350, cardinal: 300, catmullRom: 250, monotone: 200, stepCenter: 150, stepEnd: 100, stepStart: 50),
            .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 4))!, linear: 390, cardinal: 340, catmullRom: 290, monotone: 240, stepCenter: 190, stepEnd: 140, stepStart: 90),
            .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 5))!, linear: 350, cardinal: 300, catmullRom: 250, monotone: 200, stepCenter: 150, stepEnd: 100, stepStart: 50),
            .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 6))!, linear: 370, cardinal: 320, catmullRom: 270, monotone: 220, stepCenter: 170, stepEnd: 120, stepStart: 70),
            .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 7))!, linear: 350, cardinal: 300, catmullRom: 250, monotone: 200, stepCenter: 150, stepEnd: 100, stepStart: 50),
        ]
    ))
}

