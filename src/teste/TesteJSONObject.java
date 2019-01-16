package teste;

import org.json.JSONObject;

public class TesteJSONObject {
	
	public static void main(String[] args) {
		String str = "{msg:1}";

		String lalal = "lalal";
		JSONObject json = new JSONObject(str);
		System.out.println(json);
		
		try {
			JSONObject lalalJSON = new JSONObject(lalal);
			System.out.println(lalalJSON);
			
		} catch (Exception e) {
			System.out.println("lala failed");
		}
	}
	
//		JSONObject json = new JSONObject();
//		System.out.println(json.toString());

}
