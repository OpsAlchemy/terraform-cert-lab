<?php
$worker = new GearmanWorker();
$worker->addServer('gearman', 4730);

$worker->addFunction('reverse', function (GearmanJob $job) {
    $input = $job->workload();
    $reversed = strrev($input);
    echo "Reversed: $reversed\n";
    return $reversed;
});

echo "Worker started...\n";
while ($worker->work());
?>
