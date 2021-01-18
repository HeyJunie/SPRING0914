package com.koreait.mybatis2.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.mybatis2.command.SimpleCommand;
import com.koreait.mybatis2.command.SimpleInsertCommand;
import com.koreait.mybatis2.command.SimpleListCommand;

@Controller
public class SimpleController {

	
	// field로 SqlSession sqlSession을 만들어 둡니다.
	
	// root-context.xml을 참고해서 그대로 만들자면
	// SqlSessionTemplate sqlSession; 이것을 생성해야 하지만,
	// SqlSession sqlSession; 으로 바꿔서 생성하고 있습니다.
	
	@Autowired
	private SqlSession sqlSession;
	
	private SimpleCommand command;
	
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="simpleInsertPage.do", method=RequestMethod.GET)
	public String simpleInsertPage() {
		return "simple/simpleInsertPage";
	}
	
	
	
	@RequestMapping(value="simpleListPage.do", method=RequestMethod.GET)
	public String simpleListPage(Model model) {
		command = new SimpleListCommand();
		command.execute(sqlSession, model);
		return "simple/simpleListPage";
	}
	
	@RequestMapping(value="simpleInsert.do", method=RequestMethod.POST)
	public String simpleInsert(HttpServletRequest request,
			                   RedirectAttributes rttr, // insertResult 전달용
			                   Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		
		command = new SimpleInsertCommand();
		command.execute(sqlSession, model);  // model에 insertResult가 저장되어 있다.
		
		// model에 저장된 insertResult는 request에 저장되어 있습니다.
		// return "redirect:simpleListPage.do"; 를 통해서 이동할 때는 request가 전달되지 않기 때문에
		// simpleListPage.do로 이동되는 JSP 페이지인 simpleListPage.jsp에 insertResult는 전달되지 않습니다.
		
		// rttr에 저장된 insertResult는 이동할 JSP(simpleListPage.jsp)에 잘 전달됩니다.
		// rttr에 저장된 afterInsert도 이동할 JSP(simpleListPage.jsp)에 잘 전달됩니다.
		// rttr에 저장된 값도 JSP는 EL로 처리하면 됩니다.(${insertResult}, ${afterInsert})
		
		return "redirect:simpleListPage.do";
		
	}
	
	
	
	
	
	
	
	
	
}