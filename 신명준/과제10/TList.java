package homeWork10.basic;

import java.util.List;
import java.util.Map.Entry;

class TList <T>{
	public List<T> li;
	public List<T> li1,li2;
	public  void splitList()
	{
		Entry<List<T>,List<T>> subEn;
		if(this.li.size()%2 ==1)
		{
			int sub_len = this.li.size()/2;
			li1 = li.subList(0, sub_len+1);
			li2 = li.subList(sub_len+1, this.li.size());
		}
		else
		{
			int sub_len = this.li.size()/2;
			li1 = li.subList(0, sub_len);
			li2 = li.subList(sub_len, this.li.size());
		}
		
	}	
}