import Felgo 3.0
import QtQuick 2.12
import QtCharts 2.0

App {
    licenseKey: "A695509703CF59DC151A1806A3629C9FAA5FA097DDD2B0385B6DDB905C4BC0662F5F73AEDB191B5BB8631296395C02FFB474E24349D2A4FA6F73801D72404DFB8AF123F43EF383DB9C8C41356E0058A532E2F0650DCF940DD4A7C4BF63CE3FB0E55A83F17E0CA3F3CCFAD3357BEDC4ED98B2FF4CD267DE126E38F56A74CBD1D192CD26C7165EE0C0DCFBC634A58E601507FD554B1213FCE10A4895B62B3CEC8066C124A2BCE4095D0BC2FBFF5072F0356392C802DAD1410FC0550D42BC419276C0E86C405CF3E5930007F067C68256B0EE80A7975AFA7F57CF0C5414755AFF51E4DFEC9E29333B9BA59070B7DD6ED14C2C65E5D32187F80195322D7EE99874C872EE442C7C303E6AF2F4F2E378A654904E33531B3389C18D1C14EDB1F269F03C8C1C269E12831A72063FD1B23507A772D0EC52ED5FAB16FBB81DAD3AEFDD6FD1"

    property var barData: []
    property var valueNames: []
    property var barNames: []

    ChartView {
        anchors.fill: parent
        theme: ChartView.ChartThemeBrownSand
        antialiasing: true
        title: "Bar graph"
        legend.visible: false

        BarSeries {
            id: barSeries
            axisX: BarCategoryAxis {
                categories: valueNames
            }
        }
    }

    Component.onCompleted: buildChart()
    onBarDataChanged: buildChart()
    onBarNamesChanged: buildChart()

    function buildChart() {
        barSeries.clear()
        
        if(barData && barNames) {
            barData.forEach(function(data, index) {
                barSeries.append(barNames[index], data)
            })
        }
    }
}
