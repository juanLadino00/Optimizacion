void plotAllLineSegments(){
 for(int i=0;i<points.length;i++){
  for(int j=0;j<points.length;j++){
   if(i!=j){
    line(points[i][0],points[i][1],points[j][0],points[j][1]);
   }
  }
 }
}

void plotAllTriangles(){
 for(int i=0;i<points.length;i++){
  for(int j=0;j<points.length;j++){
    for(int k = 0; k<points.length;k++){
      if(i!=j && j!= k && k != i){
    //line(points[i][0],points[i][1],points[j][0],points[j][1]);
     stroke(0);
     fill(150,150);
      beginShape(TRIANGLES);
      vertex(points[i][0], points[i][1]);
      vertex(points[j][0], points[j][1]);
      vertex(points[k][0],points[k][1]);
      endShape(CLOSE);
    }
   }
  }
 }
}
