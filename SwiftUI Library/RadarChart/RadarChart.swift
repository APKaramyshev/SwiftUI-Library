//
//  RadarChart.swift
//  SwiftUI Library
//
//  Created by Andrey Karamyshev on 22.02.2021.
//  Source: https://medium.com/better-programming/data-visualization-with-swiftui-radar-charts-64124aa2ac0b
//

import SwiftUI

struct RadarChart: View {

    let data: [Double]
    let divisionsCount: Int
    let gridColor: Color = .gray
    let dataColor: Color = .blue

    var body: some View {
        ZStack {
            RadarChartGrid(axesCount: data.count, divisionsCount: divisionsCount)
                .stroke(gridColor, lineWidth: 0.5)

            RadarChartPath(data: data)
                .fill(dataColor.opacity(0.3))

            RadarChartPath(data: data)
                .stroke(dataColor, lineWidth: 2.0)
        }
    }

}
