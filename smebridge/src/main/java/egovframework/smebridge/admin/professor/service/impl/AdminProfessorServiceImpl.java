package egovframework.smebridge.admin.professor.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.smebridge.admin.professor.model.AdminProfessorResearchVo;
import egovframework.smebridge.admin.professor.model.AdminProfessorVo;
import egovframework.smebridge.admin.professor.service.AdminProfessorService;

@Service("adminProfessorService")
@Transactional
public class AdminProfessorServiceImpl implements AdminProfessorService {

	@Resource(name="adminProfessorMapper")
	AdminProfessorMapper adminProfessorMapper;

	@Override
	public ModelMap getProfessorAllList(AdminProfessorVo adminProfessorVo) {
		
		ModelMap model = new ModelMap();
		
		List<?> list = adminProfessorMapper.getAllList(adminProfessorVo);
		
		System.out.println("siez : " + list.size() );
		
		int itemtotalcount = adminProfessorMapper.getAllListCount(adminProfessorVo);
		
		int itemcount = adminProfessorVo.getITEM_COUNT();
		int itempage = adminProfessorVo.getITEM_PAGE();
		
		PageVO pageVo = new PageVO(itemcount, itemtotalcount, itempage);
		
		if(pageVo.isItempagenext() == true) {
			model.put("itempagenext", "true");
		}else {
			model.put("itempagenext", "false");
		}
		
		System.out.println(pageVo.getItempage());
		
		model.put("page" , pageVo.getItempage());
		model.put("itemcount" , pageVo.getItempage());
		model.put("itempagestart", pageVo.getItempagestart());
		model.put("itempageend", pageVo.getItempageend());
		model.put("itemtotalcount", pageVo.getItemtotalcount());
		model.put("itemtotalpage", pageVo.getItemtotalpage());
		
		model.put("list", list);
		
		return model;
	}

	@Override
	public ModelMap getProfessorView(AdminProfessorVo adminProfessorVo) {
		
		ModelMap model = new ModelMap();
		
		AdminProfessorVo proVo = new AdminProfessorVo();
		
		proVo = adminProfessorMapper.getProfessorDataView(adminProfessorVo);
		
		model.put("view", proVo);
		
		return model;
	}

	@Override
	public void setAdminProfessorData(AdminProfessorVo adminProfessorVo, String type) {
		
		switch (type) {
		case "insert":
			adminProfessorMapper.setAdminProfessorDataInsert(adminProfessorVo);
			break;
		case "update":
			adminProfessorMapper.setAdminProfessorDataUpdate(adminProfessorVo);
			break;
		case "delete":
			adminProfessorMapper.setAdminProfessorDataDelete(adminProfessorVo);
			break;
		default:
			System.out.println("type 오류");
			break;
		}
		
	}

	@Override
	public List<?> getProfessorResearchList(AdminProfessorResearchVo researchVo) {
		
		List<?> list = adminProfessorMapper.getProfessorResearchDataList(researchVo);
		
		return list;
	}

	@Override
	public void setAdminProfessorResearchData(AdminProfessorResearchVo adminProfessorResearchVo, String type) {
		
		switch (type) {
		case "insert":
			adminProfessorMapper.setAdminProfessorResearchDataInsert(adminProfessorResearchVo);
			break;
		case "delete":
			adminProfessorMapper.setAdminProfessorResearchDataDelete(adminProfessorResearchVo);
			break;
		default:
			break;
		}
		
		
	}

	@Override
	public void setAdminProfessorDataList(List<AdminProfessorResearchVo> list) {
		
		System.out.println("size : " + list.size());
		
		AdminProfessorResearchVo researchVo = new AdminProfessorResearchVo();
		
		for(int i = 0; i < list.size(); i ++) {
			
			//초기화
			researchVo.setPro_idx(null);
			researchVo.setIdx(null);
			researchVo.setSeq(null);
			researchVo.setContent(null);
			
			researchVo.setPro_idx(list.get(i).getPro_idx());
			researchVo.setIdx(list.get(i).getIdx());
			researchVo.setSeq(list.get(i).getSeq());
			researchVo.setContent(list.get(i).getContent());
			
			adminProfessorMapper.setAdminProfessorResearchDataUpdate(researchVo);
			
		}
		
	}
	
}
