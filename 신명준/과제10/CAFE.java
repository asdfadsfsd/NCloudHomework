package homeWork10.basic;
// 2000, 3000, 4000, 4500
public enum CAFE {
	 AMERICANO(2000){
		 public int totalPrice(int optionOrder, int normalOrder) {
				return optionOrder*2300 + normalOrder*2000;
			}
	 },
	 LATTE(3000){
		 public int totalPrice(int optionOrder, int normalOrder) {
			 return optionOrder*3500 + normalOrder*3000;
			}
	 },
	 MOCHA(4000){
		 public int totalPrice(int optionOrder, int normalOrder) {
			 return optionOrder*5000 + normalOrder*4000;
			}
	 },
	 COLDBRE(4500){
		 public int totalPrice(int optionOrder, int normalOrder) {
			 return optionOrder*4700 + normalOrder*4500;	
		}
	 };
	 
	  private int price;
	  
	
	
	private CAFE(int price) {
		this.price = price;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public abstract int totalPrice(int optionOrder, int normalOrder);
	
	
	public static void solve() {
		int sum=0;
		sum += CAFE.AMERICANO.totalPrice(2, 1);
		sum += CAFE.LATTE.totalPrice(0, 1);
		sum += CAFE. MOCHA.totalPrice(2, 0);
		sum += CAFE.COLDBRE.totalPrice(0, 2);
		System.out.println(sum);
	}
			 
}
