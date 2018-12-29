package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.BookCaseForm;
import org.apache.struts.action.Action;
import com.dao.BookCaseDAO;

public class BookCase extends Action {
    private BookCaseDAO bookCaseDAO=null;
    public BookCase(){
        this.bookCaseDAO=new BookCaseDAO();
    }
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
    String action =request.getParameter("action");
    System.out.println("\nbookCase*********************action="+action);
    if(action==null||"".equals(action)){
        return mapping.findForward("error");
    }else if("bookCaseAdd".equals(action)){
        return bookCaseAdd(mapping,form,request,response);
    }else if("bookCaseQuery".equals(action)){
        return bookCaseQuery(mapping,form,request,response);
    }else if("bookCaseModifyQuery".equals(action)){
        return bookCaseModifyQuery(mapping,form,request,response);
    }else if("bookCaseModify".equals(action)){
        return bookCaseModify(mapping,form,request,response);
    }else if("bookCaseDel".equals(action)){
        return bookCaseDel(mapping,form,request,response);
    }
        request.setAttribute("error","����ʧ�ܣ�");
        return mapping.findForward("error");
    }
 /***********************��������Ϣ**************************/
 private ActionForward bookCaseAdd(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
        BookCaseForm bookCaseForm = (BookCaseForm) form;
        System.out.println("servlet:"+request.getParameter("name"));
        bookCaseForm.setName(bookCaseForm.getName());
        int a=bookCaseDAO.insert(bookCaseForm);
        if(a==0){
            request.setAttribute("error","�����Ϣ���ʧ�ܣ�");
            return mapping.findForward("error");
      }else if(a==2){
          request.setAttribute("error","�������Ϣ�Ѿ���ӣ�");
          return mapping.findForward("error");
      }else{
          return mapping.findForward("bookcaseAdd");
     }
    }
    /***********************��ѯȫ�������Ϣ**************************/
    private ActionForward bookCaseQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
    String str=null;
    request.setAttribute("bookcase",bookCaseDAO.query(str));
    return mapping.findForward("bookcaseQuery");
    }
     /***********************��ѯ�޸������Ϣ**************************/
     private ActionForward bookCaseModifyQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
         BookCaseForm bookCaseForm=(BookCaseForm)form;
         bookCaseForm.setId(Integer.valueOf(request.getParameter("ID")));
         request.setAttribute("bookCaseQueryif",bookCaseDAO.queryM(bookCaseForm));
         return mapping.findForward("bookCaseQueryModify");
     }
     /***********************�޸������Ϣ**************************/
     private ActionForward bookCaseModify(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
         BookCaseForm bookCaseForm=(BookCaseForm)form;
         bookCaseForm.setName(request.getParameter("name"));
         int ret=bookCaseDAO.update(bookCaseForm);
         if(ret==0){
             request.setAttribute("error","�޸������Ϣʧ�ܣ�");
             return mapping.findForward("error");
         }else{
             return mapping.findForward("bookCaseModify");
         }
     }
     /***********************ɾ�������Ϣ**************************/
     private ActionForward bookCaseDel(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response
){
         BookCaseForm bookCaseForm=(BookCaseForm)form;
         bookCaseForm.setId(Integer.valueOf(request.getParameter("ID")));
         int ret=bookCaseDAO.delete(bookCaseForm);
         if(ret==0){
             request.setAttribute("error","ɾ�������Ϣʧ�ܣ�");
             return mapping.findForward("error");
         }else{
             return mapping.findForward("bookCaseDel");
         }
     }
}
