let input = readLine()!.split(separator: " ").map{Double(String($0))!}
print(input.first! / input.last!)
