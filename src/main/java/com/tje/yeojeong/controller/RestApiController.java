package com.tje.yeojeong.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.tje.yeojeong.api.AirportInfo;
import com.tje.yeojeong.api.AirportParking;
@Controller
public class RestApiController {

	@GetMapping("/airportInfo")

	public String apitest(Model model) throws IOException {
		// 1 터미널 혼잡도
		 StringBuilder urlBuilder = new StringBuilder("http://openapi.airport.kr/openapi/service/");
		 	urlBuilder.append(URLEncoder.encode("StatusOfDepartures","UTF-8") + "/" + URLEncoder.encode("getDeparturesCongestion","UTF-8")); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+ URLEncoder.encode("Qw5TLA2GGHz6sqy3oWvemlvpwnBtdyy7Dhv7br6SNfgfglbewBaTw9FUVDDwuyviPTnyZISC6ahQNg2tNTIcGg","UTF-8")+"%"+URLEncoder.encode("3D", "UTF-8")+"%"+URLEncoder.encode("3D", "UTF-8")); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("terno","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*터미널 구분 1: 1터미널 2: 2터미널 */
	        URL url = new URL(urlBuilder.toString());
	        System.out.println(url.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        conn.setRequestProperty("Accept", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        
	        String result = sb.toString();
	        
	        // 받아온 공공데이터 파싱
	        /*
	           areadiv - 지역구분
	           cgtdt - 혼잡일자 ( YYYYMMDD )
	           cgthm - 혼잡일시 ( HHMM )
	           gate1 - T1 2번 / T2 1번 출국장 혼잡도
	           gate2 - T1 3번 / T2 2번 출국장 혼잡도
	           gate3 - T1 4번 출국장혼잡도
	           gate4 - T1 5번 출국장 혼잡도
	           1-원활, 2-보통, 3-혼잡, 4-매우혼잡, 5-종료
	           
	           gateinfo1 - T1 2번 / T2 1번 출국장대기인수
        	   gateinfo2 - T1 3번 / T2 2번 출국장대기인수
        	   gateinfo3 - T1 4번  출국장대기인수
        	   gateinfo4 - T1 5번  출국장대기인수
        	   terno - 터미널구분
	        */
	        JsonObject jsonObject = new JsonParser().parse(result).getAsJsonObject().getAsJsonObject("response").getAsJsonObject("body").getAsJsonObject("items").getAsJsonObject("item");
	        String cgtdt = jsonObject.get("cgtdt").toString();
	        String cgthm = jsonObject.get("cgthm").toString();
	        String gate1 = jsonObject.get("gate1").toString();
	        String gate2 = jsonObject.get("gate2").toString();
	        String gate3 = jsonObject.get("gate3").toString();
	        String gate4 = jsonObject.get("gate4").toString();
	        String gateinfo1 = jsonObject.get("gateinfo1").toString();
	        String gateinfo2 = jsonObject.get("gateinfo2").toString();
	        String gateinfo3 = jsonObject.get("gateinfo3").toString();
	        String gateinfo4 = jsonObject.get("gateinfo4").toString();
	        
	        
	        
	        AirportInfo info = new AirportInfo(cgtdt, cgthm, gate1, gate2, gate3, gate4, gateinfo1, gateinfo2, gateinfo3, gateinfo4); 
	        model.addAttribute("airportInfo",info);

	        
	        
	        // 2 터미널 혼잡도 
	        urlBuilder = new StringBuilder("http://openapi.airport.kr/openapi/service/");
		 	urlBuilder.append(URLEncoder.encode("StatusOfDepartures","UTF-8") + "/" + URLEncoder.encode("getDeparturesCongestion","UTF-8")); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+ URLEncoder.encode("Qw5TLA2GGHz6sqy3oWvemlvpwnBtdyy7Dhv7br6SNfgfglbewBaTw9FUVDDwuyviPTnyZISC6ahQNg2tNTIcGg","UTF-8")+"%"+URLEncoder.encode("3D", "UTF-8")+"%"+URLEncoder.encode("3D", "UTF-8")); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("terno","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*터미널 구분 1: 1터미널 2: 2터미널 */
	        url = new URL(urlBuilder.toString());
	        System.out.println(url.toString());
	        conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        conn.setRequestProperty("Accept", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        sb = new StringBuilder();
	        
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        
	        result = sb.toString();
	        
	        // 받아온 공공데이터 파싱
	        /*
	           areadiv - 지역구분
	           cgtdt - 혼잡일자 ( YYYYMMDD )
	           cgthm - 혼잡일시 ( HHMM )
	           gate1 - T1 2번 / T2 1번 출국장 혼잡도
	           gate2 - T1 3번 / T2 2번 출국장 혼잡도
	           gate3 - T1 4번 출국장혼잡도
	           gate4 - T1 5번 출국장 혼잡도
	           1-원활, 2-보통, 3-혼잡, 4-매우혼잡, 5-종료
	           
	           gateinfo1 - T1 2번 / T2 1번 출국장대기인수
        	   gateinfo2 - T1 3번 / T2 2번 출국장대기인수
        	   gateinfo3 - T1 4번  출국장대기인수
        	   gateinfo4 - T1 5번  출국장대기인수
        	   terno - 터미널구분
	        */
	        jsonObject = new JsonParser().parse(result).getAsJsonObject().getAsJsonObject("response").getAsJsonObject("body").getAsJsonObject("items").getAsJsonObject("item");
	        String cgtdt_2 = jsonObject.get("cgtdt").toString();
	        String cgthm_2 = jsonObject.get("cgthm").toString();
	        String gate1_2 = jsonObject.get("gate1").toString();
	        String gate2_2 = jsonObject.get("gate2").toString();
	        
	        String gateinfo1_2 = jsonObject.get("gateinfo1").toString();
	        String gateinfo2_2 = jsonObject.get("gateinfo2").toString();
	        
	        
	        
	  
	        
	        
	        AirportInfo info2 = new AirportInfo(cgtdt_2, cgthm_2, gate1_2, gate2_2, gateinfo1_2, gateinfo2_2); 
	        model.addAttribute("airportInfo2",info2);
	        
	        
	        // 1, 2 터미널 주차장 현황  
	        urlBuilder = new StringBuilder("http://openapi.airport.kr/openapi/service/");
		 	urlBuilder.append(URLEncoder.encode("StatusOfParking","UTF-8") + "/" + URLEncoder.encode("getTrackingParking","UTF-8")); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+ URLEncoder.encode("Qw5TLA2GGHz6sqy3oWvemlvpwnBtdyy7Dhv7br6SNfgfglbewBaTw9FUVDDwuyviPTnyZISC6ahQNg2tNTIcGg","UTF-8")+"%"+URLEncoder.encode("3D", "UTF-8")+"%"+URLEncoder.encode("3D", "UTF-8")); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); /*한 페이지 결과 수*/
	        url = new URL(urlBuilder.toString());
	        System.out.println(url.toString());
	        conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        conn.setRequestProperty("Accept", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        sb = new StringBuilder();
	        
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        
	        result = sb.toString();
	        System.out.println("주차 현황: "+result);
	        // 받아온 공공데이터 파싱
	        /*
	           
	        */
	        
	        
	       
	        JsonArray jsonArray = new JsonParser().parse(result).getAsJsonObject().getAsJsonObject("response").getAsJsonObject("body").getAsJsonObject("items").getAsJsonArray("item");
	        
	        for(int i = 0 ; i < 13 ; i++) {
	        	String floor = jsonArray.get(i).getAsJsonObject().get("floor").toString();
		        String parking = jsonArray.get(i).getAsJsonObject().get("parking").toString();
		        String parkingarea = jsonArray.get(i).getAsJsonObject().get("parkingarea").toString();
			AirportParking airportParking = new AirportParking(floor, parking, parkingarea);
	        	
	        	model.addAttribute("airportParking"+i,airportParking);
	        }
	        
	        

	        return "form/airportInfo";
	}
}