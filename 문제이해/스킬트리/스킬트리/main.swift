//
//  main.swift
//  스킬트리
//
//  Created by 강병우 on 2020/09/26.
//  Copyright © 2020 강병우. All rights reserved.
//
//
func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    let filterSkillList = skill_trees.map{$0.filter{skill.contains($0)}}
    
    return filterSkillList.filter{skill.hasPrefix($0)}.count
}

let skill = "CBD"
let skills = ["BACDE", "CBADF", "AECB", "BDA"]
print(solution(skill, skills))

