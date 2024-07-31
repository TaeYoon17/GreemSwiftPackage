//
//  File.swift
//  
//
//  Created by Greem on 7/31/24.
//

import Foundation
public extension Int{
    /// 1시 32분 23초와 같은 형식으로 초를 반환
    func convertTo시분초()->String{
        if self < 60{
            "\(self)초"
        }else if self < 3600{
            "\(self / 60)분 \(self % 60)초"
        }else{
            "\(self / 3600)시 \((self / 60) % 60)분 \(self % 60)초"
        }
    }
    
}
