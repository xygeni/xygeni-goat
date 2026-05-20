<?php
//.atoum.php

use mageekguy\atoum;
use mageekguy\atoum\reports;

$coveralls = new reports\asynchronous\coveralls('src', 'wms25r3w3mu4z4e8n3fzatebfuq47kake');
$defaultFinder = $coveralls->getBranchFinder();
$coveralls
        ->setBranchFinder(function() use ($defaultFinder) {
                if (($branch = getenv('TRAVIS_BRANCH')) === false)
                {
                        $branch = $defaultFinder();
                }

                return $branch;
        })
        ->setServiceName(getenv('TRAVIS') ? 'travis-ci' : null)
        ->setServiceJobId(getenv('TRAVIS_JOB_ID') ?: null)
        ->addWriter()
;
$runner->addReport($coveralls);

$script->addDefaultReport();