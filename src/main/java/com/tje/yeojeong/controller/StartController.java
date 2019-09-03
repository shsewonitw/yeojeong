package com.tje.yeojeong.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.stereotype.Controller;

import com.tje.yeojeong.model.Travel_end;
import com.tje.yeojeong.model.Travel_regist;
import com.tje.yeojeong.service.TravelEndInsertService;
import com.tje.yeojeong.service.TravelRegistDeleteService;
import com.tje.yeojeong.service.TravelRegistSelectService;



@Controller
public class StartController{

	@Autowired
	private TravelRegistSelectService trsService;
	@Autowired
	private TravelEndInsertService teiService;
	@Autowired
	private TravelRegistDeleteService trdService;
	@PostConstruct
	private void init() {
		
		new Thread() {
			@SuppressWarnings("deprecation")
			public void run() {
				while(true) {
					try {
						System.out.println("DB trans 쓰레드 실행중");
						// 1시간 단위로 실행
						Thread.sleep(1000 * 60 * 60);
						
						Date date = new Date();
						date.setDate(date.getDate()-1);
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						String target_date = sdf.format(date);
						
						List<Travel_regist> travel_registList = null;
						travel_registList = (List<Travel_regist>)trsService.service();
						
						
						if(travel_registList != null) {
							for(Travel_regist travel_regist : travel_registList) {
								Date end_date = travel_regist.getEnd_date();
								String strEnd_date = sdf.format(end_date);
								// System.out.println(target_date+", "+strEnd_date+", "+target_date.equals(strEnd_date) );
								
								// 등록된 여행이 지난 여행이 되는 순간
								if( target_date.equals(strEnd_date) ) {
									Travel_end travel_end = new Travel_end(travel_regist.getTravel_id(), travel_regist.getMember_id(), travel_regist.getHelp_tel(), travel_regist.getStart_date(), travel_regist.getEnd_date(), travel_regist.getCountry(), travel_regist.getCity());
									teiService.service(travel_end);
									trdService.service(travel_regist);
									System.out.println("등록, 삭제 완료");
								}
							}
						}
						
					} catch (Exception e) {
						
					}
				}
			}
		}.start();
		
	}
}
