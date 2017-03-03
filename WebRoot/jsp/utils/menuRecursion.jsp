<%@ include file="../include/include.jsp" %>
<c:if test="${thisMenu.parent.menuChild == '1'}" >								
	<li class="dropdown ${activeMenu}"><a class="dropdown-toggle" data-toggle="dropdown" menuNum="${thisMenu.parent.menuNum}">${thisMenu.parent.menuName}<span class="fa arrow"></span></a>
		<ul class="nav nav-second-level">
			<c:forEach items="${thisMenu.children}" var="childMenu">

			<%@ include file="menuRecursion.jsp" %>
			<li><a class="menuAddr" menuNum="${childMenu.menuNum}" menuAddr="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"%>${childMenu.menuAddr}">${childMenu.menuName}</a></li>
			</c:forEach>
		</ul>
	</li>
</c:if>