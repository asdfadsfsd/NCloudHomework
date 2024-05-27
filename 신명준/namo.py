import sys
input = sys.stdin.readline
import copy

ways = [[1,0],[0,1],[-1,0],[0,-1],[1,1],[-1,-1],[1,-1],[-1,1]]

if __name__ == '__main__':
  
    N, M ,K  = map(int, input().split()) ##배열크기 나무수 년도
    treeMap =[]
    roboMap= []
    fildMap =[]  
    for i in range(N):
        treeMap.append([])
        roboMap.append([])
        fildMap.append([])  
        for j in range(N):
            fildMap[i].append(5)
            treeMap[i].append([])  
  
    ##로봇 맵
    for i in range(N):
        roboMap[i] = list(map(int, input().split()))  

    ##나무심기
    for i in range(M):
        x, y, z  = map(int, input().split())  ##위치 ,크기
        treeMap[x-1][y-1].append(z)
   
    for t in range(K):
    
        ##봄
        for i in range(N):
            for j in range(N):
                wh = 0
                dead_sum =0
                ## 양분 빨아먹기
                ## 뒤에 놈이 어리다
                for wh in range(len(treeMap[i][j])):
                    tree = treeMap[i][j][ len(treeMap[i][j])-1-wh]
                    if fildMap[i][j] >= tree:  
                        fildMap[i][j] -= tree  
                        treeMap[i][j][ len(treeMap[i][j])-1-wh] += 1
                    else:
                        dead_sum += int(tree/2)
                        treeMap[i][j][ len(treeMap[i][j])-1-wh] = -1 *tree
                ##시체 빼기 여름, 겨울 거름
                fildMap[i][j] += roboMap[i][j] 
                fildMap[i][j] +=dead_sum 
                treeMap[i][j] = [ val for val in treeMap[i][j] if val > 0 ]
  

        ##가을 
        for i in range(N):
            for j in range(N):
                for tree in treeMap[i][j]:
                    if tree % 5 == 0:
                        for w in range(8):
                            new_i = i+ways[w][0]
                            new_j = j + ways[w][1] 
                            if new_i  >= 0 and new_i  < N   and   new_j >= 0 and  new_j  < N:
                                treeMap[new_i][new_j].append(1)
               

        """
        ##확인용
        for i in range(N):
          for j in range(N):
             print(len(treeMap[i][j]), end=' ')
          print()
        print()
        """

    ## 몇개가 살았난
    count =0
    for i in range(N):
        for j in range(N):
            count += len(treeMap[i][j])
    print(count)
