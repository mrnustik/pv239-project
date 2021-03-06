//
//  MapAnnotationView.swift
//  dopravaBrno
//
//  Created by Michal Mrnustik on 10/04/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import Foundation
import MapKit

public class AnnotationView: MKAnnotationView {
    override public var annotation: MKAnnotation? {
        willSet {
            guard let annotation = newValue as? Annotation else { return }
            self.view?.image.image = annotation.image
            self.view?.backrgoundView.borderColor = annotation.color
            self.view?.arrowImage.isHidden = true
            self.view?.label.text = ""
            self.clusteringIdentifier = annotation.annotationType.rawValue
            
            guard let heading = annotation.heading else { return }
            self.view?.label.text = annotation.title ?? ""
            self.view?.arrowImage.isHidden = false
            let rotation = CGFloat(heading/180 * Double.pi)
            self.view?.arrowImage.transform = CGAffineTransform(rotationAngle: rotation)
            
        }
    }
    
    private var view: CircleAnnotationView?
    
    public override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.preperaView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.preperaView()
    }
    
    private func preperaView() {
        self.view = CircleAnnotationView(frame: self.frame)
        self.isUserInteractionEnabled = true
        self.view?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.onViewTapped(_:))))
        self.addSubview(view!)
        canShowCallout = true
    }
    
    @objc private func onViewTapped(_ sender: UITapGestureRecognizer) {
        self.setSelected(true, animated: false)
    }
    
}

public class MapAnnotationView: MKMarkerAnnotationView {
    override public var annotation: MKAnnotation? {
        willSet {
            guard let annotation = newValue as? Annotation else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            markerTintColor = annotation.color
            glyphImage = annotation.image
        }
    }
}
