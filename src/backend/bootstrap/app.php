<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        //Aquí se colocan rutas que uno quiere que no pidan el token CSRF
        
        $middleware->validateCsrfTokens(except: [
           /* 'stripe/*',
            'clientes',
            'clientes/*',
            'contactos',
            'contactos/*',*/
            '*' //Este asterisco sirve para que todas las rutas (o todo lo que este a la derecha de el no pida el token)
            //Si no se puesiera el asterisco se tendría que especificar como está arriba
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();
