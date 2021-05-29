<?php
session_start();
error_reporting(0);
include('includes/config.php');
$find = "%{$_POST['product']}%";
if (isset($_GET['action']) && $_GET['action'] == "add") {
	$id = intval($_GET['id']);
	if (isset($_SESSION['cart'][$id])) {
		$_SESSION['cart'][$id]['quantity']++;
	} else {
		$sql_p = "SELECT * FROM products WHERE id={$id}";
		$query_p = mysqli_query($con, $sql_p);
		if (mysqli_num_rows($query_p) != 0) {
			$row_p = mysqli_fetch_array($query_p);
			$_SESSION['cart'][$row_p['id']] = array("quantity" => 1, "price" => $row_p['productPrice']);
			echo "<script>alert('Продукт добавлен в корзину')</script>";
			echo "<script type='text/javascript'> document.location ='my-cart.php'; </script>";
		} else {
			$message = "Product ID is invalid";
		}
	}
}

if (isset($_GET['pid']) && $_GET['action'] == "wishlist") {
	if (strlen($_SESSION['login']) == 0) {
		header('location:login.php');
	} else {
		mysqli_query($con, "insert into wishlist(userId,productId) values('" . $_SESSION['id'] . "','" . $_GET['pid'] . "')");
		echo "<script>alert('Продукт добавлен в избранное');</script>";
		header('location:my-wishlist.php');
	}
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	<meta name="keywords" content="Магазин">
	<meta name="robots" content="all">

	<title>TheMad_Store | Категории</title>

	<link rel="stylesheet" href="assets/css/bootstrap.min.css">

	<link rel="stylesheet" href="assets/css/main.css">
	<link rel="stylesheet" href="assets/css/blue.css">
	<link rel="stylesheet" href="assets/css/owl.carousel.css">
	<link rel="stylesheet" href="assets/css/owl.transitions.css">

	<link href="assets/css/lightbox.css" rel="stylesheet">
	<link rel="stylesheet" href="assets/css/animate.min.css">
	<link rel="stylesheet" href="assets/css/rateit.css">
	<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

	<link rel="stylesheet" href="assets/css/config.css">

	<link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
	<link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
	<link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
	<link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">

	<link rel="stylesheet" href="assets/css/font-awesome.min.css">

	<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>


</head>

<body class="cnt-home">

	<header class="header-style-1">
		<?php include('includes/top-header.php'); ?>
		<?php include('includes/main-header.php'); ?>
		<?php include('includes/menu-bar.php'); ?>
	</header>

	</div>
	<div class="body-content outer-top-xs">
		<div class='container'>
			<div class='row outer-bottom-sm'>
				<div class='col-md-3 sidebar'>
					<div class="side-menu animate-dropdown outer-bottom-xs">
						<div class="side-menu animate-dropdown outer-bottom-xs">
							<div class="head"><i class="icon fa fa-align-justify fa-fw"></i>Подкатегории</div>
							<nav class="yamm megamenu-horizontal" role="navigation">

								<ul class="nav">
									<li class="dropdown menu-item">
										<?php $sql = mysqli_query($con, "select id,subcategory  from subcategory");

										while ($row = mysqli_fetch_array($sql)) {
										?>
											<a href="sub-category.php?scid=<?php echo $row['id']; ?>" class="dropdown-toggle"><i class="icon fa fa-desktop fa-fw"></i>
												<?php echo $row['subcategory']; ?></a>
										<?php } ?>

									</li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="sidebar-module-container">
						<h3 class="section-title">найти по</h3>
						<div class="sidebar-filter">
							<div class="sidebar-widget wow fadeInUp outer-bottom-xs ">
								<div class="widget-header m-t-20">
									<h4 class="widget-title">Категории</h4>
								</div>
								<div class="sidebar-widget-body m-t-10">
									<?php $sql = mysqli_query($con, "select id,categoryName  from category");
									while ($row = mysqli_fetch_array($sql)) {
									?>
										<div class="accordion">
											<div class="accordion-group">
												<div class="accordion-heading">
													<a href="category.php?cid=<?php echo $row['id']; ?>" class="accordion-toggle collapsed">
														<?php echo $row['categoryName']; ?>
													</a>
												</div>
											</div>
										</div>
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class='col-md-9'>
					<div class="container-fluid">
						<br />
						<div class="caption vertical-top text-center">
							<h1>Поиск</h1>
						</div>
						<br /><br />
					</div>
				</div>

				<div class="container search-result-container">
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane active " id="grid-container">
							<div class="category-product ">
							<div class="row row-flex" style="display: flex; flex-flow: row wrap">
								<?php
								$ret = mysqli_query($con, "select * from products where productName like '$find'");
								$num = mysqli_num_rows($ret);
								if ($num > 0) {
									while ($row = mysqli_fetch_array($ret)) { ?>
										<div class="col-sm-4 wow fadeInUp">
											<div class="products">
												<div class="product">
													<div class="product-image">
														<div class="image">
															<a href="product-details.php?pid=<?php echo htmlentities($row['id']); ?>"><img src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage1']); ?>" alt="" width="200" height="300"></a>
														</div>
													</div>
													<div class="product-info text-left">
														<h3 class="name"><a href="product-details.php?pid=<?php echo htmlentities($row['id']); ?>"><?php echo htmlentities($row['productName']); ?></a></h3>
														<div class="rating rateit-small"></div>
														<div class="description"></div>
														<div class="product-price">
															<span class="price">
																<?php echo htmlentities($row['productPrice']); ?>Руб. </span>

															<?php if ($row['productPriceBeforeDiscount'] > 0) { ?>
																<span class="price-before-discount">
																	<?php echo htmlentities($row['productPriceBeforeDiscount']); ?>Руб.</span>
															<?php } ?>
														</div>
													</div>
													<div class="cart clearfix animate-effect">
														<div class="action">
															<ul class="list-unstyled">
																<li class="add-cart-button btn-group">
																	<?php if ($row['productAvailability'] == 'В наличии') { ?>
																		<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
																			<i class="fa fa-shopping-cart"></i>
																		</button>
																		<a href="category.php?page=product&action=add&id=<?php echo $row['id']; ?>">
																			<button class="btn btn-primary" type="button">Добавить в корзину</button></a>
																	<?php } else { ?>
																		<div class="action" style="color:red">Нет в наличии</div>
																	<?php } ?>

																</li>
																<li class="lnk wishlist">
																	<a class="add-to-cart" href="category.php?pid=<?php echo htmlentities($row['id']) ?>&&action=wishlist" title="В избранное">
																		<i class="icon fa fa-heart"></i>
																	</a>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									<?php }
								} else { ?>
									<div class="col-sm-6 col-md-4 wow fadeInUp">
										<h3>Товары не найдены</h3>
									</div>
								<?php } ?>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<?php include('includes/footer.php'); ?>
	<script src="assets/js/jquery-1.11.1.min.js"></script>

	<script src="assets/js/bootstrap.min.js"></script>

	<script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>

	<script src="assets/js/echo.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
	<script src="assets/js/bootstrap-slider.min.js"></script>
	<script src="assets/js/jquery.rateit.min.js"></script>
	<script type="text/javascript" src="assets/js/lightbox.min.js"></script>
	<script src="assets/js/bootstrap-select.min.js"></script>
	<script src="assets/js/wow.min.js"></script>
	<script src="assets/js/scripts.js"></script>
</body>

</html>