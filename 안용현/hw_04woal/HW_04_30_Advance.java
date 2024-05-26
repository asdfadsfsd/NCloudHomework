package hw_04;

import java.util.Random;
import java.util.Scanner;

public class HW_04_30_Advance {
    public static void main(String[] args) {
        RockScissPaper rsp = new RockScissPaper();
        rsp.start();
    }

    public static class RockScissPaper {

        private Scanner sc = new Scanner(System.in);

        private Random rd = new Random();


        private boolean isExit = false;


        private int gameCnt = 0;

        private int winCnt = 0;

        private int drawCnt = 0;

        private int loseCnt = 0;


        //게임을 시작하는 메소드
        public void start() {
            while (!isExit) {
                System.out.println("가위바위보 시작합니다.");
                System.out.print("0(가위) 1(바위) 2(보) 숫자하나를 입력하세요(3:종료) :");
                int choice = sc.nextInt();
                int com = rd.nextInt(3);

                if(choice == 3) {
                    System.out.println("종료합니다.");
                    break;
                }
                else if(0 <= choice && choice <= 2) {
                    printCom(com);
                    judgeWDL(choice, com);
                }
                else {
                    System.out.println("잘못된 입력입니다.");
                }

                // gameCnt == 3회시 종료
                if(gameCnt == 3){
                    System.out.println("종료합니다.");
                    isExit = true;
                }
            }
            System.out.println(winCnt + " 승, " + loseCnt + " 패, " + drawCnt + " 무");

        }


        //승무패 판단해주는 메소드
        public void judgeWDL(int user, int com) {
            if (user == com){
                System.out.println("비겼습니다.");
                drawCnt++;
            }

            else if(user == 0){
                if(com == 1){
                    System.out.println("컴퓨터가 이겼습니다.");
                    loseCnt++;
                }
                else {
                    System.out.println("사용자가 이겼습니다.");
                    winCnt++;
                }
            }

            else if(user == 1){
                if(com == 2){
                    System.out.println("컴퓨터가 이겼습니다.");
                    loseCnt++;
                }
                else {
                    System.out.println("사용자가 이겼습니다.");
                    winCnt++;
                }
            }

            else if(user == 2){
                if(com == 0){
                    System.out.println("컴퓨터가 이겼습니다.");
                    loseCnt++;
                }
                else {
                    System.out.println("사용자가 이겼습니다.");
                    winCnt++;
                }
            }
            gameCnt++;
        }


        //컴퓨터 가위, 바위, 보 출력해주는 메소드
        public void printCom(int com) {
            if(com == 0) {
                System.out.println("가위");
            }
            else if(com == 1) {
                System.out.println("바위");
            }
            else if(com == 2) {
                System.out.println("보");
            }
        }


    }
}
