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

// 1.- Adding documents in indexes (indexes.php)

try {
    $params = [
        'index' => 'index_fruits',
        'type' => 'fruit',
        'id' => 'fruit' . uniqid(), // it could be auto generated if is empty
        'body' => [
            'name' => 'apple' . rand(1, 1000),
            'color' => rand(1, 5),
            'prices' => [rand(1000, 2000), rand(2000, 3000), rand(3000, 4000)]
        ]
    ];

    $response = $client->index($params);
    echo "Correct inserted \n";
} catch (Exception $exception) {
    echo "Exception : \n";
    echo $exception->getMessage() . "\n";
}

