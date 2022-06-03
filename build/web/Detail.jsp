

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
                <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
                <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
                <link href="css/style.css" rel="stylesheet" type="text/css" />
                <style>
                    .gallery-wrap .img-big-wrap img {
                        height: 450px;
                        width: auto;
                        display: inline-block;
                        cursor: zoom-in;
                    }
                    
                    .gallery-wrap .img-small-wrap .item-gallery {
                        width: 60px;
                        height: 60px;
                        border: 1px solid #ddd;
                        margin: 7px 2px;
                        display: inline-block;
                        overflow: hidden;
                    }
                    
                    .gallery-wrap .img-small-wrap {
                        text-align: center;
                    }
                    
                    .gallery-wrap .img-small-wrap img {
                        max-width: 100%;
                        max-height: 100%;
                        object-fit: cover;
                        border-radius: 4px;
                        cursor: zoom-in;
                    }
                    
                    .img-big-wrap img {
                        width: 100% !important;
                        height: auto !important;
                    }
                </style>
            </head>

            <body>
                <jsp:include page="Menu.jsp"></jsp:include>
                <div class="container">
                    <div class="row">
                        <jsp:include page="Left.jsp"></jsp:include>
                        <div class="col-sm-9">
                            <div class="container">
                                <div class="card">
                                    <div class="row">
                                        <aside class="col-sm-5 border-right">
                                            <article class="gallery-wrap">
                                                <div class="img-big-wrap">
                                                    <div>
                                                        <a href="#"><img src="${detail.image}"></a>
                                                    </div>
                                                </div>
                                                <!-- slider-product.// -->
                                                <div class="img-small-wrap">
                                                </div>
                                                <!-- slider-nav.// -->
                                            </article>
                                            <!-- gallery-wrap .end// -->
                                        </aside>
                                        <aside class="col-sm-7">
                                            <article class="card-body p-5">
                                                <h3 class="title mb-3">${detail.name}</h3>

                                                <p class="price-detail-wrap">
                                                    <span class="price h3 text-warning">
                                                <span class="currency text-danger">US $   </span> <span class="num text-danger">${detail.price}</span>
                                                    </span>
                                                </p>
                                                <!-- price-detail-wrap .// -->
                                                <div>
                                                    <p>
                                                        <b>Product ID: </b> <span id="pid">${detail.id}</span>
                                                    </p>
                                                </div>
                                                <dl class="item-property">
                                                    <dt>Description</dt>
                                                    <dd>
                                                        <p>
                                                            ${detail.description}
                                                        </p>
                                                    </dd>
                                                </dl>

                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-5">
                                                        <dl class="param param-inline">
                                                            <dt>Quantity: </dt>
                                                            <dd>
                                                                <select id="quantity" class="form-control form-control-sm" style="width:70px;">
                                                            <option> 1 </option>
                                                            <option> 2 </option>
                                                            <option> 3 </option>
                                                            <option> 4 </option>
                                                            <option> 5 </option>
                                                            <option> 6 </option>
                                                        </select>
                                                            </dd>
                                                        </dl>
                                                        <!-- item-property .// -->
                                                    </div>
                                                    <!-- col.// -->

                                                </div>
                                                <!-- row.// -->
                                                <hr>
                                                <a id="buy" href="#" class="btn btn-lg btn-warning text-uppercase"> Add to cart</a>
                                                <script>
                                                    window.onload = () => {
                                                        $('#buy').click(() => {
                                                            let pid = $("span#pid").text();
                                                            console.log(pid);
                                                            let amount = $(':selected').val();
                                                            console.log(amount);
                                                            window.location.replace("/Project_banhang/addOrder?pid=" + pid + "&amount=" + amount);
                                                        });
                                                    }
                                                </script>
                                            </article>
                                            <!-- card-body.// -->
                                        </aside>
                                        <!-- col.// -->
                                    </div>
                                    <!-- row.// -->
                                </div>
                                <!-- card.// -->


                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="Footer.jsp"></jsp:include>
            </body>

            </html>