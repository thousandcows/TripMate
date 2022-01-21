package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ComReplyDAO;
import kh.spring.dao.CompanyBoardDAO;
import kh.spring.dto.ComBoardLikeDTO;
import kh.spring.dto.CompanyBoardDTO;
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
	
	public List<CompanyBoardDTO> selectAll(int start, int end){
		return cdao.selectAll(start, end);
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
	
	public int getRecordCount() throws Exception {
		return cdao.getRecordCount();
	}
	
	
	public String getPageNavi(int currentPage) throws Exception{

		int recordTotalCount = cdao.getRecordCount(); 
		int pageTotalCount = 0;
			
		if(recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
		}else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}

//		if(currentPage < 1) {
//			currentPage = 1;
//		}else if(currentPage > pageTotalCount) {
//			currentPage = pageTotalCount;
//		} 
			
		int startNavi = (currentPage-1) / Statics.NAVI_COUNT_PER_PAGE   * Statics.NAVI_COUNT_PER_PAGE + 1;	
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;
			
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
			
		boolean needPrev = true ;
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


	public int getPageTotalCount() throws Exception{

		int recordTotalCount = cdao.getRecordCount();

		int pageTotalCount = 0;

		if(recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
		}else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;	
	}
	
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
}
