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

	public PlanDTO callPlan(int seq) {
		return dao.callPlan(seq);
	}
	
	public List<Integer> listCount(int mem_seq,int page) {
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
	
	public List<PlanDTO> listing(int seq,int page){
		int startNum = (page*Statics.RECORD_PLAN)-(Statics.RECORD_PLAN-1);
		int endNum = page*Statics.RECORD_PLAN;
		return dao.listing(seq,startNum,endNum);
	}
	

	public int chooseTheme(PlanDTO dto) {
		int result = dao.createTheme(dto);
		return result;
	}
	
	public void changeTheme(PlanDTO dto) {
		dao.changeTheme(dto);
	}
	
	public void saveList(String[] check,int seq) {
		for(int i =0;i<check.length;i++) {
			String[] split = check[i].split("&");
			int target = Integer.parseInt(split[0]);
			dao.saveList(target,seq);
		}
	}
	
	public List<AreaDTO> detailPlanList(int seq,String date){
		List<DetailPlanDTO> areaCode = dao.detailPlanSort(seq,date);
		List<AreaDTO> list = new ArrayList<>(); 
		for(int i = 0; i<areaCode.size();i++) {
			AreaDTO tmp = dao.planListPrint(areaCode.get(i).getArea_seq());
			tmp.setSeq(areaCode.get(i).getSeq());
			list.add(tmp);
		}
		return list;
	}
	
	public String detailToAjax(List<AreaDTO> list) {
		Gson gson = new Gson();
		String result = gson.toJson(list);
		return result;		
	}
	
	public List<String> calDate(String start,String end) throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		Date startDate = sdf.parse(start);
		Date endDate = sdf.parse(end);
		List<String> list = new ArrayList<>();
		Date currentDate = startDate;
		//시작날짜와 끝 날짜를 비교해, 시작날짜가 작거나 같은 경우 출력
		Calendar c = Calendar.getInstance();
		while (currentDate.compareTo(endDate) <= 0) {
			list.add(sdf.format(currentDate));
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();
		}
		return list;
	}
	
	public PlanDTO getDetail(int seq) {
		return dao.getDetail(seq);
	}
	
	
	public void sortDate(int[] target,int seq) {
		int[] tmp = target.clone();
		Arrays.sort(tmp);

		int nowN=0;
		int changeN=0;
		for(int i=0; i<target.length;i++) {
			if(tmp[i] == seq) {
				nowN = i;
			}
			if(target[i] == seq) {
				changeN = i;
			}
		}
		System.out.println(nowN+ " : " + target.length + " : "+ tmp.length);
		for(int i = 0; i<target.length;i++) {
			if(tmp[i] != target[i]) {
				if(nowN>changeN) {
					if(nowN == i) {
						break;
					}
					dao.sortDate(target[nowN],target[i]);
					
				}else if(nowN<changeN) {
					if(changeN == i) {
						break;
					}
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
