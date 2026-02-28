<?php

function transformEmail($email) {
    $result = '';
    $i = 0;

    while ($i < strlen($email) && $email[$i] != '@') {
        if ($email[$i] == '*') {
            while ($i + 1 < strlen($email) && $email[$i + 1] != '@') {
                $i++;
            }
            $i++;
        } else if (ctype_alnum($email[$i])) {
            $result .= $email[$i];
        }
        $i++;
    }

    while ($i < strlen($email)) {
        $result .= $email[$i];
        $i++;
    }

    return $result;
}

function main() {
    $N = (int)fgets(STDIN);

    $emails = [];

    for ($i = 0; $i < $N; $i++) {
        $email = trim(fgets(STDIN));
        $transformed = transformEmail($email);
        $emails[$transformed] = true;
    }

    echo count($emails);
}

main();
?>