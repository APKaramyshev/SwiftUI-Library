//
//  ContentView.swift
//  SwiftUI Library
//
//  Created by Andrey Karamyshev on 22.02.2021.
//

import SwiftUI

struct ContentView: View {

    private var data: [Double] {
        var n = 17

        var steps = [n]

        while n != 1 {
            // https://ru.wikipedia.org/wiki/Гипотеза_Коллатца
            n = n.isMultiple(of: 2) ? n / 2 : n * 3 + 1

            steps.append(n)
        }

        print(steps)

        return steps.map(Double.init)
    }

    var body: some View {
        RadarChart(data: data, divisionsCount: 10)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
