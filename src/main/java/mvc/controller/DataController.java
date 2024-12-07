package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductRepository;
import dto.Product;
import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class DataController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 10;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		System.out.println(RequestURI);
		System.out.println(contextPath);
		
		String command = RequestURI.substring(contextPath.length());
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		
		if (command.equals("/BoardListAction.do")) {
			  requestBoardList(request);
			  RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp");
			  rd.forward(request, response);
		}
		else if (command.equals("/ProductListAction.do")) {
			requestProductList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./product/product_list.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/ProductAction.do")) {
			requestProduct(request);
			RequestDispatcher rd = request.getRequestDispatcher("./product/product.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/BoardWriteForm.do")) {
			requestLoginName(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/writeForm.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/BoardWriteAction.do")) {
			requestBoardWrite(request);
			//글 쓰는 로직을 수행하는 함수 생성
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}
		else if (command.equals("/BoardViewAction.do")) {
			requestBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
			rd.forward(request, response);
		}
		else if (command.equals("/BoardView.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/BoardUpdateAction.do")) {
			requestBoardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}
		else if (command.equals("/BoardDeleteAction.do")) {
			requestBoardDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}
	}
	
	public void requestBoardList(HttpServletRequest request) { //등록한 글 목록 가져오기
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boards = new ArrayList<BoardDTO>(); 
		int pageNum = 1;
		int limit = LISTCOUNT; //10
		//페이지 번호가 있으면
		
		if (request.getParameter("pageNum") != null) 
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		boards = dao.getBoardList(pageNum);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("boards", boards);
		
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		
		
		int total_record = dao.getListCount(items, text);
		boards = dao.getBoardList(pageNum, limit, items, text);
		
		request.setAttribute("total_record", total_record);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("boards", boards);
		request.setAttribute("items",items);
		request.setAttribute("text",text);
		int total_page;
		
		if (total_record % limit == 0) {
			total_page = total_record/limit;
		}
		else {
			total_page = (total_record / limit) + 1;
		}
		
		request.setAttribute("total_page", total_page);
		request.setAttribute("boards", boards);
	}
	
	public void requestProductList(HttpServletRequest request) {
		String con = request.getParameter("Constraint");
		
		if (con == null || con.isEmpty())
			con = "";
		
		List<Product> products = ProductRepository.getInstance().getAllProduct(con);
		request.setAttribute("products", products);
	}
	public void requestProduct(HttpServletRequest request) {
		String con = request.getParameter("id");
		
		Product _product = ProductRepository.getInstance().getProductById(con);
		
		request.setAttribute("product", _product);
	}
	public void requestLoginName(HttpServletRequest request) {
		//인증된 사용자명을 가져오는 함수 구현
		String id = request.getParameter("id");
		
		BoardDAO dao = BoardDAO.getInstance();
		String name = dao.getLoginNmaeById(id);
		
		request.setAttribute("name", name);
		request.setAttribute("id", id);
		
	}
	public void requestBoardWrite(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO dto = new BoardDTO();
		System.out.println("id : " +request.getParameter("b_id"));
		System.out.println("name : " +request.getParameter("b_name"));
		dto.setId(request.getParameter("b_id"));
		dto.setName(request.getParameter("b_name"));
		dto.setSubject(request.getParameter("b_subject"));
		dto.setContent(request.getParameter("b_content"));
		dto.setHit(0);
		dto.setIp(request.getRemoteAddr());
		
		dao.insertBoard(dto);
	}
	public void requestBoardView(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);
	}
	public void requestBoardUpdate(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		String name = request.getParameter("b_name");
		String subject = request.getParameter("b_subject");
		String content = request.getParameter("b_content");
		String ip = request.getRemoteAddr();
		dao.UpdateBoardByNum(num, name, subject, content, ip);
	}
	public void requestBoardDelete(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		dao.DeleteBoardByNum(num);
	}
}
