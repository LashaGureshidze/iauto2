package ge.iauto.server.model;

import java.util.HashMap;
import java.util.Map;

public class SearchData {
	private Map<String, String> map = new HashMap<String, String>();
	
	public void put(String key, String value) {
		map.put(key, value);
	}
	
	public String get(String key) {
		return map.get(key);
	}
	
	public void clear() {
		map.clear();
	}
}
