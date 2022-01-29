package kh.spring.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import kh.spring.dao.PlanDAO;
import kh.spring.dto.AreaDTO;
import kh.spring.dto.DetailPlanDTO;
import kh.spring.dto.PlanDTO;
import kh.spring.statics.Statics;

@Service
public class PlanService {

	@Autowired
	public PlanDAO dao;

	public PlanDTO callPlan(int seq) { // 수정 활용
		return dao.callPlan(seq);
	}
	
	public List<Integer> listCount(int mem_seq,int page) { //메인페이지 리스팅
		int total = dao.listCount(mem_seq);
		int totalPage = 0;
		if(total%Statics.RECORD_PLAN==0) {totalPage = (total/Statics.RECORD_PLAN);
		}else {totalPage = (total/Statics.RECORD_PLAN)+1;}
		int startNavi = (page-1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;         
		boolean needPrev = true; 
		boolean needNext = true; 
		if(startNavi == 1) {needPrev = false;}
		if(endNavi >= totalPage) {needNext = false;}
		if(endNavi > totalPage) {endNavi = totalPage;}

		List<Integer> pageNavi = new ArrayList<>();
		if(needPrev) {pageNavi.add(startNavi-2) ;}
		for(int i = startNavi; i<=endNavi; i++) {
			pageNavi.add(i);
		}
		if(needNext) { pageNavi.add(endNavi+1);}
		return pageNavi;

	}
	
	public List<PlanDTO> listing(int seq,int page){ //시작,끝 번호 확인 리스팅
		int startNum = (page*Statics.RECORD_PLAN)-(Statics.RECORD_PLAN-1);
		int endNum = page*Statics.RECORD_PLAN;
		return dao.listing(seq,startNum,endNum);
	}
	

	public int chooseTheme(PlanDTO dto) { //계획 신규 생성
		int result = dao.createTheme(dto);
		return result;
	}
	
	public void changeTheme(PlanDTO dto) { //계획일 변경
		dao.changeTheme(dto);
	}
	
	public void saveList(String[] check,int seq) { //DB Area에 저장
		for(int i =0;i<check.length;i++) {
			String[] split = check[i].split("&");
			int target = Integer.parseInt(split[0]);
			dao.saveList(target,seq);
		}
	}
	
	public List<AreaDTO> detailPlanList(int seq,String date){ //일자별 계획 출력
		List<DetailPlanDTO> areaCode = dao.detailPlanSort(seq,date);
		List<AreaDTO> list = new ArrayList<>(); 
		for(int i = 0; i<areaCode.size();i++) {
			AreaDTO tmp = dao.planListPrint(areaCode.get(i).getArea_seq());
			tmp.setSeq(areaCode.get(i).getSeq());
			list.add(tmp);
		}
		return list;
	}
	
	public String detailToAjax(List<AreaDTO> list) { //Ajax 변경
		Gson gson = new Gson();
		String result = gson.toJson(list);
		return result;		
	}
	
	public List<String> calDate(String start,String end) throws Exception{ //날짜 계산
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		Date startDate = sdf.parse(start);
		Date endDate = sdf.parse(end);
		List<String> list = new ArrayList<>();
		Date currentDate = startDate;
		Calendar c = Calendar.getInstance();
		while (currentDate.compareTo(endDate) <= 0) {
			list.add(sdf.format(currentDate));
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();
		}
		return list;
	}
	
	public PlanDTO getDetail(int seq) { //상세페이지 접근
		return dao.getDetail(seq);
	}
	
	
	public void sortDate(int[] target,int seq) { //정렬
		int[] tmp = target.clone();
		Arrays.sort(tmp);
		int nowN=0;
		int changeN=0;
		for(int i=0; i<target.length;i++) {
			if(tmp[i] == seq) {nowN = i;}
			if(target[i] == seq) {changeN = i;}
		}
		for(int i = 0; i<target.length;i++) {
			if(tmp[i] != target[i]) {
				if(nowN>changeN) {
					if(nowN == i) {break;}
					dao.sortDate(target[nowN],target[i]);
				}else if(nowN<changeN) {
					if(changeN == i) {break;}
					dao.sortDate(target[i], target[i+1]);
				}
			}
		}
	}
	
	public void sortDatePlan(int seq, String day) {
		dao.sortDatePlan(seq,day);
	}
	
	public void deleteDatePlan(int seq) {
		dao.deleteDatePlan(seq);
	}
	
	public void insertMemo(int seq, String memo) {
		dao.insertMemo(seq,memo);
	}
	
	public void delete(int seq) {
		dao.deletePlan(seq);
	}
	
}
