<?php
$http_or_https=(isset($_SERVER['HTTPS']) ? "https" : "http");
$start_position_of_public_word=strrpos($_SERVER['PHP_SELF'],"public/");
$end_position_of_public_word=$start_position_of_public_word+7;
$base_url=$http_or_https."://".$_SERVER['HTTP_HOST'].($start_position_of_public_word?substr($_SERVER['PHP_SELF'],0,$end_position_of_public_word):"");
header('Location: '.$base_url);