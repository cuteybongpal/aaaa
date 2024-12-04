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
		if (command.equals("/ProductListAction.do")) {
			requestProductList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./product/product_list.jsp");
			rd.forward(request, response);
		}
		if (command.equals("/ProductAction.do")) {
			
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
	}
	
	public void requestProductList(HttpServletRequest request) {
		String con = request.getParameter("Constraint");
		
		if (con == null || con.isEmpty())
			con = "";
		
		List<Product> products = ProductRepository.getInstance().getAllProduct(con);
		request.setAttribute("products", products);
	}
}