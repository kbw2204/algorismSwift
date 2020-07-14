//
//  main.swift
//  상수
//
//  Created by 강병우 on 2020/07/14.
//  Copyright © 2020 강병우. All rights reserved.
//

//import Foundation
print(readLine()!.split(separator: " ").map{Int(String($0.reversed()))!}.max()!)
