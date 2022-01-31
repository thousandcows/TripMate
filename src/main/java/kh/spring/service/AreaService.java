package kh.spring.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kh.spring.dao.AreaDAO;
import kh.spring.dto.AreaDTO;
import kh.spring.dto.AreaListDTO;
import kh.spring.dto.AreaRcmdDTO;
import kh.spring.dto.AreaReplyDTO;
import kh.spring.dto.SavedDTO;
import kh.spring.statics.Statics;

@Service
public class AreaService {
	
	@Autowired
	public AreaDAO dao;

	public String categorySort(String cat) { //카테고리 출력용
		String result = "";
		switch(cat){
			case "A01": result = "자연"; break;
			case "A02": result = "인문"; break;
			case "A03": result = "레포츠"; break;
			case "A04": result = "쇼핑"; break;
			case "A05": result = "음식"; break;
			case "B02": result = "숙박"; break;
			case "C01": result = "추천코스"; break;
		}
		return result;
	}

	public String contentID(int contenttypeID) { //분류 출력
		String result = "";
		switch(contenttypeID) {
			case 12 : result = "관광지"; break;
			case 14 : result = "문화시설"; break;
			case 15 : result = "행사/공연/축제"; break;
			case 25 : result = "여행코스"; break;
			case 28 : result = "레포츠"; break;
			case 32 : result = "숙박"; break;
			case 38 : result = "쇼핑"; break;
			case 39 : result = "음식점"; break;
		}
		return result;
	}

	public int areaCode(String area) { //지역코드 출력용, 비이용
		int result = 0;
		switch(area) {
			case "서울": result = 1; break;
			case "인천": result = 2; break;
			case "대전": result = 3; break;
			case "대구": result = 4; break;
			case "광주": result = 5; break;
			case "부산": result = 6; break;
			case "울산": result = 7; break;
			case "세종": result = 8; break;
			case "경기": result = 31; break;
			case "강원": result = 32; break;
			case "충북": result = 33; break;
			case "충남": result = 34; break;
			case "경북": result = 35; break;
			case "경남": result = 36; break;
			case "전북": result = 37; break;
			case "전남": result = 38; break;
			case "제주": result = 39; break;
		}
		return result;
	}
	
	public String post(URL url) throws Exception{ //API 연결
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		return sb.toString();
	}

	public AreaDTO detailBuild(int target) throws Exception { //상세정보 출력 url
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=tASWrdaQeX%2FNZMpo1onkA8VC1ELXLdVsWav03zKKEk57adnScsDWhRK1lfKHkfQq3l7g7pRBmaB7UMa2EsWj4A%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
		urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
		urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + target); /*콘텐츠ID*/
		urlBuilder.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*기본정보 조회여부*/
		urlBuilder.append("&" + URLEncoder.encode("firstImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*원본, 썸네일 대표이미지 조회여부*/
		urlBuilder.append("&" + URLEncoder.encode("areacodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*지역코드, 시군구코드 조회여부*/
		urlBuilder.append("&" + URLEncoder.encode("catcodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*대,중,소분류코드 조회여부*/
		urlBuilder.append("&" + URLEncoder.encode("addrinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*주소, 상세주소 조회여부*/
		urlBuilder.append("&" + URLEncoder.encode("overviewYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*콘텐츠 개요 조회여부*/
		urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*Json*/
		String result= post(new URL(urlBuilder.toString()));
		return detail(result);
	}
	
	public AreaDTO detail(String target) throws Exception{ //상세정보 to json
		Gson gson = new Gson();
		gson.fromJson(target, JsonObject.class);
		JsonObject j = (JsonObject) JsonParser.parseString(target);
		JsonObject response = (JsonObject) JsonParser.parseString(j.get("response").toString());
		JsonObject body = (JsonObject) JsonParser.parseString(response.get("body").toString());
		JsonObject items = (JsonObject) JsonParser.parseString(body.get("items").toString());
		JsonObject item = (JsonObject) JsonParser.parseString(items.get("item").toString());
		String name = item.get("title").toString(); //타이틀
		name = name.substring(1,name.length()-1);
		String category = item.get("cat1").toString(); //카테고리
		category = category.substring(1,category.length()-1);
		String cat3 = item.get("cat3").toString();
		cat3 = cat3.substring(1,cat3.length()-1);
		String cat2 = item.get("cat2").toString();
		cat2 = cat2.substring(1,cat2.length()-1);
		String location = "";
		if(item.has("areacode")) {
			location = item.get("areacode").toString(); //지역코드	
		}
		String lo_detail = "";
		if(item.has("addr1")) {
			lo_detail = item.get("addr1").toString(); //주소
			lo_detail = lo_detail.substring(1,lo_detail.length()-1);			
		}
		String tel = "null";
		if(item.has("tel")) {tel = item.get("tel").toString().replace("\"", "");}
		String detail = item.get("overview").toString().replace("\"", ""); //상세설명 형식 수정
		detail = detail.replace("\\", "<br>");
		detail = detail.replace("n", "");
		detail = detail.replace("\"", "");
		
		String homepage = "null";
		if(item.has("homepage")) {
			homepage = item.get("homepage").toString(); //홈페이지	
			homepage = homepage.replace("\"", "");
			homepage = homepage.replace("\\", "");
		}
		String photo = "null"; //이미지
		if(item.has("firstimage")) {
			photo = item.get("firstimage").toString().replace("\"", "");
		}
		AreaDTO dto = new AreaDTO(0, name, category,cat2,cat3, location,lo_detail,tel,detail,homepage,photo);
		return dto;
	}

	public List<AreaRcmdDTO> rcmdBuild(String cat1, String cat2, String cat3) throws Exception{
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=tASWrdaQeX%2FNZMpo1onkA8VC1ELXLdVsWav03zKKEk57adnScsDWhRK1lfKHkfQq3l7g7pRBmaB7UMa2EsWj4A%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + Statics.areaRecommandNo); /*한 페이지 결과 수*/
		urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
		urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
		urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("P", "UTF-8")); /*조회순 정렬*/
		urlBuilder.append("&" + URLEncoder.encode("cat1","UTF-8") + "=" + URLEncoder.encode(cat1, "UTF-8")); /*조회순 정렬*/
		urlBuilder.append("&" + URLEncoder.encode("cat2","UTF-8") + "=" + URLEncoder.encode(cat2, "UTF-8")); /*조회순 정렬*/
		urlBuilder.append("&" + URLEncoder.encode("cat3","UTF-8") + "=" + URLEncoder.encode(cat3, "UTF-8")); /*조회순 정렬*/		
		urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*Json*/
		String target= post(new URL(urlBuilder.toString()));
		return rcmd(target);
	}
	
	public List<AreaRcmdDTO> rcmd(String target) throws Exception{
		List<AreaRcmdDTO> list = new ArrayList<>();
		JsonObject j = (JsonObject) JsonParser.parseString(target);
		JsonObject response = (JsonObject) JsonParser.parseString(j.get("response").toString());
		JsonObject body = (JsonObject) JsonParser.parseString(response.get("body").toString());
		if(body.get("items").isJsonObject()) {
			JsonObject items = (JsonObject) JsonParser.parseString(body.get("items").toString());
			if(JsonParser.parseString(items.get("item").toString()).isJsonArray()){ //단일
				JsonArray item = (JsonArray)JsonParser.parseString(items.get("item").toString());
				for(int i = 0; i< item.size();i++) {
					JsonObject tmp = (JsonObject) item.get(i);
					String contentid = tmp.get("contentid").toString();
					String title = tmp.get("title").toString();
					title = title.substring(1,title.length()-1);
					String firstimage = "";
					if(tmp.has("firstimage")){
						firstimage = tmp.get("firstimage").toString();
						firstimage = firstimage.substring(1,firstimage.length()-1);
					}else{
						firstimage ="null";
					}
					AreaRcmdDTO dto = new AreaRcmdDTO(title,firstimage,contentid);
					list.add(dto);
				}
			}else { //2개 이상
				JsonObject item = (JsonObject)JsonParser.parseString(items.get("item").toString());
				String contentid = item.get("contentid").toString();
				String title = item.get("title").toString();
				title = title.substring(1,title.length()-1);
				String firstimage = "";
				if(item.has("firstimage")){
					firstimage = item.get("firstimage2").toString();
					firstimage = firstimage.substring(1,firstimage.length()-1);
				}else{
					firstimage ="null";
				}
				AreaRcmdDTO dto = new AreaRcmdDTO(title,firstimage,contentid);
				list.add(dto);
			}
		}
		return list;
	}
	
	
	//리스트 빌드
	public List<AreaListDTO> listBuild(int pageNum, int conID, int areaCode) throws Exception{
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=tASWrdaQeX%2FNZMpo1onkA8VC1ELXLdVsWav03zKKEk57adnScsDWhRK1lfKHkfQq3l7g7pRBmaB7UMa2EsWj4A%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + Statics.areaViewNo); /*한 페이지 결과 수*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + pageNum); /*현재페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
		urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
		urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("P", "UTF-8")); /*조회순 정렬*/
		if(conID!=0) {
			urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + conID); /*관광타입(관광지, 숙박 등) ID*/			
		}
		if(areaCode!=0) {
			urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + areaCode); /*지역코드*/			
		}
		urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*Json*/
		String target = post(new URL(urlBuilder.toString()));
		return list(target);
	}
	
	//일반
	public List<AreaListDTO> list(String target) throws Exception{
		List<AreaListDTO> list = new ArrayList<>();
		JsonObject j = (JsonObject) JsonParser.parseString(target);
		JsonObject response = (JsonObject) JsonParser.parseString(j.get("response").toString());
		JsonObject body = (JsonObject) JsonParser.parseString(response.get("body").toString());
		JsonObject items = (JsonObject) JsonParser.parseString(body.get("items").toString());
		JsonArray item = (JsonArray)JsonParser.parseString(items.get("item").toString());
		for(int i = 0; i< item.size();i++) {
			JsonObject tmp = (JsonObject) item.get(i);
			String contentid = tmp.get("contentid").toString();
			String title = tmp.get("title").toString();
			title = title.substring(1,title.length()-1);
			int contenttype = tmp.get("contenttypeid").getAsInt();
			String contenttypeid = contentID(contenttype);
			String addr1 = "null";
			if(tmp.has("addr1")) {
				addr1=	tmp.get("addr1").toString();
				addr1 = addr1.substring(1,addr1.length()-1);
			}
			String cat1 = tmp.get("cat1").toString();
			cat1 = categorySort(cat1.substring(1,cat1.length()-1));
			int areacode = 0;
			if(tmp.has("areacode")) {
				areacode = tmp.get("areacode").getAsInt();				
			}
			String cat3 = tmp.get("cat3").toString();
			cat3 = cat3.substring(1,cat3.length()-1);
			String firstimage = "";
			if(tmp.has("firstimage")){
				firstimage = tmp.get("firstimage").toString();
				firstimage = firstimage.substring(1,firstimage.length()-1);
			}else{
				firstimage ="null";
			}
			int readcount = tmp.get("readcount").getAsInt();
			AreaListDTO dto = new AreaListDTO(title,contentid,contenttypeid,addr1,areacode,cat1,cat3,firstimage,readcount);
			list.add(dto);
		}
		return list;
	}

	//검색 빌드
	public List<AreaListDTO> searchBuild(int pageNum, int conID, int areaCode, String target) throws Exception{
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=tASWrdaQeX%2FNZMpo1onkA8VC1ELXLdVsWav03zKKEk57adnScsDWhRK1lfKHkfQq3l7g7pRBmaB7UMa2EsWj4A%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + Statics.areaViewNo); /*한 페이지 결과 수*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + pageNum); /*현재페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
		urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
		urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("P", "UTF-8")); /*조회순 정렬*/
		if(conID!=0) {
			urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + conID); /*관광타입(관광지, 숙박 등) ID*/			
		}
		if(areaCode!=0) {
			urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + areaCode); /*지역코드*/			
		}
		urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(target, "UTF-8")); /*검색어*/
		urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*Json*/
		String result= post(new URL(urlBuilder.toString()));
		return search(result);
	}
	
	//검색 for Ajax
	public String searchAjax(int pageNum, String target) throws Exception{
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=tASWrdaQeX%2FNZMpo1onkA8VC1ELXLdVsWav03zKKEk57adnScsDWhRK1lfKHkfQq3l7g7pRBmaB7UMa2EsWj4A%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + Statics.areaViewNo); /*한 페이지 결과 수*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + pageNum); /*현재페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
		urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
		urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("P", "UTF-8")); /*조회순 정렬*/
		urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(target, "UTF-8")); /*검색어*/
		urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*Json*/
		String result= post(new URL(urlBuilder.toString()));
		return result;
	}
	//검색
	public List<AreaListDTO> search(String target) throws Exception{
		List<AreaListDTO> list = new ArrayList<>();
		JsonObject j = (JsonObject) JsonParser.parseString(target);
		JsonObject response = (JsonObject) JsonParser.parseString(j.get("response").toString());
		JsonObject body = (JsonObject) JsonParser.parseString(response.get("body").toString());
		if(body.get("items").isJsonObject()) {
			JsonObject items = (JsonObject) JsonParser.parseString(body.get("items").toString());
			System.out.println(items.toString());
			if(JsonParser.parseString(items.get("item").toString()).isJsonArray()){
				JsonArray item = (JsonArray)JsonParser.parseString(items.get("item").toString());
				for(int i = 0; i< item.size();i++) {
					JsonObject tmp = (JsonObject) item.get(i);
					String contentid = tmp.get("contentid").toString();
					String title = tmp.get("title").toString();
					title = title.substring(1,title.length()-1);
					int contenttype = tmp.get("contenttypeid").getAsInt();
					String contenttypeid = contentID(contenttype);
					String addr1 = "null";
					if(tmp.has("addr1")) {
						addr1=	tmp.get("addr1").toString();
					}
					addr1 = addr1.substring(1,addr1.length()-1);
					String cat1 = tmp.get("cat1").toString();
					cat1 = categorySort(cat1.substring(1,cat1.length()-1));
					int areacode = 0;
					if(tmp.has("areacode")) {
						areacode = tmp.get("areacode").getAsInt();						
					}
					String cat3 = tmp.get("cat3").toString();
					cat3 = cat3.substring(1,cat3.length()-1);
					String firstimage = "";
					if(tmp.has("firstimage")){
						firstimage = tmp.get("firstimage").toString();
						firstimage = firstimage.substring(1,firstimage.length()-1);
					}else{
						firstimage ="null";
					}
					int readcount = tmp.get("readcount").getAsInt();
					AreaListDTO dto = new AreaListDTO(title,contentid,contenttypeid,addr1,areacode,cat1,cat3,firstimage,readcount);
					list.add(dto);
				}
			}else {
				JsonObject item = (JsonObject)JsonParser.parseString(items.get("item").toString());
				String contentid = item.get("contentid").toString();
				String title = item.get("title").toString();
				title = title.substring(1,title.length()-1);
				int contenttype = item.get("contenttypeid").getAsInt();
				String contenttypeid = contentID(contenttype);
				String addr1 = "null";
				if(item.has("addr1")) {
					addr1=	item.get("addr1").toString();
				}
				addr1 = addr1.substring(1,addr1.length()-1);
				String cat1 = item.get("cat1").toString();
				cat1 = categorySort(cat1.substring(1,cat1.length()-1));
				int areacode = item.get("areacode").getAsInt();
				String cat3 = item.get("cat3").toString();
				cat3 = cat3.substring(1,cat3.length()-1);
				String firstimage = "";
				if(item.has("firstimage")){
					firstimage = item.get("firstimage").toString();
					firstimage = firstimage.substring(1,firstimage.length()-1);
				}else{
					firstimage ="null";
				}
				int readcount = item.get("readcount").getAsInt();
				AreaListDTO dto = new AreaListDTO(title,contentid,contenttypeid,addr1,areacode,cat1,cat3,firstimage,readcount);
				list.add(dto);
			}
		}
		return list;
	}

	//페이지 빌드
	public int[] pageCountBuild(int pageNum, int conID, int areaCode) throws Exception{
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=tASWrdaQeX%2FNZMpo1onkA8VC1ELXLdVsWav03zKKEk57adnScsDWhRK1lfKHkfQq3l7g7pRBmaB7UMa2EsWj4A%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + Statics.areaViewNo); /*한 페이지 결과 수*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + pageNum); /*현재페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
		urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
		urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("P", "UTF-8")); /*조회순 정렬*/
		if(conID!=0) {
			urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + conID); /*관광타입(관광지, 숙박 등) ID*/			
		}
		if(areaCode!=0) {
			urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + areaCode); /*지역코드*/			
		}
		urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*Json*/
		String target = post(new URL(urlBuilder.toString()));
		return pageCount(target);
	}
	//페이지수 계산
	public int[] pageCount(String target) throws Exception{
		JsonObject j = (JsonObject) JsonParser.parseString(target);
		JsonObject response = (JsonObject) JsonParser.parseString(j.get("response").toString());
		JsonObject body = (JsonObject) JsonParser.parseString(response.get("body").toString());
		int result[] = new int[2]; 
		result[0] = body.get("totalCount").getAsInt()/Statics.areaViewNo;
		if(body.get("totalCount").getAsInt()%Statics.areaViewNo!= 0 ) {result[0]++;}
		result[1] = body.get("pageNo").getAsInt();
		return result;
	}

	//검색 페이지 빌드
	public int[] searchCountBuild(int pageNum, int conID, int areaCode, String target) throws Exception{
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=tASWrdaQeX%2FNZMpo1onkA8VC1ELXLdVsWav03zKKEk57adnScsDWhRK1lfKHkfQq3l7g7pRBmaB7UMa2EsWj4A%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + Statics.areaViewNo); /*한 페이지 결과 수*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + pageNum); /*현재페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
		urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
		urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("P", "UTF-8")); /*조회순 정렬*/
		if(conID!=0) {
			urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + conID); /*관광타입(관광지, 숙박 등) ID*/			
		}
		if(areaCode!=0) {
			urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + areaCode); /*지역코드*/			
		}
		urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(target, "UTF-8")); /*검색어*/
		urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*Json*/
		String result = post(new URL(urlBuilder.toString()));
		return searchCount(result);
	}
	
	//검색 페이지수 계산
	public int[] searchCount(String target) throws Exception{
		JsonObject j = (JsonObject) JsonParser.parseString(target);
		JsonObject response = (JsonObject) JsonParser.parseString(j.get("response").toString());
		JsonObject body = (JsonObject) JsonParser.parseString(response.get("body").toString());
		int result[] = new int[2]; 
		result[0] = body.get("totalCount").getAsInt()/Statics.areaViewNo;
		if(body.get("totalCount").getAsInt()%Statics.areaViewNo!= 0 ) {result[0]++;}
		result[1] = body.get("pageNo").getAsInt();
		return result;
	}

	public List<Integer> paging(int total, int page) {
		if(page%10==0) {page--;}
		int target = page/10*10+1;
		List<Integer> result = new ArrayList<>();
		if(target != 1) {result.add(-1);}
		if(total>target+10) {
			for(int i = 0;i<10;i++) {
				result.add(target++);
				if(i==9 && target<total) {result.add(-2);}
			}
		}else {
			for(;target<total;target++) {
				result.add(target);
			}
		}
		if(result.size()==0) {result.add(1);}
		return result;
	}
	
	
	/*찜관련 부분*/
	//찜확인
	public int saveCheck(SavedDTO dto) {
		return dao.saveCheck(dto);
	}
	
	//찜 저장
	public int saveInsert(SavedDTO dto) {
		return dao.saveInsert(dto);
	}
	
	//찜 취소
	public int saveDelete(SavedDTO dto) {
		return dao.saveDelete(dto);
	}
	
	//평점출력
	public double countRate(int area_seq) {
		return Math.round(dao.countRate(area_seq)*100)/100.0;
	}
	
	
	/*댓글 관련 부분*/
	//댓글 입력
	public void replyInsert(AreaReplyDTO dto) {
		dao.replyInsert(dto);
	}
	
	//댓글 카운트
	public int replyCount(int area_seq) {
		return dao.replyCount(area_seq);
	}
	
	//댓글 출력
	public List<AreaReplyDTO> replyPrint(int start, int end, int area_seq){
		return dao.replyPrint(start, end, area_seq);
	}
	
	//댓글 Json화
	public String replyToJson(List<AreaReplyDTO> list) {
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
	//댓글 삭제
	public void replyDelete(int seq) {
		dao.replyDelete(seq);
	}
	
	//댓글 수정
	public void replyUpdate(AreaReplyDTO dto) {
		dao.replyUpdate(dto);
	}
	
	//사진 값
	public String findPhoto(int seq) {
		return dao.findPhoto(seq);
	}
	
	//사진 업로드
	public String uploadPhoto(MultipartFile picture,HttpSession session) throws IllegalStateException, IOException {
		String result = "";
		if(!picture.isEmpty()) {
			String realPath = session.getServletContext().getRealPath("")+"\\resources\\images";
			File realPathFile = new File(realPath);
			if(!realPathFile.exists()) {realPathFile.mkdir();}
			String oriName= picture.getOriginalFilename(); //사용자가 업로드한 파일의 원본 이름
			String sysName = UUID.randomUUID()+"_"+oriName; //서버쪽에 저장할파일 이름
			picture.transferTo(new File(realPath+"/"+sysName));	
			result = sysName;
		}
		return result;
	}
	
	//사진 변경
	public String updatePhoto(MultipartFile picture,HttpSession session,int seq) throws IllegalStateException, IOException {
		String result = "";
		if(!picture.isEmpty()) {
			String realPath = session.getServletContext().getRealPath("")+"\\resources\\images";
			File realPathFile = new File(realPath);
			if(!realPathFile.exists()) {realPathFile.mkdir();}
			String oriName= picture.getOriginalFilename(); //사용자가 업로드한 파일의 원본 이름
			String sysName = UUID.randomUUID()+"_"+oriName; //서버쪽에 저장할파일 이름
			picture.transferTo(new File(realPath+"/"+sysName));	
			result = sysName;
		}else { //업로드 없을 시
			result = findPhoto(seq);
			if(result==null) {
				result="";
			}
		}
		return result;
	}
	
	//DB 삽입
	public void checkDB(String[] check) {
		for(int i = 0; i<check.length;i++) {
			String[] arr = check[i].split("&");
			int seq = Integer.parseInt(arr[0]);
			AreaDTO dto = new AreaDTO();
			dto.setName(arr[1]);
			dto.setLocation(arr[2]);
			dto.setPhoto(arr[3]);
			if(dao.checkDB(seq) == 0) {
				dao.insertArea(seq,dto);
			}							
		}
	}
}
