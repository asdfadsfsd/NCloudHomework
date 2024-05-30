import sys
input = sys.stdin.readline
import copy

MAX =100001


if __name__ == '__main__':
   N, M  = map(int, input().split())
   arr =[]
   dp=[]
   for i in range(101):
    arr.append(i)
    dp.append(MAX)

   for i in range(N+M):
    st,ed = map(int, input().split())
    arr[st] = ed
  
   li = []
   li.append(1)
   dp[1] =0
   while len(li) != 0 :
    cur  = li.pop()
    for i in range(1,7):
     if cur+i <= 100:
      next_wh = arr[cur+i]
      if dp[cur] +1 < dp[next_wh]:
       dp[next_wh] = (dp[cur] +1)
       li.append(next_wh)
   print(dp[100])

    
     

   
     
   

   


