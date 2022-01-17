package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.TourBoardDAO;
import kh.spring.dto.TourBoardDTO;
import kh.spring.statics.Statics;

@Service
public class TourBoardService {

	@Autowired
	public TourBoardDAO dao;
	
	@Autowired
	public TourBoardService bservice;
	
	public List<TourBoardDTO> selectAll(int start, int end) {
		return dao.selectAll(start, end);
	}
	
	public int writeProc(TourBoardDTO dto) {
		
		return dao.insert(dto);
	}
	
	public TourBoardDTO selectBySeq(int seq) {
		return dao.selectBySeq(seq);
	}
	
	public int addViewCount(int seq) {
		return dao.addViewCount(seq);
	}
	
	public int modify(int seq, String title, String contents, String category) {
		return dao.modify(seq, title, contents, category);
	}
	
	public int delete(int seq) {
		return dao.delete(seq);
	}	
	
	public int getPageTotalCount() throws Exception{

		int recordTotalCount = dao.getRecordCount();

		int pageTotalCount = 0;

		if(recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
		}else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;	
	}
	
	public String getPageNavi(int currentPage) throws Exception{
		
		int recordTotalCount = dao.getRecordCount(); 

		int pageTotalCount = 0;
		if(recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
		}else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		
		int startNavi = (currentPage-1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;
		
		if(startNavi == 1) {
			needPrev = false;
		}

		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		
		String pageNavi = "";
		
		if(needPrev) {
			pageNavi += "<a href='/tourboard/list?cpage="+(startNavi-1)+"'><</a> ";
		}
		
		for(int i = startNavi ; i <= endNavi; i++) {
			pageNavi += "<a href='/tourboard/list?cpage="+i+"'>" + i + "</a> ";
		}
		
		if(needNext) {
			pageNavi += "<a href='/tourboard/list?cpage="+(endNavi+1)+"'>></a>";
		}

		return pageNavi;		
	}	
	
}
