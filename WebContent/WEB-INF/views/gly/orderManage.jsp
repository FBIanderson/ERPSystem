<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<!-- lsq -->
<head>
<link rel="icon" href="${pageContext.request.contextPath}/image/title.png" type="image/x-icon"/>
<meta charset="utf-8" />
<title>后台管理系统</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/style.css">
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
	(function($) {
		$(window).load(
				function() {

					$("a[rel='load-content']").click(
							function(e) {
								e.preventDefault();
								var url = $(this).attr("href");
								$.get(url, function(data) {
									$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
									//scroll-to appended content 
									$(".content").mCustomScrollbar("scrollTo",
											"h2:last");
								});
							});

					$(".content").delegate(
							"a[href='top']",
							"click",
							function(e) {
								e.preventDefault();
								$(".content").mCustomScrollbar("scrollTo",
										$(this).attr("href"));
							});

				});
	})(jQuery);
</script>
</head>
<body>
	<!--header-->
	<header>
		<h1>
			<img
				src="${pageContext.request.contextPath}/assets/images/admin_logo.png" />
		</h1>
		<ul class="rt_nav">
		<li><a href="tzzup" class="set_icon">账号设置</a></li>
		
			<li><a href="tzlogin" class="quit_icon">安全退出</a></li>
		</ul>
	</header>
	<!--aside nav-->
	<!--aside nav-->
	<aside class="lt_aside_nav content mCustomScrollbar">

		<ul>
			<li>
				<dl>
					<dt>用户管理</dt>
					<!--当前链接则添加class:active-->
					<dd>
						<a href="sy">用户列表</a>
					</dd>
					<dd>
						<a href="tjyh">添加用户</a>
					</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt>客户管理</dt>
					<!--当前链接则添加class:active-->
					<dd>
						<a href="khlb" >客户列表</a>
					</dd>
					<dd>
						<a href="tjkh">添加客户</a>
					</dd>
				</dl>
			</li>
						<li>
				<dl>
					<dt>货物管理</dt>
					<dd>
						<a href="tzhw">货物列表</a>
					</dd>
					<dd>
						<a href="tzkc">库存列表</a>
					</dd>					
				</dl>
			</li>
			<li>
				<dl>
					<dt>入库管理</dt>					
					<dd>
						<a href="tzrk">新建入库单</a>
					</dd>					
					<dd>
						<a href="tzrksh">入库单审核</a>
					</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt>出库管理</dt>									
					<dd>
						<a href="tzck">新建出库单</a>
					</dd>
					<dd>
						<a href="tzcksh">出库单审核</a>
					</dd>

				</dl>
			</li>
			<li>
				<dl>
					<dt>报表管理</dt>
					<dd>
						<a href="tzbb">生成报表</a>
					</dd>
					<dd>
					    <a href="orderManage" class="active">账单管理</a>
					</dd>
				</dl>
			</li>	
		</ul>
	</aside>

	<section class="rt_wrap content mCustomScrollbar">
		<div class="rt_content">

			<section class="mtb">
			      <form action="queryCustomerByNameInOrderManage" method="post">
				         <input type="text" name="name" id="name" class="textbox textbox_225"
					    placeholder="输入客户姓名" /> 
					    <input type="submit"  value="查询" class="group_btn" />
				  </form>
			</section>
			
			 <form action="largeAmountCustomers" method="post">
					    <input type="submit"  value="批发客户" class="group_btn" />
		    </form>
		
		
			 <form action="smallAmountCustomers" method="post">
					    <input type="submit"  value="零售客户" class="group_btn" />
		    </form>
		
			<table class="table">
				<tr>
					<th>Id</th>
					<th>姓名</th>
					<th>信息更新日期</th>
					<th>联系电话</th>
					<th>客户类型</th>
					<th>应付金额</th>
					<th>是否付款</th>
					<th>付款</th>
				</tr>
				<tbody id="list">
					<c:forEach items="${list}" var="list" varStatus="num">
						<tr>
							<td id="id" class="center">${list.id}</td>
							<td id="name" class="center">${list.name}</td>
							<td id="date" class="center">${list.date}</td>
							<td id="phone" class="center">${list.phone}</td>
							<td id="t1" class="center">
							    <c:if test="${list.customerType == 0}">
									批发客户
								</c:if>
								<c:if test="${list.customerType == 1}">
									零售客户
								</c:if>
							
							</td>
							<td id="money" class="center">${list.money}</td>
							<td id="t1" class="center">
							    <c:if test="${list.pay == 0}">
									<a title="未验证" class="link_icon">&#88;</a>
								</c:if>
								<c:if test="${list.pay == 1}">
									<a title="已验证" class="link_icon">&#89;</a>
								</c:if>
							
							</td>
					
							<td class="center">
							    <a href="pay?phone=${list.phone}" title="付款"
								class="link_icon">&#101;</a> 
							</td>

						</tr>
					</c:forEach>
				</tbody>

			</table>

		</div>
	</section>

</body>
</html>
