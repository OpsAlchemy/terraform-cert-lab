<?php
$client = new GearmanClient();
$client->addServer('gearman', 4730);

$input = "Hello Gearman";
echo "Sending: $input\n";
$result = $client->doNormal('reverse', $input);
echo "Reversed: $result\n";
?>
