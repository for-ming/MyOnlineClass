package net.developia.online.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import net.developia.online.dto.CommentDTO;
import net.developia.online.services.CommentService;
import net.developia.online.util.DateFormatClass;

@RestController
public class CommentController {

	@Autowired
	private CommentService commentService;

	@GetMapping(value = "/classdetail/{no}/{cno}", produces = "application/json; charset=UTF-8")
	public List<CommentDTO> comment_list(@PathVariable("no") long no, @PathVariable("cno") long co,
			@ModelAttribute("comments") CommentDTO comments) throws Exception {
		List<CommentDTO> commentlist = commentService.getCommentList(no);
		System.out.println("★★★" + commentlist.toString());
		return commentlist;
	}

	@PostMapping(value = "/classdetail/{no}/insert", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> comment_insert(@PathVariable("no") long no, @RequestBody List<Map<String, Object>> list,
		HttpServletRequest request, HttpSession session, @ModelAttribute("comments") CommentDTO comments) throws Exception {
		ResponseEntity<String> entity = null;
		
		for(Map<String, Object> m : list) {
			comments.setContent(m.get("content_textVal)".toString());
		}
		comments.setLecture_id(no);
		comments.setMember_id((String) session.getAttribute("id"));
		comments.setContent(content_textVal);
		comments.setName((String) session.getAttribute("name"));
		comments.setRegdate(DateFormatClass.strDateNow());
		System.out.println(comments.toString());
		try {
			commentService.insertComment(comments);
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	/*
	 * @PostMapping(value = "/classdetail/{no}/{cno}", produces =
	 * "application/json; charset=UTF-8")
	 * 
	 * @ResponseBody public List<CommentDTO> comment_update(@ModelAttribute
	 * CommentDTO commentDTO, HttpServletRequest request, HttpSession session)
	 * throws Exception { commentDTO.setCom_ip(request.getRemoteAddr());
	 * commentDTO.setUserDTO((UserDTO) session.getAttribute("userInfo"));
	 * 
	 * log.info("comment_update() 메소드 수행"); log.info(commentDTO.toString());
	 * 
	 * boardService.updateComment(commentDTO); return
	 * boardService.getCommentList(commentDTO); }
	 * 
	 * @DeleteMapping(value = "/{com_no}", produces =
	 * "application/json; charset=UTF-8")
	 * 
	 * @ResponseBody public List<CommentDTO> comment_delete(@ModelAttribute
	 * CommentDTO commentDTO, HttpServletRequest request, HttpSession session)
	 * throws Exception { commentDTO.setCom_ip(request.getRemoteAddr());
	 * commentDTO.setUserDTO((UserDTO) session.getAttribute("userInfo"));
	 * 
	 * log.info("comment_delete() 메소드 수행"); log.info(commentDTO.toString());
	 * 
	 * boardService.deleteComment(commentDTO); return
	 * boardService.getCommentList(commentDTO); }
	 */
}