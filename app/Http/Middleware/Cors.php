<?php

namespace App\Http\Middleware;

use Closure;

class Cors
{
    public function handle($request, Closure $next)
    {
        $response = $next($request);

        $response->headers->set('Access-Control-Allow-Origin', '*');
        $response->headers->set('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
        $response->headers->set('Access-Control-Allow-Headers', 'Origin, Content-Type, Accept, Authorization, X-Request-With, X-XSRF-TOKEN');

        // Handle preflight OPTIONS request
        if ($request->getMethod() === "OPTIONS") {
            $response->setStatusCode(200);
        }

        return $response;
    }
}