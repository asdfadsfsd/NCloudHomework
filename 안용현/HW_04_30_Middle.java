package hw_04;

import java.util.Arrays;

public class HW_04_30_Middle {
    public static void main(String[] args) {
        int[] arr = {1, 2, 3, 4, 5};
        System.out.println(Arrays.toString(Reverse(arr)));

        char[] input = {'A','c','D','z'};
        System.out.println( Convert(input) );

    }
    public static int[] Reverse(int[] arr){
        int[] rArr = new int[arr.length];
        int num =arr.length - 1 ;
        for(int i = 0; i < arr.length; i++){
            rArr[i] = arr[num-i];
        }
        return rArr;
    }
    public static char[] Convert(char[] a){
        for(int i = 0 ; i < a.length ; i++) {
            if (a[i] == 'z') {
                a[i] = 'A';
            }
            else if (a[i] == 'A') {
                a[i] = 'z';
            }
            else if ('B' <= a[i] && a[i] <= 'Y') {
                a[i] = (char) (a[i] + 31);
            }
            else if ('b' <= a[i] && a[i] <= 'y') {
                a[i] = (char) (a[i] - 31);
            }
        }
        return a;
    }

}
