package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.PublishingForm;
import org.apache.struts.action.Action;
import com.dao.PublishingDAO;

public class Publishing extends Action {
    private PublishingDAO pubDAO = null;
    public Publishing() {
        this.pubDAO = new PublishingDAO();
    }
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        PublishingForm publishingForm = (PublishingForm) form;
        String action =request.getParameter("action");
        System.out.println("\npublishing**************action="+action);
        if(action==null||"".equals(action)){
            request.setAttribute("error","您的操作有误！");
            return mapping.findForward("error");
        }else if("pubQuery".equals(action)){
            return pubQuery(mapping,form,request,response);
        }
        request.setAttribute("error","操作失败！");
        return mapping.findForward("error");
    }
    /***********************查询全部出版社信息**************************/
    private ActionForward pubQuery(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
    String str=null;
    request.setAttribute("book",pubDAO.query(str));
    return mapping.findForward("pubQuery");
       }
}
