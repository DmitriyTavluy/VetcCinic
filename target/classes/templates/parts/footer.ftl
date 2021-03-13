<!-- Footer -->
<footer class="page-footer font-small footer-bg">

    <!-- Footer Links -->
    <div class="text-center text-md-left mt-5">

        <!-- Grid row -->
        <div class="row mt-3">

            <!-- Grid column -->
            <div class="col-lg-6">

                <!-- Content -->
                <script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script>
                <div style='overflow:hidden;height:370px;width:660px;'>
                    <div id='gmap_canvas' class="map-footer" style='height:350px;width:660px;'></div>
                    <style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div>
                <script type='text/javascript'>function init_map(){
                        var myOptions = {zoom:17,center:new google.maps.LatLng(53.8644479,27.6834253 ),mapTypeId: google.maps.MapTypeId.ROADMAP};map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(53.8644479,27.6834253 )});infowindow = new google.maps.InfoWindow({content:'<strong>Animals best friend</strong><br>Беларусь, Минск, ул. Байкальска 66/1<br>'});google.maps.event.addListener(marker, 'click', function(){infowindow.open(map,marker);});infowindow.open(map,marker);}google.maps.event.addDomListener(window, 'load', init_map);</script>

            </div>
            <!-- Grid column -->

            <!-- Grid column -->

            <div class="col-lg-6 footer_contact text-right">
                <p class="contact-name"><b>Тавлуй Д.В.</b></p>
                <p class="contact_address"><b>ул. Байкальская 66/1</b></p>
                <p>

<#--                    <b>E-mail:</b>-->
                    <a style="color:#2d81ec; display: inline;"
                          href="mailto:dmitriytavluy@gmail.com">dmitriytavluy@gmail.com</a>
                </p>
                <a class="contact-number" href="tel:+375298295603" style="display:inline">
                    <i class="sprite sprite-call"></i>
                    +375 (29)
                    <span class="red"> 829-56-03 </span>

                </a>


            </div>
        </div>
    </div>
</footer>
<!-- Footer -->