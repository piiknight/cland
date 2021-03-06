<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<div class="clearfix slider">
                    <ul class="pgwSlider">
                        <c:forEach items="${listSlide }" var="slide">
						<li><img src="${pageContext.request.contextPath }/files/${slide.picture }" alt="Montréal, QC, Canada" data-large-src="${pageContext.request.contextPath }/files/${slide.picture }" data-description="${slide.lname }" /></li>
						</c:forEach>


                    </ul>
                </div>

                <div class="clearfix content">
                    <div class="content_title">
                        <h2>Danh sách tìm kiếm</h2>
                    </div>
					<c:forEach items="${listNews }" var="news">
					<c:set value="${pageContext.request.contextPath }/${slugUtil.makeSlug(news.cname) }/${slugUtil.makeSlug(news.lname) }-${news.lid }.htm" var="urlNew"></c:set>
                    <div class="clearfix single_content">
                        <div class="clearfix post_date floatleft">
                            <div class="date">
                                <h3><fmt:formatDate pattern="dd" value="${news.date_create }"/></h3>
                                <p>Tháng <fmt:formatDate pattern="M" value="${news.date_create }"/></p>
                            </div>
                        </div>
                        <div class="clearfix post_detail">
                            <h2><a href="${urlNew }">${news.lname }</a></h2>
                            <div class="clearfix post-meta">
                                <p><span><i class="fa fa-clock-o"></i>${news.address }</span> <span><i class="fa fa-folder"></i> Diện tích: ${news.area }</span></p>
                            </div>
                            <div class="clearfix post_excerpt">
                                <img src="${pageContext.request.contextPath }/files/${news.picture }" alt="" />
                                <p>${stringUtil.cutDescription(news.description, 80) }</p>
                            </div>
                            <a href="${urlNew }">Đọc thêm</a>
                        </div>
                    </div>
                    </c:forEach>
                </div>

                <div class="pagination">
                    <nav>
                        <ul class="pagination">
		                    <c:if test="${not empty previous }">
					            <li ><a href="${pageContext.request.contextPath}/search/page/${previous}?search=${search }">&lsaquo;&lsaquo;&lsaquo;</a></li>
					         </c:if>
					         <c:forEach var="i" begin="${pageStart }" end="${pageEnd }">
					            <c:url var="urlPage" value="${pageContext.request.contextPath}/page/${i}?search=${search }"></c:url>
					            <li 
					            <c:if test="${page == i }">class="active-pagination"</c:if>
					            ><a href="${pageContext.request.contextPath}/search/page/${i}?search=${search }">${i } </a></li>
					         </c:forEach>
					         <c:if test="${not empty next }">
					            <li ><a href="${pageContext.request.contextPath}/search/page/${next}?search=${search }">&rsaquo;&rsaquo;&rsaquo;</a></li>
					         </c:if>
		                </ul>
                    </nav>
                </div>