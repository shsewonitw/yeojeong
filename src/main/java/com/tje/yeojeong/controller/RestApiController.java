package com.tje.yeojeong.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RestApiController {

	@GetMapping("/apitest")
	@ResponseBody
	public String apitest() throws IOException {
		
		 StringBuilder urlBuilder = new StringBuilder("http://openapi.airport.kr/openapi/service/StatusOfDepartures/getDeparturesCongestion"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=Qw5TLA2GGHz6sqy3oWvemlvpwnBtdyy7Dhv7br6SNfgfglbewBaTw9FUVDDwuyviPTnyZISC6ahQNg2tNTIcGg%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("terno","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*터미널 구분 1: 1터미널 2: 2터미널 */
	        URL url = new URL(urlBuilder.toString());
	        System.out.println(url.toString());
	        
	        
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
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
	        System.out.println(sb.toString());
		return sb.toString();
	}
}
