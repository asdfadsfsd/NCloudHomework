package homeWork10.basic;

class Cal <T extends Number>{
	public Cal(){};
	public  double add(T[] arr)
	{
		return Math.round( arr[0].doubleValue() + arr[1].doubleValue()*100)/100;
	}
	public double sub(T[] arr)
	{
		return Math.round( arr[0].doubleValue() + arr[1].doubleValue()*100)/100;
	}
	public double mul(T[] arr)
	{
		return Math.round( arr[0].doubleValue() + arr[1].doubleValue()*100)/100;
	}
	public double div(T[] arr)
	{
		return Math.round( arr[0].doubleValue() + arr[1].doubleValue()*100)/100;
	}
}