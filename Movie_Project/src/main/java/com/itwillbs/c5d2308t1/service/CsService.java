package com.itwillbs.c5d2308t1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.c5d2308t1.mapper.CsMapper;
import com.itwillbs.c5d2308t1.vo.CsVO;

@Service
public class CsService {
	// 마이바티스를 통해 SQL 구문 처리를 담당할 XXXMapper.xml 파일과 연동되는
	// XXXMapper 객체(인터페이스)를 자동 주입받기 위해 @Autowired 어노테이션으로 멤버변수 선언
	@Autowired
	private CsMapper mapper;

	public int registBoard(CsVO cs) {
		System.out.println("CsService - registBoard()");
		
		// CsMapper - insertBoard() 메서드를 호출하여 문의글 등록 요청
		// => 파라미터 : CsVO 객체   리턴타입 : int
		return mapper.insertBoard(cs);
	}

	public List<CsVO> getFaqList() {
		// CsMapper - selectFqaList() 메서드 호출하여 자주묻는질문 목록 조회 요청
		return mapper.selectFaqList();
	}
	
	public List<CsVO> getFaqList(int startRow, int listLimit) {
		// CsMapper - selectFqaList() 메서드 호출하여 자주묻는질문 목록 조회 요청
		return mapper.selectFaqList(startRow, listLimit);
	}
	
	public Integer getFaqListCount() {
		// CsMapper - selectNoticeListCount() 메서드 호출하여 공지사항 목록 갯수 조회 요청
		return mapper.selectFaqListCount();
	}
	
	public List<CsVO> getNoticeList() {
		// CsMapper - selectNoticeList() 메서드 호출하여 공지사항 목록 조회 요청
		return mapper.selectNoticeList();
	}
	
	
	public List<CsVO> getNoticeList(int startRow, int listLimit) {
		// CsMapper - selectNoticeList() 메서드 호출하여 공지사항 목록 조회 요청
		return mapper.selectNoticeList(startRow, listLimit);
	}

	public Integer getNoticeListCount() {
		// CsMapper - selectNoticeListCount() 메서드 호출하여 공지사항 목록 갯수 조회 요청
		return mapper.selectNoticeListCount();
	}

	public List<CsVO> getFaqDetail(String cs_type_detail) {
		return mapper.selectFaqDetail(cs_type_detail);
	}



	
	
}
