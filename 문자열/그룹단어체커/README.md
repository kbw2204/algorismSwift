# 그룹 단어 체커 성공분류

![img](chrome-extension://anenheoccfogllpbpcmbbpcbjpogeehe/svg/6.svg) Silver V
[구현](https://solved.ac/problems/tags/implementation)[문자열](https://solved.ac/problems/tags/string)
난이도 제공: solved.ac — [난이도 투표하러 가기](https://solved.ac/contribute/1316)

| 시간 제한 | 메모리 제한 | 제출  | 정답  | 맞은 사람 | 정답 비율 |
| :-------- | :---------- | :---- | :---- | :-------- | :-------- |
| 2 초      | 128 MB      | 33032 | 16745 | 14593     | 52.045%   |

## 문제

그룹 단어란 단어에 존재하는 모든 문자에 대해서, 각 문자가 연속해서 나타나는 경우만을 말한다. 예를 들면, ccazzzzbb는 c, a, z, b가 모두 연속해서 나타나고, kin도 k, i, n이 연속해서 나타나기 때문에 그룹 단어이지만, aabbbccb는 b가 떨어져서 나타나기 때문에 그룹 단어가 아니다.

단어 N개를 입력으로 받아 그룹 단어의 개수를 출력하는 프로그램을 작성하시오.

## 입력

첫째 줄에 단어의 개수 N이 들어온다. N은 100보다 작거나 같은 자연수이다. 둘째 줄부터 N개의 줄에 단어가 들어온다. 단어는 알파벳 소문자로만 되어있고 중복되지 않으며, 길이는 최대 100이다.

## 출력

첫째 줄에 그룹 단어의 개수를 출력한다.

## 예제 입력 1 복사

```
3
happy
new
year
```

## 예제 출력 1 복사

```
3
```

## 예제 입력 2 복사

```
4
aba
abab
abcabc
a
```

## 예제 출력 2 복사

```
1
```

## 출처

- 문제를 번역한 사람: [baekjoon](https://www.acmicpc.net/user/baekjoon)
- 데이터를 추가한 사람: [jh05013](https://www.acmicpc.net/user/jh05013)
- 문제의 오타를 찾은 사람: [joonas](https://www.acmicpc.net/user/joonas)

## 알고리즘 분류

- [문자열 처리](https://www.acmicpc.net/problem/tag/문자열 처리)
- [탐색](https://www.acmicpc.net/problem/tag/탐색)