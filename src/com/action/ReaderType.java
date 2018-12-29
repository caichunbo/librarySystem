package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.ReaderTypeForm;
import org.apache.struts.action.Action;
import com.dao.ReaderTypeDAO;

public class ReaderType extends Action {
    private ReaderTypeDAO readerTypeDAO = null;
    public ReaderType() {
        this.readerTypeDAO = new ReaderTypeDAO();
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String action =request.getParameter("action");
        System.out.println("\nreaderType*********************action="+action);
        if(action==null||"".equals(action)){
            request.setAttribute("error","���Ĳ�������");
            return mapping.findForward("error");
        }else if("readerTypeAdd".equals(action)){
            return readerTypeAdd(mapping,form,request,response);
        }else if("readerTypeQuery".equals(action)){
            return readerTypeQuery(mapping,form,request,response);
        }else if("readerTypeModifyQuery".equals(action)){
            return readerTypeModifyQuery(mapping,form,request,response);
        }else if("readerTypeModify".equals(action)){
            return readerTypeModify(mapping,form,request,response);
        }else if("readerTypeDel".equals(action)){
            return readerTypeDel(mapping,form,request,response);
        }
        request.setAttribute("error","����ʧ�ܣ�");
        return mapping.findForward("error");
    }
    /***********************��Ӷ���������Ϣ**************************/
    private ActionForward readerTypeAdd(ActionMapping mapping, ActionForm form,
                           HttpServletRequest request,
                           HttpServletResponse response){
           ReaderTypeForm readerTypeForm = (ReaderTypeForm) form;
           System.out.println("servlet:"+request.getParameter("name"));
           readerTypeForm.setName(readerTypeForm.getName());
           int a=readerTypeDAO.insert(readerTypeForm);
           if(a==0){
               request.setAttribute("error","����������Ϣ���ʧ�ܣ�");
               return mapping.findForward("error");
         }else if(a==2){
             request.setAttribute("error","�ö���������Ϣ�Ѿ���ӣ�");
             return mapping.findForward("error");
         }else{
             return mapping.findForward("readerTypeAdd");
        }
       }
       /***********************��ѯȫ������������Ϣ**************************/
       private ActionForward readerTypeQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
       String str=null;
       request.setAttribute("readerType",readerTypeDAO.query(str));
       return mapping.findForward("readerTypeQuery");
       }
        /***********************��ѯ�޸Ķ���������Ϣ**************************/
        private ActionForward readerTypeModifyQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            ReaderTypeForm readerTypeForm=(ReaderTypeForm)form;
            readerTypeForm.setId(Integer.valueOf(request.getParameter("ID")));
            request.setAttribute("readerTypeQueryif",readerTypeDAO.queryM(readerTypeForm));
            return mapping.findForward("readerTypeQueryModify");
        }
        /***********************�޸Ķ���������Ϣ**************************/
        private ActionForward readerTypeModify(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            ReaderTypeForm readerTypeForm=(ReaderTypeForm)form;
            readerTypeForm.setName(readerTypeForm.getName());
            readerTypeForm.setNumber(readerTypeForm.getNumber());
            int ret=readerTypeDAO.update(readerTypeForm);
            if(ret==0){
                request.setAttribute("error","�޸Ķ���������Ϣʧ�ܣ�");
                return mapping.findForward("error");
            }else{
                return mapping.findForward("readerTypeModify");
            }
        }
        /***********************ɾ������������Ϣ**************************/
        private ActionForward readerTypeDel(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            ReaderTypeForm readerTypeForm=(ReaderTypeForm)form;
            readerTypeForm.setId(Integer.valueOf(request.getParameter("ID")));
            int ret=readerTypeDAO.delete(readerTypeForm);
            if(ret==0){
                request.setAttribute("error","ɾ������������Ϣʧ�ܣ�");
                return mapping.findForward("error");
            }else{
                return mapping.findForward("readerTypeDel");
            }
        }
}
