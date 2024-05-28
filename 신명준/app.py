import sys
input = sys.stdin.readline
import copy




if __name__ == '__main__':
   N , M  = map(int ,input().split())
   app_li = list(map(int ,input().split()))
   cost_li = list(map(int ,input().split()))

   ##특정 코스트에서 매모리 최대값
   di =[]
   for i in range(10001):
    di.append(0)

   for i in range(len(cost_li)):
    for j in  reversed(range(cost_li[i],10001)):
      di[j] =max(di[j] , di[j - cost_li[i]] +app_li[i] )
   for i in range(10001):
    if di[i] >= M:
      print(i)
      break