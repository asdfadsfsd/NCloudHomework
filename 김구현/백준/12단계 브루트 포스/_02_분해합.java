import java.util.Scanner;

public class _02_분해합 {

    public static void main(String[] args) {
            Scanner scanner = new Scanner(System.in);
            int number = scanner.nextInt();
            int result = 0;
            for(int i =1; i< number; i++){
                int temp = i;
                int sum = i;
                while(temp != 0){
                    sum += temp % 10;
                    temp /= 10;
                }
                if(sum == number){
                    result = i;
                    break;
                }
            }
            System.out.println(result);
            scanner.close();

    }
}

