<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
    <head>
        <title>AQI Data Table</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
        .bg-image{
            background-image: url("https://i.imgur.com/aqj5tRz.jpeg");
            background-repeat: no-repeat;
            background-size:auto auto;
        }

        
        @media only screen and (max-width: 980px) { /* small screen */
            .divWH{
                height: 1875px;
                width: 850px;
            }

            .DHW   {
                height: 80%;
                width: 100%;
            }
        }

        @media only screen and (min-width: 980px) { /* wide screen */
            .divWH{
                height: 700px;
                width: 1420px;
            }

            .DHW   {
                height: 75%;
                width: 75%;
            }
        }

        </style>
    </head>

    <body class="bg-image" style="background-color: #F0F2F5;">
        <div class="divWH d-flex justify-content-lg-center mx-auto">

            <div class="DHW row mx-auto my-auto border-1 border border-black shadow text-white text-center">
                <div class="mt-sm-auto mb-5 bg-danger w-75 mx-auto">
                    <span class="display-1">Air Qualitys Index</span><br>
                    <span class="display-6">Real-time Air Quality data feed</span>
                </div>
                
                <div class="mx-auto mb-lg-auto h-auto col-lg-10 col-sm-12">
                    <form class="d-flex w-100 mx-auto" method="post" action="feeds">
                        <input type="text" name="cityname" placeholder="Enter city name" class=" p-lg-2 p-sm-4 col-10">
                        <button class="btn btn-primary fa fa-search bg-primary rounded-0 flex-fill " type="submit"></button>
                    </form>
                </div>
            </div>

        </div>
    </body>
    </html>