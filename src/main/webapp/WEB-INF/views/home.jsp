<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html>

    <head>
        <title>AQI Data Table</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
        .bg-image{
            background-image: url("https://i.imgur.com/aqj5tRz.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            background-size:auto;

        }
        </style>
    </head>

    <body class="bg-image" style="background-color: #F0F2F5;">
        <div class="d-flex align-content-center" style="height: 650px; width: 100%;">
            <div
                class="rounded-3 p-5 text-white text-center border border-1 border-black col-lg-5 col-sm-12 mx-auto my-auto shadow">
    
                <div class="my-2 bg-danger col-lg-12 col-sm-10 rounded-3 border border-1 border-black">
                    <h1>Air Qualitys Index</h1>
                    <p style="font-size:medium;">Real-time Air Quality data feed</p>
                </div>
    
                <div class="d-flex col-lg-9 col-sm-auto mx-auto p-2">
                    <form class="d-flex w-100  mx-auto" method="post" action="feeds">
                        <input type="text" name="cityname" placeholder="Enter city name" class=" p-2 col-10">
                        <button class="btn btn-primary fa fa-search bg-primary rounded-0 flex-fill " type="submit"></button>
                    </form>
                </div>
            </div>
        </div>
    </body>
    </html>