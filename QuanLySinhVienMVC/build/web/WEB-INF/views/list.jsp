<%-- 
    Document   : list
    Created on : Apr 22, 2021, 6:27:14 PM
    Author     : Admin
--%>

<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Add Students</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center" >Danh Sách Sản Phẩm</h2>
                </div>
                <div class="panel-body">
                    <table class="table table bordered">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Thumbnail</th>
                                <th>Title</th>
                                <th>Price</th>
                                <th>Discount</th>
                                <th>Content</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${productList}" varStatus="loop" >
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td> <img src="${item.thumbnail}" width="100px" </td>
                                    <td>${item.title}</td>
                                    <td>${item.price}</td>
                                    <td>${item.discount}</td>
                                    <td>${item.content}</td>
                                    <td>
                                        <a href="view.html?id=${item.id}">
                                            <button class="btn btn-warning">Edit</button>
                                        </a>
                                    </td>
                                    <td>
                                        <button class="btn btn-danger" onclick="deleteProduct(${item.id})">Delete</button>
                                       
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>             
                    </table>
                    <a href="view.html">
                        <button class="btn btn-success">Add product</button>
                    </a>
                </div>
            </div>
        </div>
        
        <script>
            function deleteProduct(id) {
                $.post('delete.html',{
                id: id
            }, function(data) {
                location.reload()
            })
            }
        </script>


    </body>
</html>
