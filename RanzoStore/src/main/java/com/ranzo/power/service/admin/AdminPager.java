package com.ranzo.power.service.admin;

public class AdminPager {

		public static final int PAGE_SCALE=8; //페이지당 게시물수
		public static final int BLOCK_SCALE=5;//화면당 페이지수
		
		private int curPage; //현재 페이지
		private int prevPage; //이전 페이지
		private int nextPage; //다음 페이지
		private int totPage; //전체 페이지 갯수
		private int totBlock; //전체 페이지블록 갯수
		private int curBlock; //현재 블록
		private int prevBlock; //이전 블록
		private int nextBlock; //다음 블록
		private int pageBegin; // #{start} 
		private int pageEnd; // #{end}
		private int blockStartPage; //블록의 시작페이지
		private int blockEndPage; //블록의 끝페이지
		
		public AdminPager(int count, int curPage) {
			curBlock = 1; 
			this.curPage = curPage;
			setTotPage(count);
			setPageRange(); 
			setTotBlock(); 
			setBlockRange(); 
		}
		public void setBlockRange() {
			curBlock=(curPage-1)/BLOCK_SCALE + 1;
			blockStartPage=(curBlock-1)*BLOCK_SCALE+1;
			blockEndPage=blockStartPage+BLOCK_SCALE-1;
			if(blockEndPage > totPage) {
				blockEndPage = totPage;
			}
			prevPage=(curBlock==1) ? 1 : (curBlock-1)*BLOCK_SCALE;
			nextPage=curBlock>totBlock ? (curBlock*BLOCK_SCALE)
					: (curBlock*BLOCK_SCALE)+1;
			if(nextPage >= totPage) {
				nextPage=totPage;
			}
		}
		
		//블록의 갯수 계산
		public void setTotBlock() {
			totBlock = (int)Math.ceil(totPage*1.0 / BLOCK_SCALE);
		}
		
		public void setPageRange() {
			pageBegin = (curPage-1) * PAGE_SCALE + 1;
			pageEnd = pageBegin + PAGE_SCALE - 1;
		}
		
		public int getCurPage() {
			return curPage;
		}
		public void setCurPage(int curPage) {
			this.curPage = curPage;
		}
		public int getPrevPage() {
			return prevPage;
		}
		public void setPrevPage(int prevPage) {
			this.prevPage = prevPage;
		}
		public int getNextPage() {
			return nextPage;
		}
		public void setNextPage(int nextPage) {
			this.nextPage = nextPage;
		}
		public int getTotPage() {
			return totPage;
		}
		//전체 페이지 갯수 계산
		public void setTotPage(int count) {
			totPage = (int)Math.ceil(count*1.0 / PAGE_SCALE);
		}
		public int getTotBlock() {
			return totBlock;
		}
		public void setTotBlock(int totBlock) {
			this.totBlock = totBlock;
		}
		public int getCurBlock() {
			return curBlock;
		}
		public void setCurBlock(int curBlock) {
			this.curBlock = curBlock;
		}
		public int getPrevBlock() {
			return prevBlock;
		}
		public void setPrevBlock(int prevBlock) {
			this.prevBlock = prevBlock;
		}
		public int getNextBlock() {
			return nextBlock;
		}
		public void setNextBlock(int nextBlock) {
			this.nextBlock = nextBlock;
		}
		public int getPageBegin() {
			return pageBegin;
		}
		public void setPageBegin(int pageBegin) {
			this.pageBegin = pageBegin;
		}
		public int getPageEnd() {
			return pageEnd;
		}
		public void setPageEnd(int pageEnd) {
			this.pageEnd = pageEnd;
		}
		public int getblockStartPage() {
			return blockStartPage;
		}
		public void setblockStartPage(int blockStartPage) {
			this.blockStartPage = blockStartPage;
		}
		public int getblockEndPage() {
			return blockEndPage;
		}
		public void setblockEndPage(int blockEndPage) {
			this.blockEndPage = blockEndPage;
		}
		@Override
		public String toString() {
			return "AdminPager [curPage=" + curPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", totPage="
					+ totPage + ", totBlock=" + totBlock + ", curBlock=" + curBlock + ", prevBlock=" + prevBlock
					+ ", nextBlock=" + nextBlock + ", pageBegin=" + pageBegin + ", pageEnd=" + pageEnd
					+ ", blockStartPage=" + blockStartPage + ", blockEndPage=" + blockEndPage + "]";
		}
		
	}