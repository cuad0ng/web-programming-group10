package project.model;

import java.io.Serializable;
import java.util.ArrayList;

@SuppressWarnings("serial")
public class Cart implements Serializable{
	private ArrayList<LineItem> items;

	public Cart() {
        items = new ArrayList<LineItem>();
    }

    public ArrayList<LineItem> getItems() {
        return items;
    }

    public int getCount() {
        return items.size();
    }
    


}
