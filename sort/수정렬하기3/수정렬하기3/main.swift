//
//  main.swift
//  수정렬하기3
//
//  Created by 강병우 on 2020/07/11.
//  Copyright © 2020 강병우. All rights reserved.
//

let N = Int(readLine()!)!
var arr = [Int](repeating: 0, count: 10001)

for _ in 0 ..< N {
  let num = Int(readLine()!)!
  arr[num] = arr[num] + 1
}

for i in 1 ..< arr.count {
    if arr[i] > 0 {
        for _ in 0 ..< arr[i] {
              print(i)
        }
    }
}

// C언어 풀이
/*
 #include <stdio.h>

 int main(void) {
     int number[10001] = {0};
     int n;
     scanf("%d", &n);
     for(int i = 1; i<=n; i++) {
         int num;
         scanf("%d", &num);
         number[num]++;
     }
     for(int cnt = 1; cnt<=10000; cnt++) {
         for(int j=0;j<number[cnt];j++) {
             printf("%d\n", cnt);
         }
     }
 }
*/
