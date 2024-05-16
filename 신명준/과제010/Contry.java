package homeWork10.basic;



enum Contry{
	 KOR("한국","불고기"), CHI("중국","짜장면"), JAP("일본","초밥"), USA("미국","햄버거");
	 private String name;
	 private String food;
	 
	 Contry(String name,String food){this.name= name; this.food= food;}
	 
	 public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public void notifyFood(String country)
	 {
		 Contry m =  Contry.valueOf(country);
	   	 System.out.println("%s의 대표음식은 %s입니다.".formatted(country,  m.getFood()) );
	 }
	 
	 
}