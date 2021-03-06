<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html"%>
<html>
<head>
	<title>桌面栏目管理表明细</title>
	<%@include file="/commons/include/get.jsp" %>
	<%@include file="/commons/include/getById.jsp" %>
    <link href="${ctx}/js/desktop/inettuts.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/js/desktop/inettuts.js.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/js/lg/plugins/ligerMessageBox.js"></script>  
    <script type="text/javascript" src="${ctx}/js/lg/plugins/htButtons.js" ></script>
    <script type="text/javascript" src="${ctx}/js/cosim/platform/desktop/desktopShow.js" ></script>
    <script type="text/javascript" src="${ctx}/js/cosim/platform/desktop/desktopTemplete.js" ></script>
	<script type="text/javascript">
		var nums=1; 
		var nonactivated = 'nonactivated';
		var active = 'active';
		//保存布局
		function save(){
			var layoutID=${desktopLayoutmap["id"]};//栏目ID
			var layoutCols=${desktopLayoutmap["cols"]};//栏目列数
			com.cosim.platform.desktop.saveCol(layoutID,"desktopMycolumn",layoutCols);
		}
		$(function () { 
			var desktop="${desktop}";
			var columnId=${desktopLayoutmap["id"]};//栏目ID
			var cols=${desktopLayoutmap["cols"]};//栏目列数
			var width='${desktopLayoutmap["widths"]}';//栏目宽度
			new com.cosim.platform.desktop.myTemp(cols,columnId,width,1,desktop);
        	$("span.htbtn").htButtons();
        	$('#itemColumn1').val(0);
        	$('#itemColumn2').val(0);
        	$('#itemColumn3').val(0);
	   	}); 
	</script>
</head>
<body> 
	<input name="itemColumn1" id="itemColumn1" type="hidden" value="0"/> 
	<input name="itemColumn2" id="itemColumn2" type="hidden" value="0"/> 
	<input name="itemColumn3" id="itemColumn3" type="hidden" value="0"/> 
	<input name="itemcols" id="itemcols" type="hidden" value="0"/> 
	<div class="panel-top">
		<div class="tbar-title">
			<span class="tbar-label">个人桌面显示</span>
		</div>
		<div class="panel-toolbar">
			<div class="toolBar">
				<div class="group">
					<a class="link save" id="save" href="#" onclick="save()">保存布局</a>  
				</div>
				<div class="l-bar-separator"></div>				
				<div class="group">
					<a class="link back" href="../desktopMycolumn/show.ht">返回</a>
				</div>
				<div class="l-bar-separator"></div>				
				<div class="group">
					<a class="link undo" href="../desktopMycolumn/news.ht?id=${desktopLayoutmap.id}">重置布局</a>
				</div>
				<div class="l-bar-separator"></div>	
				<div class="group">
					<table ><tr width="50%"><td>
						&nbsp;&nbsp;<span class="label">请先选择下面栏目区域，再选择栏目:</span>
						<select id="columnName" name="columnName">
							<c:forEach items="${desktopColumnmap}" var="t">
								<option value="${t.key}" title="${t.value}">${t.value}</option>
							</c:forEach>
						</td><td>
						</select>&nbsp;&nbsp;<span class="htbtn" id="addThisColumn" onclick="addThisColumn('${desktop}')">&nbsp;&nbsp;添加到此列</span>
					</td></tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div id="colshtml"></div>
	<div id="columnss">
        <ul id="column1" class="column">
            <li class="widget color-green" id="intro">
            </li>
            <li class="widget color-red">  
            </li>
        </ul>
        <ul id="column2" class="column">
            <li class="widget color-blue"></li>
            <li class="widget color-yellow"></li>
        </ul>
    </div>
</body>
</html>
