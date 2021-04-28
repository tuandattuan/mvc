<%-- 
    Document   : view
    Created on : Apr 23, 2021, 4:09:15 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Add Students</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>

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
                    <h2 class="text-center" >Add/Update Product</h2>
                </div>
                <div class="panel-body">
                    <form method="post" action="save.html">
                        <div class="form-group">
                            <label for="usr">Name:</label>
                            <input value="${product.id}" type="text" class="form-control" name="id" id="id" hidden="true"/>
                            <input required="true" value="${product.title}" type="text" class="form-control" name="title" id="usr"/>
                        </div>
                        <div class="form-group">
                            <label for="thumbnail">Thumbnail:</label>
                            <input required="true" value="${product.thumbnail}" type="text" class="form-control" name="thumbnail" id="thumbnail"/>
                        </div> 
                        <div class="form-group">
                            <label for="price">Price:</label>
                            <input value="${product.price}" type="number" class="form-control" name="price" id="price"/>
                        </div>
                        <div class="form-group">
                            <label for="discount">Discount:</label>
                            <input value="${product.discount}" type="number" class="form-control" name="discount" id="discount"/>
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
<!--                            <textarea class="form-control" value="${product.content}" id="description" name="description"></textarea>-->
                            <input value="${product.content}" type="text" class="form-control" name="description" id="description">
                        </div>
                        
                            <button class="btn btn-success">Save</button>
                        
                    </form>
                </div>
            </div>
        </div>



    </body>
</html>
