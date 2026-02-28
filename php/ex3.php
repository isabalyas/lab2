<?php
    $input = fgets(STDIN);
    $N = (int)$input;

    $sum = 0;
    $product = 1;
    while ($N > 0) {
        $sum += $N % 10;
        $product *= $N % 10;
        $N = (int)($N / 10);
    }

    echo "$sum $product " . abs($sum - $product) . "\n";
?>