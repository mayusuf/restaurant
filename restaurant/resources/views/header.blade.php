<nav class="navbar navbar-default navbar-fixed-top"  style="margin-bottom: 0">
              
                <!-- <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    
                    
                </div> -->

               <!-- <a class="navbar-brand" href="index.html">Search Favourite Menu</a> -->
               
               <form class="form-inline my-2 my-lg-0" name='menuitem' method="post" action="{{ action('MenuController@menuitem') }}">

                    <input class="form-control mr-sm-2" type="search" value="<?php echo $corns['search_str']; ?>" name="item_name" placeholder="search menu/dishes" aria-label="search menu/dishes">

                    <input class="form-control mr-sm-2" type="search" value="<?php echo $corns['search_desc']; ?>" name="item_desc" placeholder="search ingredients" aria-label="search ingredients">

                    <select class="form-control mr-sm-2" name="category">
                      <option value=""></option>

                      <?php foreach ($corns['cat'] as $item) { ?>  

                        <option value="<?php echo $item['cat_id']; ?>" <?php if($item['cat_id'] == $corns['search_cat']) echo "selected";?> ><?php echo $item['cat_name']; ?>                          
                        </option>

                      <?php } ?>

                    </select>
                    <input name="_token" type="hidden" value="{{ csrf_token() }}"/>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
               </form>                
            
</nav>