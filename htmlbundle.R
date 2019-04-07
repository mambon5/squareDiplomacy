#doing things for html stuff
bareman='<span class="leg1"></span><span class="leg2"></span><span class="arms"></span><span class="body"></span><span class="head">:)</span>'
mancount=2
placeman=''

#map 1
for( top in seq(70,400,55)) {
  row = (top-70)/55+1;
  cat(paste("<!-- Row ",row," --> \n"))
  for(left in seq(50,380,55)) {
    column = (left - 50)/55+1;
    terrain='class="earth" onmouseover="bigImgE(this)" onmouseout="normalImgE(this)"';
    if(column-1==row || column==row || column+1==row) {
      n = sample(3,1); 
      if(n==1) terrain='class="water"';
    }
    if(terrain=='class="earth" onmouseover="bigImgE(this)" onmouseout="normalImgE(this)"') {
        n = sample(10,1); 
        if(n==1) terrain='class="mineral"';
        if(mancount>0 & n==10) {placeman=bareman; mancount=mancount-1;}
    }
    
      if(placeman==bareman) {
      x = paste0('<div ',terrain,' onclick="deletePers(this)" style="top:',top,'px;left:',left,'px">',placeman,'</div>');
      }
      else{ if(terrain=='class="earth" onmouseover="bigImgE(this)" onmouseout="normalImgE(this)"') {
        x = paste0('<div ',terrain,' onclick="appearPers(this)" style="top:',top,'px;left:',left,'px">',placeman,'</div>'); 
        }
        else 
          x = paste0('<div ',terrain,' style="top:',top,'px;left:',left,'px">',placeman,'</div>'); 
      }
      cat(x); cat("\n"); placeman='';
  }
}
