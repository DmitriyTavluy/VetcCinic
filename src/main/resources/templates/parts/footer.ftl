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
                        var myOptions = {zoom:17,center:new google.maps.LatLng(53.946290, 27.682371 ),mapTypeId: google.maps.MapTypeId.ROADMAP};map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(53.946290, 27.682371 )});infowindow = new google.maps.InfoWindow({content:'<strong>Animals best friend</strong><br>Беларусь, Минск, пр. Независимости 177<br>'});google.maps.event.addListener(marker, 'click', function(){infowindow.open(map,marker);});infowindow.open(map,marker);}google.maps.event.addDomListener(window, 'load', init_map);</script>

            </div>
            <!-- Grid column -->

            <!-- Grid column -->

            <div class="col-lg-6 footer_contact text-right">
                <p class="contact-name"><b>Матулькин А.Н. Михайловская М.С Ванский П.П</b></p>
                <p class="contact_address"> пр. Независимости, 177</p>
                <p>

                    <b>E-mail:</b>
                    <b><a style="color:#e82d3c; display: inline;"
                          href="mailto:vetclinica911@yadnex.ru">vetclinica911@yadnex.ru</a></b>
                </p>
                <a class="contact-number" href="tel:+375253455258" style="display:inline">
                    <i class="sprite sprite-call"></i>
                    +375 (29)
                    <span class="red"> 321-54-54 </span>

                </a>


            </div>
        </div>
    </div>
</footer>
<!-- Footer -->