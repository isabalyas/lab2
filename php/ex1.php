<?php

function ex1($input) {
    $substr = '';
    $res = [];
    $state = 0;

    for ($i = 0; $i < strlen($input); $i++) {
        switch ($input[$i]) {
            case '1':
                switch ($state) {
                    case 0:
                        $state = 1;
                        $substr .= '1';
                        break;
                    case 1:
                        $state = 2;
                        $substr .= '1';
                        break;
                    case 3:
                        $substr .= '1';
                        $res[] = $substr;
                        $substr = '';
                        $state = 0;
                        break;
                    default:
                        $state = 0;
                        $substr = '';
                        break;
                }
                break;
            case '0':
                switch ($state) {
                    case 1:
                    case 2:
                    case 3:
                        $state = 3;
                        $substr .= '0';
                        break;
                    default:
                        $state = 0;
                        $substr = '';
                        break;
                }
                break;
            default:
                $state = 0;
                $substr = '';
                break;
        }
    }

    return $res;
}

function main() {

    $input = trim(fgets(STDIN));


    $result = ex1($input);

    foreach ($result as $str) {
        echo $str . "\n";
    }
}

main();
?>