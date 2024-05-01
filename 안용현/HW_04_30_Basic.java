package hw_04;

import java.util.Scanner;

public class HW_04_30_Basic {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("1. 숫자 입력: ");
        int input = sc.nextInt();
        System.out.println(add(input));

        System.out.println("2. 문자열 두 개 입력: ");
        System.out.println( ConcatString(sc.next(), sc.next()) );

        System.out.println("3. 문자열 두 개 정수 한 개 입력: ");
        System.out.println( ConcatString(sc.next(), sc.next(), sc.nextInt()) );

        System.out.print("4. 배열크기 입력: ");
        int[] arr = new int[sc.nextInt()];
        System.out.println("4. 정수형 배열값 입력: ");
        for (int i = 0; i < arr.length; i++){
            arr[i] = sc.nextInt();
        }
        Reverse(arr);
    }

    // basic-1
    public static int add(int a){
        int sum = 0;
        for(int i = 1; i <= a; i++){
            sum += i;
        }
        return sum;
    }

    // basic-2,3
    public static String ConcatString(String str1, String str2){
        return str1 + str2;
    }
    public static String ConcatString(String str1, String str2, int a){
        return str1 + str2 + a;
    }

    // basic-4
    public static void Reverse(int[] arr){
        for(int i = arr.length - 1; i >= 0; i--){
            System.out.print(arr[i]);
        }
    }

}
