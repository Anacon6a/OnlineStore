<?php
session_start();
error_reporting(0);
include('includes/config.php');
if (strlen($_SESSION['login']) == 0) {
	header('location:login.php');
} else {

	$wid = intval($_GET['del']);
	if (isset($_GET['del'])) {
		$query = mysqli_query($con, "delete from wishlist where id='$wid'");
	}

	if (isset($_GET['action']) && $_GET['action'] == "add") {
		$id = intval($_GET['id']);
		$query = mysqli_query($con, "delete from wishlist where productId='$id'");
		if (isset($_SESSION['cart'][$id])) {
			$_SESSION['cart'][$id]['quantity']++;
		} else {
			$sql_p = "SELECT * FROM products WHERE id={$id}";
			$query_p = mysqli_query($con, $sql_p);
			if (mysqli_num_rows($query_p) != 0) {
				$row_p = mysqli_fetch_array($query_p);
				$_SESSION['cart'][$row_p['id']] = array("quantity" => 1, "price" => $row_p['productPrice']);
				header('location:my-wishlist.php');
			} else {
				$message = "ID продукта недействителен";
			}
		}
	}

?>
	<!DOCTYPE html>
	<html lang="ru">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="keywords" content="MediaCenter, Template, eCommerce">
		<meta name="robots" content="all">

		<title>Избранное</title>
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
		<link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">

		<link rel="stylesheet" href="assets/css/font-awesome.min.css">

		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
	
	</head>

	<body class="cnt-home">
		<header class="header-style-1">

			<?php include('includes/top-header.php'); ?>
			<?php include('includes/main-header.php'); ?>
			<?php include('includes/menu-bar.php'); ?>

		</header>
		<div class="breadcrumb">
			<div class="container">
				<div class="breadcrumb-inner">
					<ul class="list-inline list-unstyled">
						<li><a href="index.html">Главная</a></li>
						<li class='active'>Избранное</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="body-content outer-top-bd">
			<div class="container">
				<div class="my-wishlist-page inner-bottom-sm">
					<div class="row">
						<div class="col-md-12 my-wishlist">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th colspan="4">избранное</th>
										</tr>
									</thead>
									<tbody>
										<?php
										$ret = mysqli_query($con, "select products.productName as pname,products.productName as proid,products.productImage1 as pimage,products.productPrice as pprice,products.productAvailability as ppa,products.productPriceBeforeDiscount as ppbd,wishlist.productId as pid,wishlist.id as wid from wishlist join products on products.id=wishlist.productId where wishlist.userId='" . $_SESSION['id'] . "'");
										$num = mysqli_num_rows($ret);
										if ($num > 0) {
											while ($row = mysqli_fetch_array($ret)) {
										?>
												<tr>
													<td class="col-md-2"><img src="admin/productimages/<?php echo htmlentities($row['pid']); ?>/<?php echo htmlentities($row['pimage']); ?>" alt="<?php echo htmlentities($row['pname']); ?>" width="60" height="100"></td>
													<td class="col-md-6">
														<div class="product-name"><a href="product-details.php?pid=<?php echo htmlentities($pd = $row['pid']); ?>"><?php echo htmlentities($row['pname']); ?></a></div>
														<?php $rt = mysqli_query($con, "select * from productreviews where productId='$pd'");
														$num = mysqli_num_rows($rt); {
														?>
															<div class="rating">
																<i class="fa fa-star rate"></i>
																<i class="fa fa-star rate"></i>
																<i class="fa fa-star rate"></i>
																<i class="fa fa-star rate"></i>
																<i class="fa fa-star non-rate"></i>
																<span class="review">(Отзывы <?php echo htmlentities($num); ?> )</span>
															</div>
														<?php } ?>
														<div class="price">
															<?php echo htmlentities($row['pprice']); ?>.00Руб.
															<?php if ($row['ppbd'] > 0) { ?>
																<span>
																	<?php echo htmlentities($row['ppbd']); ?>Руб.</span>
															<?php } ?>
														</div>
													</td>
													<td class="col-md-2">
														<?php if ($row['ppa'] == 'В наличии') { ?>
															
															<a href="category.php?page=product&action=add&id=<?php echo $row['id']; ?>">
																<button class="btn btn-primary" type="button">Добавить в корзину</button></a>
														<?php } else { ?>
															<div class="action" style="color:red">Нет в наличии</div>
														<?php } ?>
													</td>
													<td class="col-md-2 close-btn">
														<a href="my-wishlist.php?del=<?php echo htmlentities($row['wid']); ?>" onClick="return confirm('Удалить?')" class=""><i class="fa fa-times"></i></a>
													</td>
												</tr>
											<?php }
										} else { ?>
											<tr>
												<td style="font-size: 18px; font-weight:bold ">Список пуст</td>
											</tr>
										<?php } ?>
									</tbody>
								</table>
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
<?php } ?>