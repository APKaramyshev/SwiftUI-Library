//
//  RadarChartGrid.swift
//  SwiftUI Library
//
//  Created by Andrey Karamyshev on 22.02.2021.
//  Source: https://medium.com/better-programming/data-visualization-with-swiftui-radar-charts-64124aa2ac0b
//

import SwiftUI

struct RadarChartGrid: Shape {

    let axesCount: Int
    let divisionsCount: Int

    func path(in rect: CGRect) -> Path {
        var path = Path()

        guard axesCount >= 3 else {
            return path
        }

        func point(_ axisNumber: Int, _ radius: CGFloat) -> CGPoint {
            return CGPoint(x: rect.midX + cos(CGFloat(axisNumber) * .two_pi / CGFloat(axesCount) - .half_pi) * radius,
                           y: rect.midY + sin(CGFloat(axisNumber) * .two_pi / CGFloat(axesCount) - .half_pi) * radius)
        }

        let midPoint = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.maxX - rect.midX, rect.maxY - rect.midY)

        for axisNumber in 1 ... axesCount {
            path.move(to: midPoint)
            path.addLine(to: point(axisNumber, radius))
        }

        let step = radius / CGFloat(divisionsCount)

        for divisionNumber in 1 ... divisionsCount {
            let divisionRadius = CGFloat(divisionNumber) * step

            path.move(to: CGPoint(x: rect.midX + cos(-.half_pi) * divisionRadius,
                                  y: rect.midY + sin(-.half_pi) * divisionRadius))

            for axisNumber in 1 ... axesCount {
                path.addLine(to: point(axisNumber, divisionRadius))
            }
        }

        return path
    }

}
