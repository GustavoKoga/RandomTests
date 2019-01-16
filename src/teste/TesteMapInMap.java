package teste;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class TesteMapInMap {
	
	public static void main(String[] args) {
		
		Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		
		Map<String, Object> objeto = new HashMap<String, Object>();
		
		objeto.put("0", "objeto 1");
		objeto.put("1", "teste");
		objeto.put("2", 15848);
		objeto.put("3", new Date());
		objeto.put("4", true);
		
		map.put("teste1", objeto);
		
		Map<String, Object> objeto2 = new HashMap<String, Object>();
		
		objeto2.put("0", "objeto 2");
		objeto2.put("1", "teste");
		objeto2.put("2", 15848);
		objeto2.put("3", new Date());
		objeto2.put("4", true);
		
		map.put("teste2", objeto2);
		
		System.out.println(map);
		
		Iterator<String> it = map.keySet().iterator();
		
		while (it.hasNext()) {
			Map<String, Object> obj = map.get(it.next());
			
			Iterator<String> objIt = obj.keySet().iterator();
			
			while (objIt.hasNext()) {
				String o = objIt.next();
				System.out.println(o + " - " + obj.get(o));
			}
		}
		
	}

}
