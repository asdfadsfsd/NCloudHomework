import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        // 여기에 코드를 작성해주세요.
        Scanner sc = new Scanner(System.in);
        
        int[] arr = new int[10];
        int sum = 0;
        int len = 0;

        for(int i = 0; i < 10; i++){
            arr[i] = sc.nextInt();

            if(arr[i] >= 250)
                break;

            sum += arr[i];
            len = i;
        }

        System.out.printf("%d %.1f", sum, sum/(double)(len + 1));

    }
}