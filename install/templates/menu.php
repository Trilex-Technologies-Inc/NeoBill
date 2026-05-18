<?php
/*
 * @(#)install/templates/menu.php
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

	        <ul id="navlist" class="list-group small">
	            <li class="list-group-item d-flex gap-2 align-items-start">
	                <span class="text-success fw-bold"><?php echo (isset($_POST['install_step']) && $_POST['install_step'] > '0') ? '&#10003;' : '&nbsp;'; ?></span>
	                <span><?php echo _INSTALLERSTEP0; ?></span>
	            </li>
	            <li class="list-group-item d-flex gap-2 align-items-start">
	                <span class="text-success fw-bold"><?php echo (isset($_POST['install_step']) && $_POST['install_step'] > '1') ? '&#10003;' : '1.'; ?></span>
	                <span><?php echo _INSTALLERSTEP1; ?></span>
	            </li>
	            <li class="list-group-item d-flex gap-2 align-items-start">
	                <span class="text-success fw-bold"><?php echo (isset($_POST['install_step']) && $_POST['install_step'] > '2') ? '&#10003;' : '2.'; ?></span>
	                <span><?php echo _INSTALLERSTEP2; ?></span>
	            </li>
	            <li class="list-group-item d-flex gap-2 align-items-start">
	                <span class="text-success fw-bold"><?php echo (isset($_POST['install_step']) && $_POST['install_step'] > '3') ? '&#10003;' : '3.'; ?></span>
	                <span><?php echo _INSTALLERSTEP3; ?></span>
	            </li>
	            <li class="list-group-item d-flex gap-2 align-items-start">
	                <span class="text-success fw-bold"><?php echo (isset($_POST['install_step']) && $_POST['install_step'] > '4') ? '&#10003;' : '4.'; ?></span>
	                <span><?php echo _INSTALLERSTEP4; ?></span>
	            </li>
	            <li class="list-group-item d-flex gap-2 align-items-start">
	                <span class="text-success fw-bold"><?php echo (isset($_POST['install_step']) && $_POST['install_step'] > '5') ? '&#10003;' : '5.'; ?></span>
	                <span><?php echo _INSTALLERSTEP5; ?></span>
	            </li>
	            <li class="list-group-item d-flex gap-2 align-items-start">
	                <span class="text-success fw-bold"><?php echo (isset($_POST['install_step']) && $_POST['install_step'] > '6') ? '&#10003;' : '6.'; ?></span>
	                <span><?php echo _INSTALLERSTEP6; ?></span>
	            </li>
	        </ul>
