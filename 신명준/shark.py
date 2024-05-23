import sys; input = sys.stdin.readline
from itertools import combinations

ways =[[0,0],[-1,0],[1,0],[0,1],[0,-1]]

class SharK:
 def __init__(self,x_wh ,y_wh , speed , way_flag , weight):
   self.x_wh = x_wh
   self.y_wh = y_wh
   self.speed = speed
   self.way =way_flag
   self.weight = weight
   self.is_move = False



if __name__ == '__main__':
  sharkMap =[]
  x,y,shark_num = map(int, input().split())
  ##배열 만들기
  for x_size in range(x):
   m =[]
   sharkMap.append(m)
   for y_size in  range(y):
     m=[]
     sharkMap[x_size].append(m)
     
 
  ## 상어 만들고 넣기
  for i in range(shark_num):
    x_wh,y_wh,speed,way,weight = map(int, input().split())
    sharkMap[x_wh-1][y_wh-1].append(SharK(x_wh-1,y_wh-1,speed,way,weight))
  
  for x_wh in range(x):
      for y_wh in range(y):
        print(len(sharkMap[x_wh][y_wh]) ,end =' ')
      print()
  sum =0
  ## 문제 풀기

  for curMenWh in range(y):
    
    ##상어 확인하고 잡아먹기
    for x_wh in range(x):
     if len(sharkMap[x_wh][curMenWh]) != 0:
       curShark = sharkMap[x_wh][curMenWh][0] 
       sum += curShark.weight
       sharkMap[x_wh][curMenWh].clear()
       break
    print(sum)
    
    ##확인용
    
    for x_wh in range(x):
      for y_wh in range(y):
        print(len(sharkMap[x_wh][y_wh]) ,end =' ')
      print()

    ## 상어 움직이기
    for x_wh in range(x):
      for y_wh in range(y):

        if len(sharkMap[x_wh][y_wh]) != 0 and  sharkMap[x_wh][y_wh][0].is_move == False:
          
          ##움직일 상어뺴기
          cur_shark = sharkMap[x_wh][y_wh][0]
          cur_shark.is_move = True
          sharkMap[x_wh][y_wh].pop(0)
          ## 위치 처리
          for i in range(cur_shark.speed):
            ##충돌 관리
            if cur_shark.way ==1 and (cur_shark.x_wh + ways[cur_shark.way][0]) == -1 :
             cur_shark.way =2
            elif cur_shark.way ==2 and (cur_shark.x_wh + ways[cur_shark.way][0]) == x :
             cur_shark.way =1
            elif cur_shark.way ==3 and (cur_shark.y_wh + ways[cur_shark.way][1]) == y:
             cur_shark.way =4
            elif cur_shark.way ==4 and (cur_shark.y_wh + ways[cur_shark.way][1]) == -1:
             cur_shark.way =3

            cur_shark.x_wh += ways[cur_shark.way][0] 
            cur_shark.y_wh += ways[cur_shark.way][1]

          ## 상어넣기
          sharkMap[cur_shark.x_wh][cur_shark.y_wh].append(cur_shark)
    
    
        
    ##상어끼리 잡아 먹기
    for x_wh in range(x):
      for y_wh in range(y):
        if len(sharkMap[x_wh][y_wh]) >= 1:
         best_weight =0
         best_shark = None
         ##무개 비교
         for shark in sharkMap[x_wh][y_wh]:
           if best_weight < shark.weight:
            best_weight = weight
            best_shark = shark
         ##제일 큰상어가 다잡아먹는다
         sharkMap[x_wh][y_wh].clear()
         best_shark.is_move = False 
         sharkMap[x_wh][y_wh].append(best_shark)
         print(best_shark.way," ",best_shark.speed)

  ##낚시왕이 있는 장소로 올수 있나 확인  
    
    

   
          
  print(sum) ## 출력

    