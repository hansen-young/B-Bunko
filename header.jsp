<%
	/*1.0 Check if any user is logged in*/
	String username = (String) session.getAttribute("user_name");
	Boolean isLogged = (username != null);

	//check whether from items.jsp or not
	String category = request.getParameter("category");
%>
<header class="navbar">
	<a href="./index.jsp" class="nav_icon"></a>
	<div class="nav_content">
		<div class="nav_content_wrapper">
			<div class="nav_link">
				<div class="nav_link_wrapper">
					<a href="items.jsp?category=MG">MANGA</a>
					<a href="items.jsp?category=LN">LIGHT NOVEL</a>
				</div>
			</div>
			<div class="nav_acc">
				<% if(!isLogged){ %> 
					<a href="./login.jsp" class="button button_1">SIGN IN</a>
					<a href="./register.jsp" class="button button_2">SIGN UP</a>
				<% } else { %>
					<span class="logged_msg">Welcome, <%= username%>
						<div class="ddl_logged">
								<a href="transaction_history.jsp">Transaction</a>
								<a href="utility/doLogout.jsp">Logout</a>
						</div>
					</span>
					<div class="user_img"><%= username.charAt(0) %></div>
				<% } %>
			</div>
		</div>
	</div>
</header>
<form class="section header_search_form" id="search_form" action="./search_result.jsp">
	<div class="input_container">
		<i class="fas fa-search" onclick="submit_search_form();"></i>
		<input type="text" name="search_key" placeholder="Search" value='<%= (request.getParameter("search_key") != null) ? request.getParameter("search_key") : "" %>'>
	</div>

	<%
		if(category == null){
			%>
				<select name="search_category" required>
					<option value="" disabled selected hidden>Category</option>
					<option value="MG">Manga</option>
					<option value="LN">Light Novel</option>
				</select>
			<%
		}
		else{
			if(category.equals("LN")){
				%>	
					<select name="search_category" required>
						<option value="" disabled selected hidden>Category</option>
						<option value="LN" selected>Light Novel</option>
					</select>
				<%
			}
			else if(category.equals("MG")){
				%>
					<select name="search_category" required>
						<option value="" disabled selected hidden>Category</option>
						<option value="MG" selected>Manga</option>
					</select>
				<%
			}
		}
	%>
</form>