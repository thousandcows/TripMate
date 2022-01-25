package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.TourBoardDAO;
import kh.spring.dao.TourReplyDAO;
import kh.spring.dto.NoticeDTO;
import kh.spring.dto.TourBoardDTO;
import kh.spring.dto.TourBoardLikeDTO;
import kh.spring.statics.Statics;

@Service
public class TourBoardService {

	@Autowired
	public TourBoardDAO bdao;
	
	@Autowired
	public TourReplyDAO rdao;
	
	@Autowired
	public TourBoardService bservice;
	
	public List<TourBoardDTO> selectAll(int start, int end, String searchOption, String searchText) throws Exception{
		
		return bdao.selectAll(start, end, searchOption, searchText);
	}
	
	public List<NoticeDTO> ntselectAll(){
		
		return bdao.ntselectAll();
	}
	
	public int writeProc(TourBoardDTO bdto) throws Exception{
		
		return bdao.insert(bdto);
	}
	
	public TourBoardDTO selectBySeq(int seq) {
		
		return bdao.selectBySeq(seq);
	}
	
	public NoticeDTO selectByNtSeq(int seq) {
		
		return bdao.selectByNtSeq(seq);
	}
	
	public int addViewCount(int seq) {
		
		return bdao.addViewCount(seq);
	}
	
	public int modify(int seq, String title, String contents, String category) {
		
		return bdao.modify(seq, title, contents, category);
	}
	
	public int delete(int seq) {
		
		rdao.deleteAllRe(seq);
		rdao.deleteAll(seq);
		
		return bdao.delete(seq);
	}	
	
	public int replyCount(int seq) {
		
		return bdao.replyCount(seq);
	}
	
	public int replyReplyCount(int seq) {
		
		return bdao.replyReplyCount(seq);
	}
	
	public int addReplyCount(int seq, int totalReplyCount) {

		return bdao.addReplyCount(seq, totalReplyCount);
	}
	
	public int getPageTotalCount(String searchOption, String searchText) throws Exception{

		int recordTotalCount = bdao.getRecordCount(searchOption, searchText);

		int pageTotalCount = 0;

		if(recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
		}else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;	
	}
	
	public String getPageNavi(int currentPage, String searchOption, String searchText) throws Exception{
		
		int recordTotalCount = bdao.getRecordCount(searchOption, searchText); 

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
		
		if(searchText == null || searchText.equals("")) {		
			if(needPrev) {
				pageNavi += "<a href='/tourboard/list?cpage="+(startNavi-1)+"'><</a> ";
			}
			
			for(int i = startNavi ; i <= endNavi; i++) {
				pageNavi += "<a href='/tourboard/list?cpage="+i+"'>" + i + "</a> ";
			}
			
			if(needNext) {
				pageNavi += "<a href='/tourboard/list?cpage="+(endNavi+1)+"'>></a>";
			}
			
		}else {
			if(searchOption.equals("search_writer")||searchOption.equals("search_title")) {
				if(needPrev) {
					pageNavi += "<a href='/tourboard/list?cpage="+(startNavi-1)+"&searchOption="+searchOption+"&searchText="+searchText+ "'>< </a>";
				}
			
				for(int i = startNavi ; i <= endNavi; i++) {
					pageNavi += "<a href='/tourboard/list?cpage=" + i + "&searchOption="+searchOption+"&searchText="+searchText+"'>" + i + "</a> ";
				}
			
				if(needNext) {
					pageNavi += "<a href='/tourboard/list?cpage="+(endNavi+1)+ "&searchOption="+searchOption+"&searchText="+searchText+"'> ></a>";
				}
			}
		}
		
		

		return pageNavi;		
	}	
	
	// 좋아요
	public void insertBoardLike(TourBoardLikeDTO dto) throws Exception {
	    bdao.insertBoardLike(dto);
	    bdao.updateBoardLike(dto.getPar_seq());
	}
		
	public void deleteBoardLike(TourBoardLikeDTO dto) throws Exception {
	    bdao.deleteBoardLike(dto);
	    bdao.updateBoardLike(dto.getPar_seq());
	}
	
	public  int totalBoardLike(int seq) throws Exception {
        return bdao.totalBoardLike(seq);
	}
	
	public int delete2(int seq) {
		return bdao.delete2(seq);
	}
	
	public int likeDuplCheck(TourBoardLikeDTO dto) {
		return bdao.likeDuplCheck(dto);
	}
}
