<?php

return [
    'trace' => \app\http\middleware\ResponseJsonTraceManage::class,
    'b2b2c_domain' => \app\http\middleware\B2b2cDomainManage::class,
];