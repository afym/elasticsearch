<?php

namespace App\Action;

use App\Util\ElasticSearch;
use Interop\Http\ServerMiddleware\DelegateInterface;
use Interop\Http\ServerMiddleware\MiddlewareInterface as ServerMiddlewareInterface;
use Psr\Http\Message\ServerRequestInterface;
use Zend\Diactoros\Response\HtmlResponse;
use Zend\Expressive\Router;
use Zend\Expressive\Template;

class SearchSimpleAction implements ServerMiddlewareInterface
{
    private $template;
    private $router;

    public function __construct(Router\RouterInterface $router, Template\TemplateRendererInterface $template = null)
    {
        $this->router   = $router;
        $this->template = $template;
    }

    public function process(ServerRequestInterface $request, DelegateInterface $delegate)
    {
        $es = new ElasticSearch("elasticsearch", "9200", "ecommerce", "product");
        var_dump($es->search());
        exit;
        return new HtmlResponse($this->template->render('app::search-simple', []));
    }
}
