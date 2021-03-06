<!DOCTYPE HTML>

<html>
	<head>
		<title> </title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.dropotron.min.js"></script>
		<script src="js/jquery.scrollgress.min.js"></script>
		<script src="js/jquery.scrolly.min.js"></script>
		<script src="js/jquery.slidertron.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<link rel="stylesheet" href="css/skel.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/style-xlarge.css" />
		<link rel="stylesheet" href="css/table.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
		<script>
				var xhttp = new XMLHttpRequest();
				xhttp.open("POST","${rest_endpoint}",true);
				xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				xhttp.send();
		</script>
	</head>
	<body class="landing">

		<!-- Header -->
			<header id="header" class="alt skel-layers-fixed">
				<h1><a href="index.html">Workspace Reaper</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li>
							<a href="" class="icon fa-angle-down">Layouts</a>
							<ul>
								<li><a href="left-sidebar.html">Left Sidebar</a></li>
								<li><a href="right-sidebar.html">Right Sidebar</a></li>
								<li><a href="no-sidebar.html">No Sidebar</a></li>
								<li>
									<a href="">Submenu</a>
									<ul>
										<li><a href="#">Option 1</a></li>
										<li><a href="#">Option 2</a></li>
										<li><a href="#">Option 3</a></li>
										<li><a href="#">Option 4</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li><a href="elements.html">Elements</a></li>
					</ul>
				</nav>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<h2>Workspace Reaper</h2>
					<p id="destroyed"></p>
					<ul class="actions">
						<li><a href="#one" class="button big scrolly">More Details</a></li>
					</ul>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style1">
				<div class="container">
					<header class="major">
						<h2>Workspace Details</h2>
						<p>
						<table id="workspaceTable" class="tg">
							<tr>
							  <th class="tg-0pky">Workspace</th>
							  <th class="tg-0pky">Resources Destroyed</th>
							  <th class="tg-0pky">Last Start Time</th>
							  <th class="tg-0pky">Last End Time</th>
							  <th class="tg-0pky">Length</th>
							</tr>
							
							
						  </table>
						</p>
					</header>
			</section>
			
		<!-- Footer -->
			<footer id="footer">
				<p id="demo"></p>
			</footer>
			<script>
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						
						var results = JSON.parse(this.responseText)
						desiredValues = ['workspaceName','destruction_count','runStarted','complete','runTime']
						document.getElementById("destroyed").innerHTML = "We've Destroyed " + results.destructions + " Resources so far!"
						table = document.getElementById("workspaceTable")
						var i;
						var y;
						for (i=0; i < results.workspaces.length; i++) {
							var workspace = results.workspaces[i]
							var tr = document.createElement("tr")
							for (y=0; y < desiredValues.length; y++) {
								var td = document.createElement("td");
								var txt = document.createTextNode(workspace[desiredValues[y]]);
								td.appendChild(txt);
								tr.appendChild(td);
							}
							table.appendChild(tr);
						}
						
					}
				};
			</script>
	</body>
</html>