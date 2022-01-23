package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ComReplyDAO;
import kh.spring.dao.CompanyBoardDAO;
import kh.spring.dto.ComBoardLikeDTO;
import kh.spring.dto.CompanyBoardDTO;
import kh.spring.dto.TourBoardDTO;
import kh.spring.statics.Statics;

@Service
public class CompanyBoardService {

	@Autowired
	private CompanyBoardDAO cdao;
	
	@Autowired
	private ComReplyDAO rdao;
	
	public int insert(CompanyBoardDTO dto) {
		return cdao.insert(dto);
	}
	
	public List<CompanyBoardDTO> selectAll(int start, int end, String searchOption, String searchText) {
		
		return cdao.selectAll(start, end, searchOption, searchText);
	}
	
	public CompanyBoardDTO selectBySeq(int seq) {
		return cdao.selectBySeq(seq);
	}
	
	public int delete(int seq) {
		rdao.deleteAllRe(seq);
		rdao.deleteAll(seq);
		return cdao.delete(seq);
	}
	
	public int modify(CompanyBoardDTO dto) {
		return cdao.modify(dto);
	}
	
	public int addViewCount(int seq) {
		return cdao.addViewCount(seq);
	}   
	
//	public int getRecordCount() throws Exception {
//		return cdao.getRecordCount();
//	}

	
	// 좋아요
	public void insertBoardLike(ComBoardLikeDTO dto) throws Exception {
        cdao.insertBoardLike(dto);
        cdao.updateBoardLike(dto.getPar_seq());
    }
	
	public void deleteBoardLike(ComBoardLikeDTO dto) throws Exception {
        cdao.deleteBoardLike(dto);
        cdao.updateBoardLike(dto.getPar_seq());
    }
	
	public  int getBoardLike(ComBoardLikeDTO dto) throws Exception {
        return cdao.getBoardLike(dto);
	}
	
	public int delete2(int seq) {
		return cdao.delete2(seq);
	}
	
	// 댓글 개수
	public int replyCount(int seq) {
		return cdao.replyCount(seq);
	}
	
	
	
	// 대댓글 개수
	public int replyReplyCount(int seq) {
		return cdao.replyReplyCount(seq);
	}
	
	//댓글 개수 테이블 반영
	public int addReplyCount(int seq, int totalReplyCount) {
	      
	    return cdao.addReplyCount(seq, totalReplyCount);
	}
	
	//검색
	public int getPageTotalCount(String searchOption, String searchText) throws Exception{

		int recordTotalCount = cdao.getRecordCount(searchOption, searchText);
		System.out.println("service 에서 recordTotalCount: " + recordTotalCount);
		System.out.println("service 에서 searchOption, searchText: " + searchOption + " : " +  searchText);

		int pageTotalCount = 0;

		if(recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
		}else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;	
	}
	
	public String getPageNavi(int currentPage, String searchOption, String searchText) throws Exception{
		
		int recordTotalCount = cdao.getRecordCount(searchOption, searchText); 

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
			pageNavi += "<a href='/companyboard/list?cpage="+(startNavi-1)+"'><</a> ";
		}
		
		for(int i = startNavi ; i <= endNavi; i++) {
			pageNavi += "<a href='/companyboard/list?cpage="+i+"'>" + i + "</a> ";
		}
		
		if(needNext) {
			pageNavi += "<a href='/companyboard/list?cpage="+(endNavi+1)+"'>></a>";
		}

		return pageNavi;		
	}	
}
