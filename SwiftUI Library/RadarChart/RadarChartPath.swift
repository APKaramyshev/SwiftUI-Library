//
//  RadarChartPath.swift
//  SwiftUI Library
//
//  Created by Andrey Karamyshev on 22.02.2021.
//  Source: https://medium.com/better-programming/data-visualization-with-swiftui-radar-charts-64124aa2ac0b
//

import SwiftUI

struct RadarChartPath: Shape {

    let data: [Double]

    func path(in rect: CGRect) -> Path {
        var path = Path()

        guard data.count >= 3,
              let minimum = data.min(),
              minimum >= 0,
              let maximum = data.max()
        else {
            return path
        }

        let radius = min(rect.maxX - rect.midX, rect.maxY - rect.midY)

        for (index, number) in data.enumerated() {
            let point = CGPoint(x: rect.midX + CGFloat(number / maximum) * cos(CGFloat(index) * .two_pi / CGFloat(data.count) - .half_pi) * radius,
                                y: rect.midY + CGFloat(number / maximum) * sin(CGFloat(index) * .two_pi / CGFloat(data.count) - .half_pi) * radius)

            index == 0 ? path.move(to: point) : path.addLine(to: point)
        }

        path.closeSubpath()

        return path
    }

}
