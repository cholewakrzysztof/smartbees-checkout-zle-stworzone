<?php
    $test = $_GET["test"] ?? false;
    
    header('Access-Control-Allow-Origin: *');

    $data = json_decode($_GET["data"]);
    
    if(!$test){
        if(valid_data($data)){

            $conn = connect("localhost","root","","checkout");
            if ($conn->error) 
                die($conn->error);
                
            $order_code = gen_code($conn);
            $result = send_query($data,$conn,$order_code);

            if($result)
                echo $order_code;
        }else{
            echo "Wprowadzone dane są niepoprawne";
        }
    }

    function valid_data($data){

        if(strlen($data->name)>40 || strlen($data->name)<=0){
            return false;
        }

        if(strlen($data->surname)>40 || strlen($data->surname)<=0){
            return false;
        }

        if($data->country!="Polska" && $data->country!="Niemcy"){
            return false;
        }

        if(strlen($data->street)>40 || strlen($data->street)<=0){
            return false;
        }

        if(strlen($data->house_number)>40 || strlen($data->house_number)<=0){
            return false;
        }

        if(strlen($data->zip_code)!=6){
            return false;
        }else{
            $code = explode("-",$data->zip_code);
            if(count($code)!=2){
                return false;
            }else{
                if(!is_int(intval($code[0])) || !is_int(intval($code[1]))){
                    return false;
                }
            }
        }


        if(strlen($data->city)>40 || strlen($data->city)<=0){
            return false;
        }

        if(strlen($data->phone)!=9){
            return false;
        }else{
            if(!is_int(intval($data->phone)) || intval($data->phone)<=99999999){
                return false;
            }
        }

        if(strlen($data->deliver_type)<=0){
            return false;
        }

        if(strlen($data->payment_type)<=0){
            return false;
        }

        if($data->total<=0){
            return false;
        }
        if(!is_int($data->total)){
            return false;
        }

        if(strlen($data->comment)>250){
            return false;
        }

        return true;
    }

    function send_query($data,$conn,$order_code){
        $name = $data->name;
        $surname = $data->surname ;
        $country = $data->country;
        $street = $data-> street ;
        $house_number = $data->house_number;
        $zip_code = $data->zip_code ;
        $city = $data->city ;
        $phone= $data->phone;
        $deliver_type = $data->deliver_type;
        $payment_type = $data->payment_type;
        $discount_code = $data->discount_code;
        $total =$data ->total;
        $comment = $data->comment;
    
        $sql = "INSERT INTO orders Values(NULL,NULL,'$name','$surname','$country','$city','$zip_code','$street','$house_number','$phone','$deliver_type','$payment_type',$total,'$discount_code','$comment','$order_code')";
        $result = $conn->query($sql);
        
        return $result;
    }

    function connect($host,$user,$password,$base){
        $conn = new mysqli($host,$user,$password,$base);
        return $conn;
    }

    function gen_code($conn){ //sposób generowania kodu srawdza się jedynie do 10000 zamówień dziennie
        $today = date("Ymd");
        $sql = "SELECT id FROM orders ORDER BY id DESC LIMIT 1";
        $buffor = $conn->query($sql);
        $id = $buffor->fetch_assoc()["id"] ?? 1;
        while(strlen(strval($id))<4){
            $id = "0".$id;
        }
        if($id>9999){
            $offset = strlen(strval($id))-4;
            $id = substr(strval($id),$offset,4);
        }

        return $today.$id;
    }
?>