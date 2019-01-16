package teste;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import com.google.gson.Gson;

import teste.model.Item;

public class TesteGson {

	// public static void main(String[] args) {
	// List<Item> list = new ArrayList<Item>();
	// Gson gson = new Gson();
	// gson.toJson(list);
	//
	// System.out.println(gson);
	// }

//	public static void main(String[] args) {
//		System.out.println("Java2Json");
//		Item item = new Item();
//		Gson gson = new Gson();
//
//		// converte objetos Java para JSON e retorna JSON como String
//		String json = gson.toJson(item);
//
//		try {
//			// Escreve Json convertido em arquivo chamado "file.json"
//			FileWriter writer = new FileWriter("/tmp/file.json");
//			writer.write(json);
//			writer.close();
//
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//		System.out.println(json);
//
//	}
//
	public static void main(String[] args) {
		System.out.println("Json2Java");

		Gson gson = new Gson();

		try {

			BufferedReader br = new BufferedReader(new FileReader("/tmp/file.json"));

			// Converte String JSON para objeto Java
			Item obj = gson.fromJson(br, Item.class);

			System.out.println(obj.getId());

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
