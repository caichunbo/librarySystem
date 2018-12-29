package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.dao.LibraryDAO;
import com.actionForm.LibraryForm;
import org.apache.struts.action.Action;

public class Library extends Action {
    LibraryDAO libraryDAO=null;
    public Library(){
        libraryDAO=new LibraryDAO();
    }
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        LibraryForm libraryForm=(LibraryForm) form;
        String str=request.getParameter("action");
        if("libraryQuery".equals(str)){
            return libraryModifyQuery(mapping,form,request,response);
        }else if("libraryModify".equals(str)){
            return libraryModify(mapping,form,request,response);
        }
        request.setAttribute("error","���Ĳ�������");
        return mapping.findForward("error");
    }
    private ActionForward libraryModify(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response
){
        LibraryForm libraryForm = (LibraryForm) form;
        libraryForm.setId(libraryForm.getId());
        libraryForm.setLibraryname(libraryForm.getLibraryname());
        libraryForm.setCurator(libraryForm.getCurator());
        libraryForm.setTel(libraryForm.getTel());
        libraryForm.setAddress(libraryForm.getAddress());
        libraryForm.setEmail(libraryForm.getEmail());
        libraryForm.setUrl(libraryForm.getUrl());
        libraryForm.setCreateDate(libraryForm.getCreateDate());
        libraryForm.setIntroduce(libraryForm.getIntroduce());
        int ret = libraryDAO.update(libraryForm);
        if (ret ==0) {
            request.setAttribute("error", "ͼ�����Ϣ�޸�ʧ�ܣ�");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("librarymodify");
        }

    }
    private ActionForward libraryModifyQuery(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response
){
        request.setAttribute("libraryModifyif",libraryDAO.query());
        return mapping.findForward("librarymodifyQuery");
    }
}
