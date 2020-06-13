let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
print(arr.first! - arr.last!)
