            <!-- <div class="row">
                <div class="footer">
                        <p class="text-footer"></p>
                </div>
            </div> -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="tank/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="tank/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="tank/metisMenu/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="tank/raphael/raphael.min.js"></script>
        <script src="tank/morrisjs/morris.min.js"></script>
        <script src="data/morris-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="js/billboy.js"></script>

        <!--        Include custom date time script-->
        <script src="js/datetime.js"></script>

        <script type="text/javascript">
            
            $(function () {
                               
                $(".each_row").slice(0, 12).show();
                $("#loadMore").on('click', function (e) {
                    e.preventDefault();
                    $(".each_row:hidden").slice(0, 12).slideDown();
                    
                    if ($(".each_row:hidden").length == 0) {
                        
                        $("#load").fadeOut('slow');
                    }

                    $('html,body').animate({
                        scrollTop: $(this).offset().top
                    }, 1500);
                    
                });

                  $('[data-toggle="popover"]').popover({
                    placement : 'top',
                    trigger : 'hover',
                    html : true
                });

            });

            $('a[href=\\#top]').click(function () {
                $('body,html').animate({
                    scrollTop: 0
                }, 600);
                return false;
            });

            $(window).scroll(function () {
                
                if ($(this).scrollTop() > 100) {
                    $('.totop a').fadeIn();
                } else {
                    $('.totop a').fadeOut();
                }
            });

            $(document).ready(function(){
                
            });

        </script>

    </body>

</html>