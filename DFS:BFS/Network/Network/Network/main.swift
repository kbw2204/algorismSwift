import Foundation


func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var result: Int = 0
    var visited: [Bool] = Array(repeating: false, count: n)
    for i in 0 ..< n {
        if !visited[i] {
            result += 1
            dfs(vertex: i, visited: &visited, computers: computers)
        }
    }
    
    return result
}

func dfs(vertex: Int, visited: inout [Bool], computers: [[Int]]) {
    visited[vertex] = true
    
    for i in 0 ..< visited.count {
        if !visited[i] && computers[vertex][i] == 1 {
            dfs(vertex: i, visited: &visited, computers: computers)
        }
    }
}


print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
