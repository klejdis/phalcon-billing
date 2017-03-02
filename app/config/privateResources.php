<?php

use Phalcon\Config;
use Phalcon\Logger;

return new Config([
    'privateResources' => [
        'users' => [
            'index',
            'search',
            'edit',
            'create',
            'delete',
            'changePassword'
        ],
        'profiles' => [
            'index',
            'search',
            'edit',
            'create',
            'delete'
        ],
        'permissions' => [
            'index'
        ],
        'customers' => [
            'index',
            'search',
            'edit',
            'create',
            'new',
            'delete',
            'save',
        ],

        'payments' => [
            'index',
            'search',
            'edit',
            'create',
            'new',
            'delete',
            'save',
        ],
    ]
]);
