//
//  MapPinShape.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 28/05/25.
//


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