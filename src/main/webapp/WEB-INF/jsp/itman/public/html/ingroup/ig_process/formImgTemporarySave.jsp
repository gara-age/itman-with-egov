<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php

 if($_FILES['file']['name']){
        $imageFullName = strtolower($_FILES['file']['name']);
        $imageNameSlice = explode(".", $imageFullName);
        $imageName = $imageNameSlice[0];
        $imageType = $imageNameSlice[1];
        $image_ext = array('jpg', 'jpeg', 'gif', 'png');
        if(array_search($imageType, $image_ext) === false){
            echo "<script> alert('jpg, jpeg, gif, png 확장자만 가능합니다.'); history.back();";
        }
        $dir = "../../_img/assetImg/";
        move_uploaded_file($_FILES['file']['tmp_name'], $dir.$imageFullName);

    }
    echo $imageFullName;

?>