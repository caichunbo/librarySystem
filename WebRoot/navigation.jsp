<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="com.dao.ManagerDAO"%>
<%@ page import="com.actionForm.ManagerForm"%>
<%
ManagerDAO managerDAO=new ManagerDAO();
ManagerForm form1=(ManagerForm)managerDAO.query_p("tsoft");
int sysset1=0;
int readerset1=0;
int bookset1=0;
int borrowback1=0;
int sysquery1=0;
if(form1!=null){
	sysset1=form1.getSysset();
	readerset1=form1.getReaderset();
	bookset1=form1.getBookset();
	borrowback1=form1.getBorrowback();
	sysquery1=form1.getSysquery();
}

%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script src="JS/onclock.JS"></script>
<script src="JS/menu.JS"></script>
<div class=menuskin id=popmenu
      onmouseover="clearhidemenu();highlightmenu(event,'on')"
      onmouseout="highlightmenu(event,'off');dynamichide(event)" style="Z-index:100;position:absolute;"></div>
<table width="778"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr bgcolor="#DFA40C">
        <td width="3%" height="27">&nbsp;</td>
        <td width="29%"><div id="bgclock" class="word_white"></div></td>
		<script language="javascript">
			function quit(){
				if(confirm("���Ҫ�˳�ϵͳ��?")){
					window.location.href="logout.jsp";
				}
			}
		</script>
        <td width="66%" align="right" bgcolor="#B0690B" class="word_white"><a href="main.jsp" class="word_white">��ҳ</a> |
        <%if(sysset1==1){%><a  onmouseover=showmenu(event,sysmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand" >ϵͳ����</a> | <%}%><%if(readerset1==1){%><a  onmouseover=showmenu(event,readermenu) onmouseout=delayhidemenu() style="CURSOR:hand"  class="word_white">���߹���</a> | <%}%><%if(bookset1==1){%><a  onmouseover=showmenu(event,bookmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand" >ͼ�����</a> | <%}%><%if(borrowback1==1){%><a  onmouseover=showmenu(event,borrowmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand">ͼ��軹</a> | <%}%><%if(sysquery1==1){%><a  onmouseover=showmenu(event,querymenu) onmouseout=delayhidemenu()  class="word_white" style="CURSOR:hand" >ϵͳ��ѯ</a> | <%}%><a  href="manager.do?action=querypwd" class="word_white">���Ŀ���</a> | <a href="#" onClick="quit()" class="word_white">�˳�ϵͳ</a></td>
        <td width="2%" bgcolor="#B0690B">&nbsp;</td>
  </tr>
      <tr bgcolor="#DFA40C">
        <td height="9" colspan="4" background="Images/navigation_bg_bottom.gif"></td>
      </tr>
</table>
