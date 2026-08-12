<?php
/*
 * @(#)install/templates/header.php
 *
 *    Version: 0.50.20090326
 * Written by: John Diamond <mailto:jdiamond@solid-state.org>
 * Written by: Yves Kreis <mailto:yves.kreis@hosting-skills.org>
 *
 * Copyright (C) 2006-2008 by John Diamond
 * Copyright (C) 2009 by Yves Kreis
 *
 * This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License 
 * as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program; if not, write to the 
 * Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 *
*/
?>
<!doctype html>
<html lang="<?php echo _ISOLANGUAGECODE; ?>">

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="style/neobill.css" type="text/css" />
	<link rel="stylesheet" href="style/bootstrap-overrides.css" type="text/css" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content="Open Source Customer Management and Billing Software for Web Hosts" />
	<meta name="robots" content="index, follow" />
	<meta name="resource-type" content="document" />
	<meta http-equiv="expires" content="0" />
	<meta name="author" content="John Diamond" />
	<meta name="author" content="Yves Kreis" />
	<meta name="copyright" content="Copyright (C) 2006-2008 by John Diamond" />
	<meta name="copyright" content="Copyright (C) 2009 by Yves Kreis" />
	<meta name="revisit-after" content="1 days" />
	<meta name="distribution" content="global" />
	<meta name="rating" content="general" />
	<title>NeoBill :: Open Source Customer Management and Billing Software for Web Hosts</title>
</head>

<body class="bg-light">
	<div id="content1" class="container py-4">
		<div id="content2" class="card shadow-sm">
			<div class="card-body">
				<div class="row g-4">
					<aside class="col-12 col-md-3">
						<h5 class="mb-2"><?php echo _INSTALLERSTEPS; ?></h5>
						<?php include "templates/menu.php"; ?>
						<div class="card mt-3">
							<div class="card-body p-3">
								<?php include "templates/help.php"; ?>
							</div>
						</div>
					</aside>
					<main class="col-12 col-md-9">
						<div class="d-flex align-items-center justify-content-between mb-3">
							<div class="d-flex align-items-center gap-2">
								<img src="images/logo.png" alt="NEOBILL" style="max-height: 48px;" />
							</div>
						</div>
						<?php include "templates/graph.php"; ?>