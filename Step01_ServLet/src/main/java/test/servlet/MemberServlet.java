package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dto.MemberDto;

@WebServlet("/member/list")
public class MemberServlet extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title></title>");
		pw.println("</head>");
		pw.println("<body>");

		// 친구 목록(sample data) 이라고 가정
		List<MemberDto> list = new ArrayList<>();
		list.add(new MemberDto(1, "김구라", "노량진"));
		list.add(new MemberDto(2, "해골", "행신동"));
		list.add(new MemberDto(3, "원숭이", "상도동"));

		pw.println("<table>");

		pw.println("<tr>");
		pw.println("<th>번호</th>");
		pw.println("<th>이름</th>");
		pw.println("<th>주소</th>");
		pw.println("</tr>");

		for(int i=0; i<list.size(); i++) {
			pw.println("<tr>");
			pw.println("<td>"+list.get(i).getNum()+"</td>");
			pw.println("<td>"+list.get(i).getName()+"</td>");
			pw.println("<td>"+list.get(i).getAddr()+"</td>");
			pw.println("</tr>");
		}

		pw.println("</table>");

		pw.println("</body>");
		pw.println("</html>");
		pw.close();

	}
}
