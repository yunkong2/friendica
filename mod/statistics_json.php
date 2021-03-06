<?php

/**
 * @file mod/statistics_json.php
 */

use Friendica\App;
use Friendica\Core\Addon;
use Friendica\Core\Config;
use Friendica\Core\Logger;
use Friendica\Core\System;

function statistics_json_init(App $a) {

	if (!Config::get("system", "nodeinfo")) {
		System::httpExit(404);
	}

	$statistics = [
		"name" => Config::get('config', 'sitename'),
		"network" => FRIENDICA_PLATFORM,
		"version" => FRIENDICA_VERSION . "-" . DB_UPDATE_VERSION,
		"registrations_open" => intval(Config::get('config', 'register_policy')) !== REGISTER_CLOSED,
		"total_users" => Config::get('nodeinfo', 'total_users'),
		"active_users_halfyear" => Config::get('nodeinfo', 'active_users_halfyear'),
		"active_users_monthly" => Config::get('nodeinfo', 'active_users_monthly'),
		"local_posts" => Config::get('nodeinfo', 'local_posts')
	];

	$statistics["services"] = [];
	$statistics["services"]["appnet"] = Addon::isEnabled("appnet");
	$statistics["services"]["blogger"] = Addon::isEnabled("blogger");
	$statistics["services"]["buffer"] = Addon::isEnabled("buffer");
	$statistics["services"]["dreamwidth"] = Addon::isEnabled("dwpost");
	$statistics["services"]["gnusocial"] = Addon::isEnabled("statusnet");
	$statistics["services"]["googleplus"] = Addon::isEnabled("gpluspost");
	$statistics["services"]["libertree"] = Addon::isEnabled("libertree");
	$statistics["services"]["livejournal"] = Addon::isEnabled("ljpost");
	$statistics["services"]["pumpio"] = Addon::isEnabled("pumpio");
	$statistics["services"]["twitter"] = Addon::isEnabled("twitter");
	$statistics["services"]["tumblr"] = Addon::isEnabled("tumblr");
	$statistics["services"]["wordpress"] = Addon::isEnabled("wppost");

	$statistics["appnet"] = $statistics["services"]["appnet"];
	$statistics["blogger"] = $statistics["services"]["blogger"];
	$statistics["buffer"] = $statistics["services"]["buffer"];
	$statistics["dreamwidth"] = $statistics["services"]["dreamwidth"];
	$statistics["gnusocial"] = $statistics["services"]["gnusocial"];
	$statistics["googleplus"] = $statistics["services"]["googleplus"];
	$statistics["libertree"] = $statistics["services"]["libertree"];
	$statistics["livejournal"] = $statistics["services"]["livejournal"];
	$statistics["pumpio"] = $statistics["services"]["pumpio"];
	$statistics["twitter"] = $statistics["services"]["twitter"];
	$statistics["tumblr"] = $statistics["services"]["tumblr"];
	$statistics["wordpress"] = $statistics["services"]["wordpress"];

	header("Content-Type: application/json");
	echo json_encode($statistics, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
	Logger::log("statistics_init: printed " . print_r($statistics, true), Logger::DATA);
	exit();
}
