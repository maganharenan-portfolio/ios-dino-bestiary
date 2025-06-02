//
//  MapPinShape.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 28/05/25.
//

import SwiftUI

/// A custom map pin shape with an upside-down teardrop appearance,
/// similar to typical location markers used in maps.
///
/// - Important:
///   This shape is based on the dimensions of the given `rect`.
///   If the width-to-height ratio is not balanced (e.g., the width
///   is much greater than the height), the resulting shape may appear
///   stretched or deformed. To preserve the intended teardrop form,
///   use a square frame or apply an `.aspectRatio(1.0, contentMode: .fit)` modifier.
///
/// - Tip:
///   You can enhance the visual quality by keeping the shape centered
///   and giving it a smooth corner radius or subtle shadow.
struct MapPinShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let tipY = rect.maxY
        let tipControlOffset: CGFloat = 10

        path.move(to: CGPoint(x: rect.midX, y: tipY))

        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.midY),
            control: CGPoint(x: rect.midX + rect.width / 2, y: tipY - tipControlOffset)
        )

        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.width / 2,
            startAngle: .degrees(0),
            endAngle: .degrees(180),
            clockwise: true
        )

        path.addQuadCurve(
            to: CGPoint(x: rect.midX, y: tipY),
            control: CGPoint(x: rect.midX - rect.width / 2, y: tipY - tipControlOffset)
        )
        
        return path
    }
    
}
