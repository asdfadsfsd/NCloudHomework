package homework3;

public class BasicRect {
	public int width ;
	public int height;
	
	public BasicRect()
	{
		
	}
	
	public BasicRect(int width, int height) {
		this.width = width;
		this.height = height;
	}
	
	public int getArea()
	{
		return width*height;
	}
	
	public int getRound()
	{
		return 2*(width+height);
	}
	
}
