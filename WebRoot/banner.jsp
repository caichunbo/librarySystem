<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="com.core.ChStr" %>
<%
ChStr chStr=new ChStr();
String manager=(String)session.getAttribute("manager");
//��֤�û��Ƿ��¼
if (manager==null || "".equals(manager)){
	response.sendRedirect("login.jsp");
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="118" valign="top" background="Images/top_bg.gif" bgcolor="#EEEEEE"><table width="100%" height="33"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="81%" height="10"></td>
        <td colspan="2"></td>
      </tr>
      <tr>
        <td height="20">&nbsp;</td>
        <td width="10%"><a href="#" onClick="window.location.reload();" class="word_dark">ˢ��ҳ��</a></td>
        <td width="9%"><a href="#" onClick="myclose()" class="word_dark">�ر�ϵͳ</a></td>
		<script language="javascript">
			function myclose(){
				if(confirm("���Ҫ�رյ�ǰ������?")){
					window.close();
				}
			}
		</script>
        </tr>
    </table>
      <table width="93%" height="79"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="69" align="right" valign="bottom">��ǰ��¼�û���<%=chStr.toChinese(manager)%></td>
        </tr>
    </table></td>
  </tr>
</table>
