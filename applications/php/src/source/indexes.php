<?php

require_once dirname(__DIR__) . '/vendor/autoload.php';

// examples in : https://www.elastic.co/guide/en/elasticsearch/client/php-api/current/_configuration.html

$hosts = [
    'elasticsearch:9200'
];

use Elasticsearch\ClientBuilder;

$client = ClientBuilder::create()
    ->setHosts($hosts)
    ->setRetries(2)
    ->build();

// 1.- Creating indexes in a simple way

$params = ['index' => 'index_' . uniqid()];

try {
    $response = $client->indices()->create($params);
    print_r($response);
    echo "Index correct created \n";
} catch (Exception $exception) {
    echo "Exception : \n";
    echo $exception->getMessage() . "\n";
}

// 2.- Getting index information

$params = ['index' => 'index_fruits'];

try {
    $response = $client->indices()->getSettings($params);
    print_r($response);
} catch (Exception $exception) {
    echo "Exception : \n";
    echo $exception->getMessage() . "\n";
    echo "Creating index : \n";
    $response = $client->indices()->create($params);
    print_r($response);
}