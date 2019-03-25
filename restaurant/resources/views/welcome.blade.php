<?php //print_r($corns); ?>

@include('head')
@include('header') 


            <div id="page-wrapper">

                <!-- <div class="row">

                    <div class="col-lg-12">

                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-home fa-fw"></i>Home</a></li>
                            <li class="active">Table</li>                            
                        </ol>


                    </div>
                    
                </div> -->
                <!-- /.row -->

                <div class="row">

                    <div class="col-lg-10">
                        <h1 class="page-header">Menu List(<?php echo count($corns['data']);?>)</h1>
                    </div>

                    <div class="col-lg-2">

                        <div class="row">

                            <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6">
                                <div class="box-icon" id="date-box1"></div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6">
                                <div class="box-icon" id="date-box2"></div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6">
                                <div class="box-icon" id="date-box3"></div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6">
                                <div class="box-icon" id="date-box4"></div>
                            </div>

                        </div>

                    </div>
                    <!-- /.col-lg-12 -->
                </div>

                <?php if(count($corns['data'])>0) { $i=0; ?>

                <div class="row">
                    <?php foreach ($corns['data'] as $key => $item) {  $i++; ?>

                      <div class="each_row">

                        <?php if($i%4 == 1) { ?>

                            <div class="col-lg-6 col-md-6">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-2">
                                                <i class="fa fa-utensils fa-4x"></i>
                                                <div class="huge"><?php echo $item['item_price']; echo ($item['currency'] == 'pound'? '&pound;': '&euro;');?></div>
                                            </div>
                                            <div class="col-xs-10 text-right">
                                                
                                                <div><?php echo $item['item_name']; ?></div>
                                                <div><?php echo $item['item_desc']; ?></div>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="#" data-toggle="popover" title="Restaurant Details" data-content="
                                    <strong>Name:</strong><?php echo $item['res_name']; ?><br/>
                                    <strong>Address:</strong><?php echo $item['res_address']; ?><br/>
                                    <strong>Description:</strong><?php echo $item['res_desc']; ?><br/>
                                    <?php echo $item['url']; ?><br/>                          
                                    ">
                                        <div class="panel-footer">
                                            <!-- <span class="pull-left">View Details</span> -->
                                            <span class="pull-left"><?php echo $item['res_name']; ?></span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                            <div class="clearfix"></div>
                                        </div>
                                    </a>
                                </div>
                            </div>

                        <?php } elseif($i%4 == 2) { ?>

                            <div class="col-lg-6 col-md-6">
                                <div class="panel panel-green">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-2">
                                                <i class="fa fa-utensils fa-4x"></i>
                                                <div class="huge"><?php echo $item['item_price']; echo ($item['currency'] == 'pound'? '&pound;': '&euro;');?></div>
                                            </div>
                                            <div class="col-xs-10 text-right">
                                                
                                                <div><?php echo $item['item_name']; ?></div>
                                                <div><?php echo $item['item_desc']; ?></div>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="#" data-toggle="popover" title="Restaurant Details" data-content="
                                    <strong>Name:</strong><?php echo $item['res_name']; ?><br/>
                                    <strong>Address:</strong><?php echo $item['res_address']; ?><br/>
                                    <strong>Description:</strong><?php echo $item['res_desc']; ?><br/>
                                    <?php echo $item['url']; ?><br/>                                    
                                    " >
                                        <div class="panel-footer">
                                            <span class="pull-left"><?php echo $item['res_name']; ?></span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                            <div class="clearfix"></div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        <?php } elseif($i%4 == 3) { ?>

                            <div class="col-lg-6 col-md-6">
                                <div class="panel panel-yellow">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-2">
                                                <i class="fa fa-utensils fa-4x"></i>
                                                <div class="huge"><?php echo $item['item_price']; echo ($item['currency'] == 'pound'? '&pound;': '&euro;');?></div>
                                            </div>
                                            <div class="col-xs-10 text-right">
                                                
                                                <div><?php echo $item['item_name']; ?></div>
                                                <div><?php echo $item['item_desc']; ?></div>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="#" data-toggle="popover" title="Restaurant Details" data-content="
                                    <strong>Name:</strong><?php echo $item['res_name']; ?><br/>
                                    <strong>Address:</strong><?php echo $item['res_address']; ?><br/>
                                    <strong>Description:</strong><?php echo $item['res_desc']; ?><br/>
                                    <?php echo $item['url']; ?><br/>                                    
                                    " >
                                        <div class="panel-footer">
                                            <span class="pull-left"><?php echo $item['res_name']; ?></span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                            <div class="clearfix"></div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        <?php } else { ?>

                            <div class="col-lg-6 col-md-6">
                                <div class="panel panel-red">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-2">
                                                <i class="fa fa-utensils fa-4x"></i>
                                                <div class="huge"><?php echo $item['item_price']; echo ($item['currency'] == 'pound'? '&pound;': '&euro;');?></div>
                                            </div>
                                            <div class="col-xs-10 text-right">                        
                                                <div><?php echo $item['item_name']; ?></div>
                                                <div><?php echo $item['item_desc']; ?></div>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="#" data-toggle="popover" title="Restaurant Details" data-content="
                                    <strong>Name:</strong><?php echo $item['res_name']; ?><br/>
                                    <strong>Address:</strong><?php echo $item['res_address']; ?><br/>
                                    <strong>Description:</strong><?php echo $item['res_desc']; ?><br/>
                                    <?php echo $item['url']; ?><br/>                                    
                                    " >
                                        <div class="panel-footer">
                                            <span class="pull-left"><?php echo $item['res_name']; ?></span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                            <div class="clearfix"></div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                     <?php } ?>
                
                     </div>

                    <?php } ?>  

                    
                    </div>

                    <!-- /.row -->

                    <div style="width: 200px; text-align: center; margin: 0 auto; height: 30px;">
                    <a href="#" style="margin: 10px 0;" id="loadMore">Load More</a>

                        <p class="totop"> 
                            <a href="#top">Back to top</a> 
                        </p>
                    </div>

            <?php } else { ?>

            <?php } ?>
                


@include('footer')
