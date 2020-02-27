//
//  ChartViewController.swift
//  SciChart-example-iOS
//
//  Created by Andrew Krotov on 27.02.2020.
//  Copyright © 2020 Andrew Krotov. All rights reserved.
//

import UIKit
import SciChart
import AppServices
import AppModel

internal final class ChartViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let _surface = SCIChartSurface()
    private var _pointsService: PointsServiceType?
    private let _dataSeries = SCIXyDataSeries(xType: .int, yType: .double)
    private let _lastValueDataSeries = SCIXyDataSeries(xType: .int, yType: .double)
    private let _lastValueSeries = SCIFastLineRenderableSeries()
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSurface()
    }
    
    // MARK: - Internal methods
    
    internal func configure(with pointsService: PointsServiceType) {
        _pointsService = pointsService
        pointsService.subscribeOn { [weak self] points in
            DispatchQueue.main.async {
                self?.updateSurface(with: points)
            }
        }
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        navigationItem.title = "Example chart"
        
        _surface.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(_surface)
        
        NSLayoutConstraint.activate([
            _surface.leftAnchor.constraint(equalTo: view.leftAnchor),
            _surface.topAnchor.constraint(equalTo: view.topAnchor),
            _surface.rightAnchor.constraint(equalTo: view.rightAnchor),
            _surface.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        _surface.chartModifiers.add(items: SCIPinchZoomModifier(), SCIZoomPanModifier(), SCIZoomExtentsModifier())
    }
    
    private func setupSurface() {
        let pointMarker = SCIEllipsePointMarker()
        pointMarker.fillStyle = SCIRadialGradientBrushStyle(center: .white, edgeColor: .darkGray)
        pointMarker.size = CGSize(width: 10, height: 10)

        let series = SCIFastLineRenderableSeries()
        series.dataSeries = _dataSeries
        series.pointMarker = pointMarker
        
        SCIUpdateSuspender.usingWith(_surface) { [weak self] in
            guard let `self` = self else { return }
            
            self._surface.xAxes.add(items: SCINumericAxis())
            self._surface.yAxes.add(items: SCINumericAxis())
            self._surface.renderableSeries.add(items: series, self._lastValueSeries)
        }
    }
    
    private func updateSurface(with points: [Point]) {
        SCIUpdateSuspender.usingWith(_surface) { [weak self] in
            guard let `self` = self else { return }
            
            for i in max(self._dataSeries.count - 1, 0)..<points.count {
                self._dataSeries.append(x: i, y: points[i].rate)
            }

            if let last = points.last {
                self._lastValueDataSeries.clear()
                self._lastValueDataSeries.append(x: 0, y: last.rate)
                self._lastValueDataSeries.append(x: points.count - 1, y: last.rate)
                self._lastValueSeries.dataSeries = self._lastValueDataSeries
                self._lastValueSeries.strokeStyle = SCISolidPenStyle(color: .white, thickness: 1)
            }
            
            self._surface.zoomExtents()
        }
    }
}
