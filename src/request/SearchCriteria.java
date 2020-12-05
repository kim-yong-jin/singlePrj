package request;

public class SearchCriteria {
	
	private int page=1; // 페이지 번호
	private int perPageNum=10; // 한페이지당 리스트개수
	private String searchType=""; // 검색구분
	private String keyword=""; //검색어
	
	
	
	public int getPageStartRowNum(){ //각 페이지마다 시작하는 행번호
		return (this.page-1)*perPageNum;
	}
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setPage(String page) {
		if(page!=null && !page.isEmpty())
		this.page = Integer.parseInt(page);
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		if(perPageNum!=null && !perPageNum.isEmpty())
		this.perPageNum = Integer.parseInt(perPageNum);
	}

	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
}
