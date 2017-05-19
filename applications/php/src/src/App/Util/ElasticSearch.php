<?php

namespace App\Util;

use GuzzleHttp\Client;


class ElasticSearch
{
    private $host;
    private $port;
    private $index;
    private $type;
    private $protocol;

    public function __construct($host, $port, $index, $type)
    {
        $this->host = $host;
        $this->port = ":{$port}";
        $this->index = $index;
        $this->type = $type;
        $this->protocol = "http://";
    }

    public function search()
    {
        $client = new Client([
            'base_uri' => "{$this->buildUrl()}",
        ]);

        $response = $client->request('GET', "/{$this->buildSegment()}/_search", [
            'headers'  => [
                'Content-Type' => 'application/json'
            ],
            'body' => ""
        ]);

        return $response->getBody()->getContents();
        /*
         *
curl -XGET "http://elasticsearch:9200/ecommerce/product/_search" -H 'Content-Type: application/json' -d'
''
         * */
    }

    public function setHttps()
    {
        $this->protocol = "https://";
    }

    private function buildUrl() {

        if ($this->port == "80") {
            $this->port = "";
        }

        return "{$this->protocol}{$this->host}{$this->port}";
    }

    private function buildSegment()
    {
        return "{$this->index}/{$this->type}";
    }

    private function buildClient()
    {
        return new Client($this->buildUrl());
    }
}