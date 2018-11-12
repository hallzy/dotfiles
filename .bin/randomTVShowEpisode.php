#!/usr/bin/php
<?php

// Get an array element, or die trying
function getArrayEl($arr, $el) {
  if (!array_key_exists($el, $arr)) {
    echo "API Response is invalid.\n";
    die;
  }
  return $arr[$el];
}

// We need at least 1 arg
if ($argc < 2) {
  echo "Expected a TV show as an argument\n";
  return 1;
}

// The show name will be our args
$show = $argv;

// Remove the script call from the array and change the array into a string
array_shift($show);
$show = urlencode(join(' ', $show));

// Get our API address
$url="http://api.tvmaze.com/singlesearch/shows?q=$show&embed=episodes";

// Get the JSON from the api
$json = file_get_contents($url);
if (!is_string($json)) {
  echo "Could not reach the API.\n";
  return 1;
}

// decode our json into an associative array
$json = json_decode($json, TRUE);

// Make sure our JSON decoding succeeded
if (!is_array($json)) {
  echo "Could not decode JSON\n";
  return 1;
}

$showUrl = getArrayEl($json, 'url');
$showName = getArrayEl($json, 'name');
$showEpisodes = getArrayEl($json, '_embedded');
$showEpisodes = getArrayEl($showEpisodes, 'episodes');
$numEpisodes = count($showEpisodes);

$output = "$showName [$numEpisodes] ($showUrl)\n\n";

// Get the date time of now
$now = new DateTime();
do {
  // Select a random episode from the show
  $episode = array_rand($showEpisodes);
  $episode = $showEpisodes[$episode];

  // Get the air date of that episode
  $airStamp = getArrayEl($episode, 'airstamp');
  // make sure that the random episode aired at least 2 hours ago.
  if (new DateTime($airStamp) >= $now->sub(new DateInterval('PT2H'))) {
    continue;
  }
  // Print out the episode info
  $episodeName = getArrayEl($episode, 'name');
  $episodeSeason = getArrayEl($episode, 'season');
  $episodeNum = getArrayEl($episode, 'number');
  $output .= "$episodeName -- Season $episodeSeason, Episode $episodeNum\n";
  break;
} while(1);

echo $output;
