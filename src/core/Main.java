//package core;
//
//import java.util.Scanner;
//
//import com.google.gson.JsonElement;
//import com.google.gson.JsonParser;
//
//import util.PapagoNMT;
//
//public class Main {
//
//    public static void main(String[] args) {
//		String text = "", source = PapagoNMT.ENGLISH, target = PapagoNMT.KOREAN;
//		int selected;
//		
//    	Scanner scan = new Scanner(System.in);
//    	System.out.println("< 번역할 한글을 입력하세요 >");
//    	text = scan.nextLine();
//    	
//    	System.out.println("어떤 언어로 번역하시겠습니까?");
//    	System.out.println("1. 영어");
//    	System.out.println("2. 프랑스어");
//    	System.out.println("3. 중국어");
//    	System.out.println("4. 베트남어");
//    	System.out.print("번호 입력: ");
//    	selected = scan.nextInt();
//    	
//    	if(selected == 1) {
//    		target = PapagoNMT.KOREAN;
//    	} else if(selected == 2) {
//    		target = PapagoNMT.FRENCH;
//    	} else if(selected == 3) {
//    		target = PapagoNMT.CHINESE;
//    	} else if(selected == 4) {
//    		target = PapagoNMT.VIETNAMESE;
//    	} else {
//        	System.out.println("입력한 번호가 유효하지 않습니다.");
//        	return;
//    	}
//    	
//    	String translated = PapagoNMT.translate(source, target, text);
//    	
//    	JsonParser parser = new JsonParser();
//    	JsonElement element = parser.parse(translated);
//    	if(element.getAsJsonObject().get("errorMessage") != null) {
//    		System.out.println("번역 오류가 발생했습니다. " +
//    				"[오류 코드: " + element.getAsJsonObject().get("errorCode").getAsString() + "]");
//    	} else if(element.getAsJsonObject().get("message") != null) {
//        	System.out.println("< 번역 결과 >");
//        	System.out.println(element.getAsJsonObject().get("message").getAsJsonObject().get("result")
//        			.getAsJsonObject().get("translatedText").getAsString());
//    	}
//    }
//}